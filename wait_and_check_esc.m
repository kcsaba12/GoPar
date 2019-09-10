function exit = wait_and_check_esc(t_in_sec)
    exit = false;
    startTime=WaitSecs(0);
    while ~exit && startTime + t_in_sec > WaitSecs(0)
        [~, keyCode] = KbWait([], 2 ,startTime + t_in_sec);
        key = find(keyCode);
        if key == 27 % ESC - exit form program
            exit = true;
        elseif key == 32 % space - make a step forward else continue...
            t_in_sec = 0;
        end
    end
end