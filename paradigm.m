%% EEG / BCI paradigm v2
% config variables
clear all;
close all;

DEBUG = true;
% USE_SHORT_TIME = false;  
% addpath('C:\Users\Csabi\AppData\Roaming\MathWorks\MATLAB Add-Ons\Collections\Psychtoolbox-3\Psychtoolbox-3-Psychtoolbox-3-1621645\Psychtoolbox\PsychBasic\MatlabWindowsFilesR2007a\');

lang = 'hun'; % eng, hun

% constants
SEQUENCE_FOLDER = 'sequences/';
HAND = 'hand';
FOOT = 'foot';
MIXED = 'hand_foot';
MOTOR_MOVEMENT = '_m';
IMAGINED_MOVEMENT = '_mi';
global LANGUAGE;

%% INIT
LANGUAGE = load_language(lang);
if ~exist('DEBUG','var')
    DEBUG = false;
end
if ~exist('USE_SHORT_TIME','var')
    USE_SHORT_TIME = DEBUG;
end

addpath(SEQUENCE_FOLDER);
time_keySet = {'run','fixation','pause','eye'};

if USE_SHORT_TIME
    deb_time = 1;
    time_valueSet = [deb_time,deb_time,deb_time,deb_time];
else
    time_valueSet = [3.8,3,3,60]; % run:3.8,fixation:3,pause:3,eye:60
end
timing = containers.Map(time_keySet, time_valueSet);

%%  PRELUDE - Initialize the environment
try  % Time info    

    [ioObj, out_address, in_address] = init_parallel_port();
    [window_handle, rect] = init_screen(DEBUG);

    new_scene('black', window_handle, rect);

    %%  INTRODUCTION - Present the task of ACT 1

    new_scene('welcome', window_handle, rect);
    send_trigger('paradigm_start', ioObj, out_address); 
    if wait_and_check_esc(2)
        new_scene('end', window_handle, rect);
        return
    end
    new_scene('black', window_handle, rect);

    %%  ACT 1 - Eyes open / eyes closed
    session_eye(window_handle, rect, ioObj, in_address, out_address, timing, [0,1]);
    
    %%  ACT 2 - Right / Left hand 
    seq = load('sequence_hand.mat');
    session(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence, HAND, {MOTOR_MOVEMENT, IMAGINED_MOVEMENT});
    
    %%  ACT 3 - Right / Left foot
    seq = load('sequence_foot.mat');
    session(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence, FOOT, {MOTOR_MOVEMENT, IMAGINED_MOVEMENT});
    
    %%  ACT 4 - Imagined MIXED 

    for j = 0:1
        for i = 1:5
            %show_counter(i+j*5,window_handle,rect);
            if wait_and_check_esc(1)
                new_scene('end', window_handle, rect);
                return
            end
            seq = load(['sequence_mixed_mi_', num2str(10*j+i, '%03d'), '.mat']);
            session(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence, MIXED, {IMAGINED_MOVEMENT});
        end
        %% PAUSE - moved to session?
        % wait_for_user_response(in_address);
    end

    %%  FINALE
    send_trigger('paradigm_end', ioObj, out_address); 
    new_scene('thanks', window_handle, rect);
    if wait_and_check_esc(timing('pause'))
        new_scene('end', window_handle, rect);
        return
    end
    new_scene('end', window_handle, rect);

catch
    ShowCursor;
    Screen('CloseAll');
    if DEBUG
        psychrethrow(psychlasterror);
    end
end