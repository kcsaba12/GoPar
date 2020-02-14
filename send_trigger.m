function send_trigger(option, trigger_sender)
switch trigger_sender.setup
    case 'portable'
        send_trigger_to_local_host(option, trigger_sender.bv_rcc)
    case 'lab'
        send_trigger_parallel(option, trigger_sender.ioObj, trigger_sender.out_address)
    case 'epoc'
        send_trigger_to_epoc(option, trigger_sender.s)
    otherwise
        error([setup, ' setup is not defined.'])
end


function send_trigger_to_epoc(option, serial)
    global trigger_list;
    fprintf(serial, 12);
switch option
    case 'rest'
        trigger_list{end+1} = 'Stimulus/S  1';
    case 'open_eye'
        trigger_list{end+1} = 'Stimulus/S  2';
    case 'closed_eye'
        trigger_list{end+1} = 'Stimulus/S  3';
    case 'task_1_m'
        trigger_list{end+1} = 'Stimulus/S  4'; % RIGHT hand - check in language!
    case 'task_1_mi'
        trigger_list{end+1} = 'Stimulus/S  5'; % RIGHT hand - check in language!
    case 'task_2_m'
        trigger_list{end+1} = 'Stimulus/S  6';
    case 'task_2_mi'
        trigger_list{end+1} = 'Stimulus/S  7';
    case 'task_3_m'
        trigger_list{end+1} = 'Stimulus/S  8';
    case 'task_3_mi'
        trigger_list{end+1} = 'Stimulus/S  9';
    case 'task_4_m'
        trigger_list{end+1} = 'Stimulus/S 10';
    case 'task_4_mi'
        trigger_list{end+1} = 'Stimulus/S 11';
    case 'session_end'
        trigger_list{end+1} = 'Stimulus/S 12';
    case 'task_end'
        trigger_list{end+1} = 'Stimulus/S 13';
    case 'paradigm_start'
        trigger_list{end+1} = 'Stimulus/S 14';
    case 'paradigm_end'
        trigger_list{end+1} = 'Stimulus/S 15';
    case 'session_start'
        trigger_list{end+1} = 'Stimulus/S 16';
    case 'esc_record'
        trigger_list{end+1} = 'Stimulus/S 17';
    otherwise
        error('Wrong input parameter in send_trigger function');
end %switch

WaitSecs(0.2);
end

function send_trigger_to_local_host(option, bv_rcc)
switch option
    case 'rest'
        trigger(bv_rcc,'S  1');
    case 'open_eye'
        trigger(bv_rcc,'S  2');
    case 'closed_eye'
        trigger(bv_rcc,'S  3');
    case 'task_1_m'
        trigger(bv_rcc,'S  4'); % RIGHT hand - check in language!
    case 'task_1_mi'
        trigger(bv_rcc,'S  5'); % RIGHT hand - check in language!
    case 'task_2_m'
        trigger(bv_rcc,'S  6');
    case 'task_2_mi'
        trigger(bv_rcc,'S  7');
    case 'task_3_m'
        trigger(bv_rcc,'S  8');
    case 'task_3_mi'
        trigger(bv_rcc,'S  9');
    case 'task_4_m'
        trigger(bv_rcc,'S 10');
    case 'task_4_mi'
        trigger(bv_rcc,'S 11');
    case 'session_end'
        trigger(bv_rcc,'S 12');
    case 'task_end'
        trigger(bv_rcc,'S 13');
    case 'paradigm_start'
        trigger(bv_rcc,'S 14');
    case 'paradigm_end'
        trigger(bv_rcc,'S 15');
    case 'session_start'
        trigger(bv_rcc,'S 16');
    case 'esc_record'
        trigger(bv_rcc,'S 17');
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
    case 'task_1_m'
        io64(ioObj,out_address,4);
    case 'task_1_mi'
        io64(ioObj,out_address,5);
    case 'task_2_m'
        io64(ioObj,out_address,6);
    case 'task_2_mi'
        io64(ioObj,out_address,7);
    case 'task_3_m'
        io64(ioObj,out_address,8);
    case 'task_3_mi'
        io64(ioObj,out_address,9);
    case 'task_4_m'
        io64(ioObj,out_address,10);
    case 'task_4_mi'
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
end