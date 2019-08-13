%% EEG / BCI paradigm
% author: András Bohn, bohn.andras.benedek@hallgato.ppke.hu
% upgrader: Csaba Köllõd, kollod.csaba@itk.ppke.hu
% version: 3.2
clear all;
close all;

% THINGS TO SET:
lang = 'hun'; % eng, hun
text_size = 40; % MAX 40
setup = 'portable'; % lab, protable
screen_num = 2; % 0, 1, 2
CONTINUE_FROM_MIXED_ITERATION = 0; % if something goes wrong, and you have to restart the paradigm, 
                                   % you can specify where do you want to continue...
                                   
%% other parameters
DEBUG = true;
% USE_SHORT_TIME = false;

Psycho_path = 'C:\Users\Csabi\AppData\Roaming\MathWorks\MATLAB Add-Ons\Collections\Psychtoolbox-3\Psychtoolbox-3-Psychtoolbox-3-1621645\Psychtoolbox\PsychBasic\MatlabWindowsFilesR2007a\';

% constants
HAND = 'hand';
FOOT = 'foot';
MIXED = 'hand_foot';
MOTOR_MOVEMENT = '_m';
IMAGINED_MOVEMENT = '_mi';
SEQ_LENGTH = 4;
NUM_MIXED = 10;
global LANGUAGE;

%% INIT
LANGUAGE = load_language(lang);

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

%%  PRELUDE - Initialize the environment
try  % Time info    
    trigger_sender.setup = setup;
    [ioObj, out_address, in_address] = init_parallel_port();
    trigger_sender.in_address = in_address;
    switch setup
        case 'portable'
            addpath(Psycho_path);
            trigger_sender = init_portable_setup(trigger_sender, 'localhost', 6700);
            
        case 'lab'
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
    
    %%  ACT 2 - Right / Left hand 
    seq = create_rnd_seq(2,SEQ_LENGTH);
    session(window_handle, rect, trigger_sender, timing, seq, HAND, {MOTOR_MOVEMENT, IMAGINED_MOVEMENT});
  
    %%  ACT 3 - Right / Left foot
    seq = create_rnd_seq(2, SEQ_LENGTH);
    session(window_handle, rect, trigger_sender, timing, seq, FOOT, {MOTOR_MOVEMENT, IMAGINED_MOVEMENT});
    end
    
    %%  ACT 4 - Imagined MIXED
    for i = CONTINUE_FROM_MIXED_ITERATION:NUM_MIXED
        show_counter(i, NUM_MIXED, window_handle,rect);
        mixed_ind = i;
        if wait_and_check_esc(1)
            new_scene('end', window_handle, rect);
        end
        
        seq = create_rnd_seq(4, SEQ_LENGTH);
        session(window_handle, rect, trigger_sender, timing, seq, MIXED, {IMAGINED_MOVEMENT});
    end

    %%  FINALE
    send_trigger('paradigm_end', trigger_sender); 
    new_scene('thanks', window_handle, rect);
    wait_and_check_esc(timing('pause'))
    new_scene('end', window_handle, rect);

catch
    if strcmp(setup, 'portable')
        stop_recording(trigger_sender.bv_rcc);
        close_recorder(trigger_sender.bv_rcc);
    end
    
    send_trigger('esc_record', trigger_sender);
    ShowCursor;
    Screen('CloseAll');
    if mixed_ind > 0
        fprintf('\n\nESC button pressed during MIXED session %d\nIt is suggested to continue here.\nset CONTINUE_FROM_MIXED_ITERATION to %d\n\n', mixed_ind, mixed_ind); 
    end
    if DEBUG
        psychrethrow(psychlasterror);
    end
end