function session(window_handle, rect, trigger_sender, timing, sequence, task, exe_type)

new_scene(['task_', task], window_handle, rect);

if (wait_for_user_response(trigger_sender.in_address))
% if (wait_for_user_response(ioObj, in_address))
        new_scene('end', window_handle, rect);
        return
end

new_scene('3_2_1', window_handle, rect);

% send trigger via parallel port
send_trigger('session_start', trigger_sender);

% tic
for seq = sequence
    
    % Display task for 'run' s
    if mod(seq, int8(2)) == 0 % RIGHT HAND
        side = 'right';
    else
        side = 'left';
    end
    
    tsk = task;
    if  contains(task, '_') % ~isempty(strfind(task, '_'))
        if idivide(seq-1, int8(2)) < 1
            tsk = 'hand';
        else 
            tsk = 'foot';
        end
    end
    
    for type = exe_type
        % show current task
        new_scene([side, '_', tsk, type{:}, '_text'], window_handle, rect);
        % send trigger
        send_trigger('rest', trigger_sender);
        
        % wait til task ends 4s                    
        if wait_and_check_esc(timing('fixation') - 0.2)
            new_scene('end', window_handle, rect);
            return
        end
      
        % Fixation cross - executing the task
        % show fixation cross 
        new_scene('fixation_cross', window_handle, rect);
        % send trigger
        send_trigger([side, '_', tsk, type{:}] , trigger_sender);       % 0.2 s
        % wait til task ends
        if wait_and_check_esc(timing('run')-0.2)
            new_scene('end', window_handle, rect);
            return
        end
    end
end
send_trigger('session_end', trigger_sender);% 'fixation' s
% toc
end