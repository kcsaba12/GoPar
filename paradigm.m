%##############################################
% EEG / BCI paradigm v200 
%  TODOs: 
%       - changes eyes open/close task to be only 2 runs not 4
%       - write different callable function for different session types
%           o session_eye
%           o session_hand
%           o session_foot
%           o session_mixed_mis
%##############################################

TEST = false;
SEQFOLDER = 'sequences/';
addpath(SEQFOLDER);

time_keySet = {'run','fixation','pause','eye'};
if TEST
    time_valueSet = [1,1,1,1];
else
    time_valueSet = [3.8,3,3,60]; % run:3.8,fixation:3,pause:3,eye:60
end
timing = containers.Map(time_keySet, time_valueSet);

try
                                                                           % Time info
% % -----------------------------------
% %  PRELUDE - Initialize the environment
% % -----------------------------------
[ioObj, out_address, in_address] = init_parallel_port();
[window_handle, rect] = init_screen();
 
new_scene('black', window_handle);
 
% if ~TEST
 
% -----------------------------------
%  INTRODUCTION - Present the task of ACT 1
% -----------------------------------

new_scene('welcome', window_handle, rect);
send_trigger('paradigm_start', ioObj, out_address); 
WaitSecs(2);
new_scene('black', window_handle, rect);
% '1'
% 
% % % -----------------------------------                                                                               
% % %  ACT 1 - Eyes open / eyes closed
% % % -----------------------------------
session_eye(window_handle, rect, ioObj, in_address, out_address, timing, [0,1]);
'2'
% % -----------------------------------
% %  ACT 2 - Right / Left hand MI task
% % -----------------------------------
seq = load('sequence_hand.mat');
session(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence, 'hand', ['_m', '_mi']);

% '3'
% % % -----------------------------------
% % %  ACT 3 - Right / Left foot MI task
% % % -----------------------------------
seq = load('sequence_foot.mat');
session(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence, 'foot', ['_m', '_mi']);
% '4'
% % -----------------------------------
% %  ACT 4 - Right / Left hand / foot MI task
% % -----------------------------------
% %1x
for j = 0:2
    for i = 1:5
        show_counter(i,window_handle,rect);
        if wait_and_check_keyboard(1)
            new_scene('end', window_handle);
            return
        end
        seq = load('sequence_mixed_mi_0' + int2str(10*j+i) + '.mat');
        session(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence, 'hand_foot', ['_mi']);
    end
    % % -----------------------------------
    % % PAUSE
    % % -----------------------------------
    %wait_for_user_response(in_address);
end

% -----------------------------------                                                                               
%  ACT 1 - Eyes open / eyes closed
% -----------------------------------
session_eye(window_handle, rect, ioObj, in_address, out_address, timing, [0,1]);

% -----------------------------------
%  FINALE
% -----------------------------------
send_trigger('paradigm_end', ioObj, out_address); 
new_scene('thanks', window_handle, rect);
WaitSecs(pause);
new_scene('end', window_handle);

%else
    
%end %if TEST

catch
    ShowCursor;
    Screen('CloseAll');
end