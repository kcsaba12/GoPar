function exit = wait_and_check_esc(t_in_sec)
    exit = false;
    startTime=WaitSecs(0);
    [~, keyCode] = KbWait([], 0 ,startTime+t_in_sec);
    if find(keyCode) == 27 %ESC
        exit = true;
    end
end