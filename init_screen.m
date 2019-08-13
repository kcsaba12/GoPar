function [w, rect] = init_screen(text_size, screen_num, debug)
     if ~exist('debug','var')
          debug = false;
     end
     
    %Screen('Preference', 'VisualDsebuglevel', 3);
    %Screen('Preference', 'SkipSyncTests', 2);
    
    if debug
        [w,rect] = Screen ('OpenWindow', screen_num, [255,255,255], [0,0,800,600]);
    else
        [w,rect] = Screen ('OpenWindow', screen_num);
        HideCursor;
        Screen('TextSize', w , text_size);
    end
    
end