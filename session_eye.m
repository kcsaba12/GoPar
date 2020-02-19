function session_eye(window_handle, rect, trigger_sender, timing, sequence)
% Present the task

new_scene('task_eye', window_handle, rect);

if (wait_for_user_response())
    new_scene('end', window_handle, rect);
    return
end

send_trigger('session_start', trigger_sender); 
new_scene('3_2_1', window_handle, rect);

for i = 1:length(sequence)
    % Display task for 'eye' s
    if sequence(i) == 0
        task = 'open';
    else
        task = 'closed';
    end
 
    new_scene([task, '_eye'], window_handle, rect);
    send_trigger('rest', trigger_sender);                    % 0.2s                   FIX

    if wait_and_check_esc(timing('fixation') - 0.2)
        new_scene('end', window_handle, rect);
        return
    end% 'fixation' s
    
    new_scene('fixation_cross', window_handle, rect);
    send_trigger([task, '_eye'], trigger_sender);                      % 0.2s                   START

    % Wait than send trigger
    if wait_and_check_esc(timing('eye') - 0.2)
        new_scene('end', window_handle, rect);
        return
    end
        
%     send_trigger('task_end', ioObj, out_address);                          % 0.2s                   END

%     if wait_and_check_esc(0.2)
%         new_scene('end', window_handle, rect);
%         return
%     end                                                                    % 0.2s

end
Beeper('low');
send_trigger('session_end', trigger_sender);

end