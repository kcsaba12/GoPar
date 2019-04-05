function session_eye(window_handle, rect, ioObj, in_address, out_address, timing, sequence)
% Present the task

new_scene('task_eye', window_handle, rect);

if (wait_for_user_response(in_address))
    new_scene('end', window_handle, rect);
    return
end

send_trigger('session_start', ioObj, out_address); 
new_scene('3_2_1', window_handle, rect);

for i = 1:length(sequence)
    % Display task for 'eye' s
    if sequence(i) == 0
        task = 'open';
    else
        task = 'closed';
    end
 
    new_scene([task, '_eye'], window_handle, rect);
    send_trigger('rest', ioObj, out_address);                    % 0.2s                   FIX

    if wait_and_check_esc(timing('fixation') - 0.2)
        new_scene('end', window_handle, rect);
        return
    end% 'fixation' s
    
    new_scene('fixation_cross', window_handle, rect);
    send_trigger([task, '_eye'], ioObj, out_address);                      % 0.2s                   START

    % Wait than send trigger
    if wait_and_check_esc(timing('eye') - 0.2)
        new_scene('end', window_handle, rect);
        return
    end
    
    Beeper('low');
%     send_trigger('task_end', ioObj, out_address);                          % 0.2s                   END

%     if wait_and_check_esc(0.2)
%         new_scene('end', window_handle, rect);
%         return
%     end                                                                    % 0.2s

end

send_trigger('session_end', ioObj, out_address);

end