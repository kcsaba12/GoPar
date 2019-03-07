function [w, rect] = init_screen()
    %Initialize screen
    Screen('Preference', 'SkipSyncTests', 2);
    [w,rect] = Screen ('OpenWindow', 0);
    HideCursor;
end