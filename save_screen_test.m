try

wPtr = Screen('OpenWindow', 0);
HideCursor;

Screen('FillRect', wPtr, 0);
Screen(wPtr, 'Flip');
white = WhiteIndex(wPtr);

% Draws the display to be turned into an image file
a = [100 100 150 150]';
b = [100 200 150 200]';
ovalSpecs = [a b];
%Screen('FillOval', wPtr, white, ovalSpecs );
Screen('FillRect',wPtr,black);
str = 'Képzeld el, hogy megtaposod a bal lábad alatti labdát!\n\n';
DrawFormattedText(wPtr, str, 'center', 'center',[255 255 255 255]);
Screen(wPtr, 'Flip');

% GetImage call. Alter the rect argument to change the location of the screen shot
imageArray = Screen('GetImage', wPtr, [0 0 300 300]);

% imwrite is a Matlab function, not a PTB-3 function
imwrite(imageArray, 'test.jpg')

catch
    ShowCursor;
Screen('CloseAll');

end