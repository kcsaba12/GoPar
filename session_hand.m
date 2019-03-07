function session_hand(window_handle, rect, ioObj, in_address, out_address, timing, sequence)
new_scene('task_hand', window_handle, rect);

if (wait_for_user_response(in_address))
%if (wait_for_user_response(ioObj, in_address))
        new_scene('end', window_handle);
        return
end
new_scene('3_2_1', window_handle, rect);

sequence = [1,0,0,1,0,1,1,0];

% send trigger via parallel port
send_trigger('session_start', ioObj, out_address);

for i = 1:length(sequence)
    
    % Display task for 'run' s
    if sequence(i) == 0 % LEFT HAND
        
        % M run
        % show current task
        new_scene('left_hand_m_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                   % 0.2s                   START
        % wait til task ends
        WaitSecs(timing('fixation'));                                                     % 4                      
        
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger('left_hand_m', ioObj, out_address); 
        % wait til task ends
        WaitSecs(timing('run'));
        % send end trigger
        send_trigger('task_end', ioObj, out_address);% 'fixation' s
        
        % MI run
        % show current task
        new_scene('left_hand_mi_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                  % 0.2s
        % wait til task ends
        WaitSecs(timing('fixation'));
        
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger('left_hand_mi', ioObj, out_address); 
        % wait til task ends
        WaitSecs(timing('run'));
        % send end trigger
        send_trigger('task_end', ioObj, out_address);
               
        
    else % RIGHT HAND
        
        % M run
        % show current task
        new_scene('right_hand_m_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                   % 0.2s                   START
        % wait til task ends
        WaitSecs(timing('fixation'));                                                     % 4                      
        
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger('right_hand_m', ioObj, out_address); 
        % wait til task ends
        WaitSecs(timing('run'));
        % send end trigger
        send_trigger('task_end', ioObj, out_address);% 'fixation' s
        
        % MI run
        % show current task
        new_scene('right_hand_mi_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                  % 0.2s
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
        send_trigger('task_end', ioObj, out_address);                     % 0.2s
    end
end
end