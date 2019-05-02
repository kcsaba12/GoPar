function [w, rect] = init_screen(text_size, debug)
     if ~exist('debug','var')
          debug = false;
     end
     
    %Screen('Preference', 'VisualDebuglevel', 3);
    %Screen('Preference', 'SkipSyncTests', 2);
    
    if debug
        [w,rect] = Screen ('OpenWindow', 0, [255,255,255], [0,0,800,600]);
    else
        [w,rect] = Screen ('OpenWindow', 0);
        HideCursor;
        Screen('TextSize', w , text_size);
    end
    
end