function [w, rect] = init_screen(debug)
     if ~exist('debug','var')
          debug = false;
     end
    Screen('Preference', 'SkipSyncTests', 2);
    
    if debug
        [w,rect] = Screen ('OpenWindow', 0, [255,255,255], [0,0,800,600]);
    else
        %Screen('Preference', 'SkipSyncTests', 0)
        [w,rect] = Screen ('OpenWindow', 0);
        HideCursor;
    end
end