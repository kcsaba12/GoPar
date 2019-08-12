function send_trigger(option, trigger_sender)
switch trigger_sender.setup
    case 'portable'
        send_trigger_to_local_host(option, trigger_sender.bv_rcc)
    case 'lab'
        send_trigger_parallel(option, trigger_sender.ioObj, trigger_sender.out_address)
end
end

function send_trigger_to_local_host(option, bv_rcc)
switch option
    case 'rest'
        trigger(bv_rcc,'1');
    case 'open_eye'
        trigger(bv_rcc,'2');
    case 'closed_eye'
        trigger(bv_rcc,'3');
    case 'right_hand_m'
        trigger(bv_rcc,'4');
    case 'right_hand_mi'
        trigger(bv_rcc,'5');
    case 'left_hand_m'
        trigger(bv_rcc,'6');
    case 'left_hand_mi'
        trigger(bv_rcc,'7');
    case 'right_foot_m'
        trigger(bv_rcc,'8');
    case 'right_foot_mi'
        trigger(bv_rcc,'9');
    case 'left_foot_m'
        trigger(bv_rcc,'10');
    case 'left_foot_mi'
        trigger(bv_rcc,'11');
    case 'session_end'
        trigger(bv_rcc,'12');
    case 'task_end'
        trigger(bv_rcc,'13');
    case 'paradigm_start'
        trigger(bv_rcc,'14');
    case 'paradigm_end'
        trigger(bv_rcc,'15');
    case 'session_start'
        trigger(bv_rcc,'16');
    case 'esc_record'
        trigger(bv_rcc,'17');
    otherwise
        error('Wrong input parameter in send_trigger function');
end %switch

WaitSecs(0.2);
end

function send_trigger_parallel(option, ioObj, out_address)
% This function sends the type of the trigger to the parallel port
% Approximate running time: ~0.2s - WHY????
% 
% Scenario:
% - Session start
% - Fixation cross
% - Task
% - Task end
% - Session end

%option
switch option
    case 'rest'
        io64(ioObj,out_address,1);
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
    case 'right_foot_mi'
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
    case 'esc_record'
        io64(ioObj,out_address,17);
    otherwise
        error('Wrong input parameter in send_trigger function');
end %switch

WaitSecs(0.2);
io64(ioObj, out_address, 0);

end