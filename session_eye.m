function session_eye(window_handle, rect, ioObj, in_address, out_address, timing, sequence)
% Present the task
'10'
new_scene('task_eye', window_handle, rect);
'11'
if (wait_for_user_response(in_address))
        new_scene('end', window_handle);
        return
end
'12'
send_trigger('session_start', ioObj, out_address); 
new_scene('3_2_1', window_handle, rect);
'13'
for i = 1:length(sequence)
 
    new_scene('fixation_cross', window_handle, rect);
    '14'
    send_trigger('fixation_cross', ioObj, out_address);                    % 0.2s                   FIX
    '15'
    if wait_and_check_keyboard(timing('fixation'))
        return
    end% 'fixation' s
    '16'
    % Display task for 'eye' s
    if sequence(i) == 0
        % Open eye
        '17'
        send_trigger('open_eye', ioObj, out_address);                      % 0.2s                   START
        '18'
        new_scene('open_eye', window_handle, rect);
        '19'
    else
        % Close eye
        send_trigger('closed_eye', ioObj, out_address);                    % 0.2s
        '19'
        new_scene('closed_eye', window_handle, rect);
        '20'
    end
    
    % Wait than send trigger
    WaitSecs(timing('eye'));
    '21'
    send_trigger('task_end', ioObj, out_address);                          % 0.2s                   END
    '22'
    Beeper('low');
    '23'
    WaitSecs(0.2);                                                         % 0.2s
    '24'
end
'25'
send_trigger('session_end', ioObj, out_address);
'26'
end