function trigger_sender = init_portable_setup(trigger_sender, ip, port)
%INIT_PORTABLE_SETUP initialize bci record setup
%   This function opens BrainVision Recorder and also BrainVision Remote
%   Control
program = 'RemoteControlServer.exe';
[~, result] = system(['tasklist /FI "imagename eq ' program '" /fo table /nh']);
if contains(result, program)
    !taskkill -f -im RemoteControlServer.exe
end
! C:\Vision\RemoteControlServer\RemoteControlServer.exe &

rcc = bv_rcc(ip, port);
trigger_sender.bv_rcc = rcc;

open_recorder(rcc);
wait_till_open(rcc);

% h = actxserver('WScript.Shell');
% h.AppActivate('Recorder');

view_impedance(rcc);
wait_till_acquisition(rcc);
WaitSecs(0.5);

% if ~is_recording(rcc)
%     exp = [];
%     subj = [];
%     while isempty(exp) || isempty(subj)
%         answer = savedialogbox;
%         exp = answer{1,1};
%         subj = answer{1,2};
%         if isempty(exp) || isempty(subj)
%             d = warndlg('Both ExperimentNumber and SubjectID should be filled!');
%             uiwait(d);
%         end
%     end
%     experiment_num(rcc, exp);
%     subject_id(rcc, subj);
%     start_recording(rcc)
% end

d = msgbox({'1) Check electrode impedance!';'';...
    '2) Start record, with play button and save the file with "rec01" name';...
    '     into the correct folder';'';...
    '3) If (1) and (2) are done, press ok.'},...
    'Information', 'warn');
uiwait(d);
start_recording(rcc);
end
  
   