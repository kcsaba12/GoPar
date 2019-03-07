function show_counter(num,w,rect)
    black = BlackIndex(w);
    Screen('FillRect',w,black);
    str = [int2str(num) '/17'];
    DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
    Screen('Flip',w, [],1);
%     clearvars str;
end