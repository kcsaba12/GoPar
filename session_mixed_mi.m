function session_mixed_mi(window_handle, rect, ioObj, in_address, out_address, timing, sequence)

new_scene('task_hand_foot', window_handle, rect);

if (wait_for_user_response(in_address))
        new_scene('end', window_handle);
        return
end
new_scene('3_2_1', window_handle, rect);

%sequence = [2,2,3,2,2,3,2,0,3,3,3,3,2,0,2,0,0,0,0,0,1,1,3,1,1,0,2,1,1,2,3,3,0,0,3,2,3,2,1,3,2,3,0,0,2,3,2,1,0,1,2,1,2,3,0,3,1,0,3,2,3,1,1,1,0,0,3,1,2,1,0,0,3,1,0,2,2,1,1,1];

% send trigger via parallel port
send_trigger('session_start', ioObj, out_address);

for i = 1:length(sequence)
    
    % Display task for 'run' s
    switch sequence(i) 
        case 1% LEFT HANDs
        
        new_scene('left_hand_mi_text', window_handle, rect);
        send_trigger('fixation_cross', ioObj, out_address);                % 0.2s
        WaitSecs(timing('fixation'));
        
        new_scene('fixation_cross', window_handle, rect);
        send_trigger('left_hand_mi', ioObj, out_address); 
        WaitSecs(timing('run'));
        send_trigger('task_end', ioObj, out_address);                      % 0.2s
        
        case 3% LEFT FOOT MI
        % show current task
        new_scene('left_foot_mi_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                % 0.2s
        % wait til task ends
        WaitSecs(timing('fixation'));
        
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger('left_foot_mi', ioObj, out_address); 
        % wait til task ends
        WaitSecs(timing('run'));
        % send end trigger
        send_trigger('task_end', ioObj, out_address);
        
        case 2 % RIGHT HAND
        
        % show current task
        new_scene('right_hand_mi_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                % 0.2s
        % wait til task ends
        WaitSecs(timing('fixation'));
        
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger('right_hand_mi', ioObj, out_address); 
        % wait til task ends
        WaitSecs(timing('run'));
        % send end trigger
        send_trigger('task_end', ioObj, out_address); 
        
        case 4 % RIGHT FOOT MI
        % show current task
        new_scene('right_foot_mi_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                % 0.2s
        % wait til task ends
        WaitSecs(timing('fixation'));
        
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger('rigth_foot_mi', ioObj, out_address); 
        % wait til task ends
        WaitSecs(timing('run'));
        % send end trigger
        send_trigger('task_end', ioObj, out_address);                      % 0.2s
        
        otherwise
            'ERROR!'
    end%switch
end
end