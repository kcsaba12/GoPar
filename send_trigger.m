function send_trigger(option, ioObj, out_address)
% This function sends the type of the trigger to the parallel port
% Approximate running time: ~0.2s - WHY????
% 
% Scenario:
% - Session start
% - Fixation cross
% - Task
% - Task end
% - Session end
switch option
    case 'fixation_cross'
        '140'
        io64(ioObj,out_address,1);
        '141'
    case 'open_eye'
        io64(ioObj,out_address,2);
    case 'closed_eye'
        io64(ioObj,out_address,3);
    case 'right_hand_m'
        io64(ioObj,out_address,4);
    case 'right_hand_mi'
        io64(ioObj,out_address,5);
    case 'left_hand_m'
        io64(ioObj,out_address,6);
    case 'left_hand_mi'
        io64(ioObj,out_address,7);
    case 'right_foot_m'
        io64(ioObj,out_address,8);
    case 'rigth_foot_mi'
        io64(ioObj,out_address,9);
    case 'left_foot_m'
        io64(ioObj,out_address,10);
    case 'left_foot_mi'
        io64(ioObj,out_address,11);
    case 'session_end'
        io64(ioObj,out_address,12);
    case 'task_end'
        io64(ioObj,out_address,13);
    case 'paradigm_start'
        io64(ioObj,out_address,14);
    case 'paradigm_end'
        io64(ioObj,out_address,15);
    case 'session_start'
        io64(ioObj,out_address,16);
    otherwise
        '142'
        error('Wrong input parameter in send_trigger function');
end %switch
'143'
WaitSecs(0.2); % why????????????????????????
'144'
io64(ioObj, out_address, 0);
'145'
end