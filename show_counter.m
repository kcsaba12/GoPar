function show_counter(ind, outof, w, rect)
    black = BlackIndex(w);
    Screen('FillRect',w,black);
    str = [int2str(ind) '/' int2str(outof)];
    DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
    Screen('Flip',w, [],1);
%     clearvars str;
end