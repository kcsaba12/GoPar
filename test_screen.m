% init parallel port communication and define ports
% io64.mexw64 needed in path for this to work
%{
ioObj = io64;
status = io64(ioObj);
out_address = hex2dec('378');
in_address = hex2dec('EC00');
%}

%%Init screen
Screen('Preference', 'SkipSyncTests', 2);

WaitSecs(.5);

[w,rect] = Screen ('OpenWindow', 0);

xmax = rect(3);
ymax = rect(4);
HideCursor;
black=BlackIndex(w);
white=WhiteIndex(w);
% fill off-screen buffer
Screen('FillRect',w,black);
% flip it to screen
Screen('Flip',w, [],1);
Screen('TextSize', w , 30);
% short wellcome message, goes on automatically after 3 sec
[nx, ny, bbox] = DrawFormattedText(w, 'Hi', 'center', 'center',[255 255 255 255]);
Screen('Flip',w, [],1);
%WaitSecs(3);

% enable to pause and start for key press
%{
[nx, ny, bbox] = DrawFormattedText(w, 'Press a key to start', 'center', 'center',[255 255 255 255]);
Screen('Flip',w, [],1);
pause
Screen('FillRect',w,black);
Screen('Flip',w, [],1);
%}

%{
% paradigm info
Screen('FillRect', w, black);
[nx, ny, bbox] = DrawFormattedText(w, 'Task: ...', 'center', 'center',[255 255 255 255]);
Screen('Flip',w, [],1);
WaitSecs(3);
Screen('FillRect',w,black);
%}
hz = 30;
inv_hz_half = 0.5/hz;
duration = 10; % seconds



% fixation cross SSVEP
for i = 1:(duration*hz)
    [nx, ny, bbox] = DrawFormattedText(w, '+', 'center', 'center',[0 255 255 255]);
    %Screen('FillRect',w,white);
    Screen('Flip', w, [], 1);
    WaitSecs(inv_hz_half);
    Screen('FillRect',w,black);
    Screen('Flip', w, [], 1);
    WaitSecs(inv_hz_half);
end

WaitSecs(2);

Screen('FillRect', w, black);
[nx, ny, bbox] = DrawFormattedText(w, 'Bye', 'center', 'center',[255 255 255 255]);
Screen('Flip', w, [], 1);
WaitSecs(2);

%Close all
ShowCursor;
Screen('CloseAll');