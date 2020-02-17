%% EEG / BCI paradigm
% developer: Csaba Köllõd, kollod.csaba@itk.ppke.hu
% base code: András Bohn, bohn.andras.benedek@hallgato.ppke.hu
% version: 4
clear all;
close all;

% THINGS TO SET:
lang = 'hun'; % eng, hun
text_size = 39; % MAX 40
paradigm_tasks = 'd';
    % a - RIGHT hand, LEFT hand, RIGHT foot, LEFT foot
    % b - RIGHT hand, LEFT hand, BOOTH hands, BOOTH foots
    % c - RIGHT hand, LEFT hand, BOOTH foots, CALM
    % d - ACTIVE, CALM
setup = 'epoc'; 
    % lab - setup with 2 separated computers: paradigm and recorder
    % protable - setup for one computer with BV Remote Control Server
    % epoc - setup for Emotiv Epoc+
screen_num = 2; 
    % 0 - booth displayers 
    % 1 - displayer #1
    % 2 - displayer #2
CONTINUE_FROM_MIXED_ITERATION = 0; 
    % If something goes wrong, and you have to restart the paradigm, 
    % you can specify where do you want to continue...
PRERECORD_FOR_GAME_PLAY = true;
    % If true the real-imagined training will be left out and the number of
    % mixed sessions will be decreased to 5.
                                   
%% other parameters
% DEBUG = true;
% USE_SHORT_TIME = true;

Psycho_path = 'C:\Users\Csabi\AppData\Roaming\MathWorks\MATLAB Add-Ons\Collections\Psychtoolbox-3\Psychtoolbox-3-Psychtoolbox-3-1621645\Psychtoolbox\PsychBasic\MatlabWindowsFilesR2007a\';

% constants
TASK_12 = '12';
TASK_34 = '34';
MIXED = 'mixed_1234';
MOTOR_MOVEMENT = 'm';
IMAGINED_MOVEMENT = 'mi';
SEQ_LENGTH = 4;
DO_REAL_IMAGINE_TRAINING = true;
    % If it is false real-imagined movement training will be left out.
NUM_MIXED = 10;
    % Number of mixed iteration. Default is false.
global LANGUAGE;
global trigger_list;

%% INIT
LANGUAGE = load_language(lang,  paradigm_tasks);
trigger_list = {};

if PRERECORD_FOR_GAME_PLAY
    DO_REAL_IMAGINE_TRAINING = false;
    NUM_MIXED = 5;
end

if ~exist('DEBUG','var')
    DEBUG = false;
end
if ~exist('USE_SHORT_TIME','var')
    USE_SHORT_TIME = DEBUG;
end

time_keySet = {'run','fixation','pause','eye'};

if USE_SHORT_TIME
    deb_time = .3; % + .2 = .5 sec
    time_valueSet = [deb_time,deb_time,deb_time,deb_time];
else
    time_valueSet = [4,3,3,60]; % run:3.8,fixation:3,pause:3,eye:60
end
timing = containers.Map(time_keySet, time_valueSet);

if CONTINUE_FROM_MIXED_ITERATION < 0
    CONTINUE_FROM_MIXED_ITERATION = 0;
elseif CONTINUE_FROM_MIXED_ITERATION > NUM_MIXED
    CONTINUE_FROM_MIXED_ITERATION = NUM_MIXED;
end
mixed_ind = 0;
esc_hit = false;

%%  PRELUDE - Initialize the environment
try  % Time info    
    trigger_sender.setup = setup;
    
    switch setup
        case 'portable'
            addpath(Psycho_path);
            trigger_sender = init_portable_setup(trigger_sender, 'localhost', 6700);
            
        case 'epoc'
            addpath(Psycho_path);
            d = msgbox({'Start EmotivXavierTestBench!';' ';'CHECK marker!!!'},'Information', 'help');
            uiwait(d);
            trigger_sender.s = serial('COM4', 'BaudRate', 19200,'DataBits', 8, 'Terminator','CR');
            fopen(trigger_sender.s);
            
        case 'lab'
            [ioObj, out_address, in_address] = init_parallel_port();
            trigger_sender.in_address = in_address;
            d = warndlg('Start BrainVisionRecorder!','Information');
            uiwait(d);
            trigger_sender.ioObj = ioObj;
            trigger_sender.out_address = out_address;
           
        otherwise
            error([setup, ' setup is not defined.'])
    end
    
    [window_handle, rect] = init_screen(text_size, screen_num, DEBUG);
    %sound_handle = init_soundout();

    new_scene('black', window_handle, rect);

    %%  INTRODUCTION - Present the task of ACT 1
    new_scene('welcome', window_handle, rect);
    send_trigger('paradigm_start', trigger_sender); 
    if wait_and_check_esc(2)
        new_scene('end', window_handle, rect);
    end
    new_scene('black', window_handle, rect);
    
    if CONTINUE_FROM_MIXED_ITERATION == 0
        CONTINUE_FROM_MIXED_ITERATION = CONTINUE_FROM_MIXED_ITERATION + 1;
        
    %%  ACT 1 - Eyes open / eyes closed
        session_eye(window_handle, rect, trigger_sender, timing, [0,1]);
    
        if DO_REAL_IMAGINE_TRAINING
    %%  ACT 2 - Task 1/2 
            seq = create_rnd_seq([1 2], SEQ_LENGTH);
            session(window_handle, rect, trigger_sender, timing, seq, TASK_12, {MOTOR_MOVEMENT, IMAGINED_MOVEMENT});
  
    %%  ACT 3 - Task 3/4
            seq = create_rnd_seq([3 4], SEQ_LENGTH);
            session(window_handle, rect, trigger_sender, timing, seq, TASK_34, {MOTOR_MOVEMENT, IMAGINED_MOVEMENT});
        end
    end
    
    %%  ACT 4 - Imagined MIXED
    for i = CONTINUE_FROM_MIXED_ITERATION:NUM_MIXED
        show_counter(i, NUM_MIXED, window_handle,rect);
        mixed_ind = i;
        if wait_and_check_esc(1)
            new_scene('end', window_handle, rect);
        end
        
        seq = create_rnd_seq(1:4, SEQ_LENGTH);
        session(window_handle, rect, trigger_sender, timing, seq, MIXED, {IMAGINED_MOVEMENT});
    end

    %%  FINALE
    send_trigger('paradigm_end', trigger_sender); 
    new_scene('thanks', window_handle, rect);
    wait_and_check_esc(timing('pause'))
    new_scene('end', window_handle, rect);

catch
    send_trigger('esc_record', trigger_sender);
    esc_hit = true;
end  

if strcmp(setup, 'portable')
    stop_recording(trigger_sender.bv_rcc);
    close_recorder(trigger_sender.bv_rcc);
    pause(1);
    !taskkill -f -im RemoteControlServer.exe
end

if strcmp(setup, 'epoc')
    save triggers trigger_list
    fclose(trigger_sender.s);
end

if esc_hit && mixed_ind > 0
    fprintf('\n\nESC button pressed during MIXED session %d\nIt is suggested to continue here.\nset CONTINUE_FROM_MIXED_ITERATION to %d\n\n', mixed_ind, mixed_ind); 
end

ShowCursor;
Screen('CloseAll');

if DEBUG
    psychrethrow(psychlasterror);
end
