function exit = wait_and_check_keyboard(t_in_sec)
    exit = false;
    if getkeywait(t_in_sec) == 27 %ESC
        exit = true;
    end
end