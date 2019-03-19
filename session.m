function session(window_handle, rect, ioObj, in_address, out_address, timing, sequence, task, exe_type)

new_scene(['task_', task], window_handle, rect);

if (wait_for_user_response(in_address))
%if (wait_for_user_response(ioObj, in_address))
        new_scene('end', window_handle, rect);
        return
end
new_scene('3_2_1', window_handle, rect);

%sequence = [2,2,3,2,2,3,2,0,3,3,3,3,2,0,2,0,0,0,0,0,1,1,3,1,1,0,2,1,1,2,3,3,0,0,3,2,3,2,1,3,2,3,0,0,2,3,2,1,0,1,2,1,2,3,0,3,1,0,3,2,3,1,1,1,0,0,3,1,2,1,0,0,3,1,0,2,2,1,1,1];

% send trigger via parallel port
send_trigger('session_start', ioObj, out_address);

for seq = sequence
    
    % Display task for 'run' s
    if mod(seq, int8(2)) == 0 % RIGHT HAND
        side = 'right';
    else
        side = 'left';
    end
    
    tsk = task;
    if contains(task, '_')
        if idivide(seq-1, int8(2)) < 1
            tsk = 'hand';
        else 
            tsk = 'foot';
        end
    end
    
    for type = exe_type
        % M run
        % show current task
        new_scene([side, '_', tsk, type{:}, '_text'], window_handle, rect);
        % send trigger
        send_trigger('fixation_cross', ioObj, out_address);                   % 0.2s                   START
        % wait til task ends 4s                    
        if wait_and_check_esc(timing('fixation'))
            new_scene('end', window_handle, rect);
            return
        end
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger([side, '_', tsk, type{:}] , ioObj, out_address); 
        % wait til task ends
        if wait_and_check_esc(timing('run'))
            new_scene('end', window_handle, rect);
            return
        end
        % send end trigger
        send_trigger('task_end', ioObj, out_address);% 'fixation' s
    end
end
end