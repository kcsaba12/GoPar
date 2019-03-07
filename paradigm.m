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
session_hand(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence); 
% '3'
% % % -----------------------------------
% % %  ACT 3 - Right / Left foot MI task
% % % -----------------------------------
seq = load('sequence_foot.mat');
session_foot(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
% '4'
% % -----------------------------------
% %  ACT 4 - Right / Left hand / foot MI task
% % -----------------------------------
% %1x
show_counter(1,window_handle,rect);
WaitSecs(1);
% '5'
seq = load('sequence_mixed_mi_001.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
% '6'
% %2x
show_counter(2,window_handle,rect);
% '7'
WaitSecs(1);
seq = load('sequence_mixed_mi_002.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
% '8'
% %3x
show_counter(3,window_handle,rect);
% '9'
WaitSecs(1);
seq = load('sequence_mixed_mi_003.mat');
% '_10'
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
% '_11'
% %4x
show_counter(4,window_handle,rect);
% '_12'
WaitSecs(1);
seq = load('sequence_mixed_mi_004.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
% '_13'
% %5x
show_counter(5,window_handle,rect);
% '_14'
WaitSecs(1);
seq = load('sequence_mixed_mi_005.mat');
% '_15'
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);

% % -----------------------------------
% % PAUSE
% % -----------------------------------
%wait_for_user_response(in_address);

% -----------------------------------
%  ACT 4 - Right / Left hand / foot MI task
% -----------------------------------
%1x
'_16'
show_counter(6,window_handle,rect);
WaitSecs(1);
'_17'
seq = load('sequence_mixed_mi_011.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
'_18'
%2x
show_counter(7,window_handle,rect);
'_19'
WaitSecs(1);
seq = load('sequence_mixed_mi_012.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
'_20'
%3x
show_counter(8,window_handle,rect);
'_21'
WaitSecs(1);
seq = load('sequence_mixed_mi_013.mat');
'_22'
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%4x
'_23'
show_counter(9,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_014.mat');
'_24'
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%5x
show_counter(10,window_handle,rect);
'_25'
WaitSecs(1);
seq = load('sequence_mixed_mi_015.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
'_26'
%6x
show_counter(11,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_016.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);

% -----------------------------------
% PAUSE
% -----------------------------------
%wait_for_user_response(in_address);

% -----------------------------------
%  ACT 4 - Right / Left hand / foot MI task
% -----------------------------------
%1x
show_counter(12,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_021.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%2x
show_counter(13,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_022.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%3x
show_counter(14,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_023.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%4x
show_counter(15,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_024.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%5x
show_counter(16,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_025.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);
%6x
show_counter(17,window_handle,rect);
WaitSecs(1);
seq = load('sequence_mixed_mi_026.mat');
session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, seq.sequence);

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