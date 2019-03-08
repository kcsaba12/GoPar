function session_hf(window_handle, rect, ioObj, in_address, out_address, timing, sequence, task)
new_scene('task_' + task, window_handle, rect);

if (wait_for_user_response(in_address))
%if (wait_for_user_response(ioObj, in_address))
        new_scene('end', window_handle);
        return
end
new_scene('3_2_1', window_handle, rect);

% sequence = [1,0,0,1,0,1,1,0];

% send trigger via parallel port
send_trigger('session_start', ioObj, out_address);

for i = 1:length(sequence)
    
    % Display task for 'run' s
    if mod(sequence(i),2) == 0 % RIGHT HAND
        side = 'right';
    else
        side = 'left';
    end
    for j = 1:2
        if j == 1
            type = '_m';
        else
            type = '_mi';
        end
        % M run
        % show current task
        new_scene(side + '_' + task + type + '_text', window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                   % 0.2s                   START
        % wait til task ends 4s                    
        if wait_and_check_keyboard(timing('fixation'))
            new_scene('end', window_handle);
            return
        end
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger(side + '_' + task + type , ioObj, out_address); 
        % wait til task ends
        if wait_and_check_keyboard(timing('run'))
            new_scene('end', window_handle);
            return
        end
        % send end trigger
        send_trigger('task_end', ioObj, out_address);% 'fixation' s
    end
end
end