function new_scene(option, w, rect)
% Params:
% - option: select which text to display on screen
% - w: handle to the window
'111'
    black = BlackIndex(w);
    white = WhiteIndex(w);
    switch option
        case 'black'
            Screen('FillRect',w,black);
        case 'welcome'
            Screen('FillRect',w,black);
            DrawFormattedText(w, 'Hi!', 'center', 'center',[255 255 255 255]);
        case 'task_eye'
            '112'
            Screen('FillRect',w,black);
            '113'
%             str = 'A felvetel soran 2 különbözö feladatot kell majd vegrehajtanod:\n\n';
            str = 'You have to execute 2 different tasks during recording: \n\n';
%             str = [str  '- nyitott szemmel, illetve                          \n\n'];
            str = [str  '- watch the monitor with opened eyes                  \n\n'];
%             str = [str  '- csukott szemmel ülni.                             \n\n'];
            str = [str  '- close your eye and wait for the end signal.         \n\n'];
%             str = [str  'Ne fordulj el a kepernyö elöl es kerlek igyekezz\n\n'];
            str = [str  'Please do not turn away from the screen and try not to blink during the tasks\n\n'];
%             str = [str  'csak a kereszt jelenléte alatt pislogni.\n\n'];
            str = [str  'only in the small breaks, when task description appeares.\n\n'];
%             str = [str  'Szolj ha keszen allsz!'];
            str = [str  'Tell us if you are ready!'];
            '114'
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
            '115'
            %clearvars  str
            '115_'
        case 'task_hand'
            Screen('FillRect',w,black);
%             str = 'A felvetel soran 4 különbözö feladatot kell majd vegrehajtanod:\n\n';
            str = 'You have to execute 4 different tasks during recording:\n\n';
%             str = [str  '- Szorítsd ökölbe a jobb kezed!                      \n\n'];
            str = [str  '- Constrict the foam with your RIGHT hand!             \n\n'];
%             str = [str  '- Szorítsd ökölbe a bal kezed!                       \n\n'];
            str = [str  '- Constrict the foam with your LEFT hand!              \n\n'];
%             str = [str  '- Képzeld el, hogy ökölbe szorítod a jobb kezed!     \n\n'];
            str = [str  '- Imagine that you are constricting the foam with your RIGHT hand!             \n\n'];
%             str = [str  '- Képzeld el, hogy ökölbe szorítod a bal kezed!      \n\n'];
            str = [str  '- Imagine that you are constricting the foam with your LEFT hand!             \n\n'];
%             str = [str  'A feladatokat szövegesen jelenítjük meg\n\n'];
            str = [str  'We are going to display the upcoming task,\n\n'];
%             str = [str  'ezt követöen egy kereszt jelenik meg 4 másodpercig,  \n\n'];
            str = [str  'after that a fixation cross will appear for 4 seconds.  \n\n'];
%             str = [str  'ez id? alatt kell végrehajtanod a feladatot! \n\n'];
            str = [str  'You have to execute the appropriate task during this time\n\n'];
%             str = [str  'Ne fordulj el a kepernyö elöl es kerlek igyekezz\n\n'];
            str = [str  'Please do not turn away from the screen and try not to blink during the tasks\n\n'];
%             str = [str  'csak a kereszt jelenléte alatt pislogni.\n\n'];
            str = [str  'only in the small breaks, when task description appeares.\n\n'];
%             str = [str  'Szolj ha keszen allsz!'];
            str = [str  'Tell us if you are ready!'];
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'task_foot'
            Screen('FillRect',w,black);
%             str = 'A felvetel során 4 különbözö feladatot kell majd végrehajtanod:\n\n';
            str = 'You have to execute 4 different tasks during recording:\n\n';
%             str = [str  '- Megtaposni a jobb lábad alatti labdát                  \n\n'];
            str = [str  '- Tread on the foam with your RIGHT foot                 \n\n'];
%             str = [str  '- Elképzelni, hogy megtaposod a jobb lábad alatti labdát \n\n'];
            str = [str  '- Imagine that you are treading on the foam with your RIGHT foot \n\n'];
%             str = [str  '- Megtaposni a bal lábad alatti labdát                   \n\n'];
            str = [str  '- Tread on the foam with your LEFT foot                   \n\n'];
%             str = [str  '- Elképzelni, hogy megtaposod a bal lábad alatti labdát  \n\n'];
            str = [str  '- Imagine that you are treading on the foam with your LEFT foot  \n\n'];
%             str = [str  'A feladatokat szövegesen jelenítjük meg\n\n'];
            str = [str  'We are going to display the upcoming task,\n\n'];
%             str = [str  'ezt követöen egy kereszt jelenik meg 4 másodpercig,  \n\n'];
            str = [str  'after that a fixation cross will appear for 4 seconds.  \n\n'];
%             str = [str  'ez id? alatt kell végrehajtanod a feladatot! \n\n'];
            str = [str  'You have to execute the appropriate task during this time\n\n'];
%             str = [str  'Ne fordulj el a kepernyö elöl es kerlek igyekezz\n\n'];
            str = [str  'Please do not turn away from the screen and try not to blink during the tasks\n\n'];
%             str = [str  'csak a kereszt jelenléte alatt pislogni.\n\n'];
            str = [str  'only in the small breaks, when task description appeares.\n\n'];
%             str = [str  'Szolj ha keszen allsz!'];
            str = [str  'Tell us if you are ready!'];
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'task_hand_foot'
            Screen('FillRect',w,black);
%             str = 'A felvetel során 4 különböz? feladatot kell majd végrehajtanod:\n\n';
            str = 'You have to execute 4 different tasks during recording:\n\n';
%             str = [str  '- Elképzelni, hogy megtaposod a jobb lábad alatti labdát\n\n'];
            str = [str  '- Imagine that you are treading on the foam with your RIGHT foot \n\n'];
%             str = [str  '- Elképzelni, hogy megtaposod a bal lábad alatti labdát \n\n'];
            str = [str  '- Imagine that you are treading on the foam with your LEFT foot \n\n'];
%             str = [str  '- Elképzelni a jobb kezed ökölbeszorítását              \n\n'];
            str = [str  '- Imagine that you are constricting the foam with your RIGHT hand!             \n\n'];
%             str = [str  '- Elképzelni a bal kezed ökölbeszorítását               \n\n'];
            str = [str  '- Imagine that you are constricting the foam with your LEFT hand!             \n\n'];
%             str = [str  'A feladatokat szövegesen jelenítjük meg\n\n'];
            str = [str  'We are going to display the upcoming task,\n\n'];
%             str = [str  'ezt követöen egy kereszt jelenik meg 4 másodpercig,  \n\n'];
            str = [str  'after that a fixation cross will appear for 4 seconds.  \n\n'];
%             str = [str  'ez id? alatt kell végrehajtanod a feladatot! \n\n'];
            str = [str  'You have to execute the appropriate task during this time\n\n'];
%             str = [str  'Ne fordulj el a kepernyö elöl es kerlek igyekezz\n\n'];
            str = [str  'Please do not turn away from the screen and try not to blink during the tasks\n\n'];
%             str = [str  'csak a kereszt jelenléte alatt pislogni.\n\n'];
            str = [str  'only in the small breaks, when task description appeares.\n\n'];
%             str = [str  'Szolj ha keszen allsz!'];
            str = [str  'Tell us if you are ready!'];
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'thanks'
            Screen('FillRect',w,black);
%             DrawFormattedText(w, 'Köszönjük, végeztünk!', 'center', 'center',[255 255 255 255]);
            DrawFormattedText(w, 'Thank you! We are done.', 'center', 'center',[255 255 255 255]);
        case '3_2_1'
            Screen('FillRect',w,black);
            DrawFormattedText(w, '3', 'center', 'center',[255 255 255 255]);
            WaitSecs(1);
            Screen('Flip',w, [],1);
            Screen('FillRect',w,black);
            DrawFormattedText(w, '2', 'center', 'center',[255 255 255 255]);
            WaitSecs(1);
            Screen('Flip',w, [],1);
            Screen('FillRect',w,black);
            DrawFormattedText(w, '1', 'center', 'center',[255 255 255 255]);
            WaitSecs(1);
            Screen('Flip',w, [],1);
            Screen('FillRect',w,black);
            WaitSecs(1);
        case 'fixation_cross'
            Screen('FillRect',w,black);
            % Here we set the size of the arms of our fixation cross
            fixCrossDimPix = 40;

            % Now we set the coordinates (these are all relative to zero we will let
            % the drawing routine center the cross in the center of our monitor for us)
            xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
            yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
            allCoords = [xCoords; yCoords];

            % Set the line width for our fixation cross
            lineWidthPix = 4;
            
            % Get the centre coordinate of the window
            [xCenter, yCenter] = RectCenter(rect);

            % Draw the fixation cross in white, set it to the center of our screen and
            % set good quality antialiasing
            Screen('DrawLines', w, allCoords,lineWidthPix, white, [xCenter yCenter]);
            Screen('Flip',w, [],1);
        case 'open_eye'
            Screen('FillRect',w,black);
            % TODO: draw open_eye graphic
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            % Make a base Rect of 200 by 250 pixels
            baseRect1 = [0 0 500 250];
            baseRect2 = [0 0 200 250];
            
            % Center the rectangle on the centre of the screen
            centeredRect1 = CenterRectOnPointd(baseRect1, xCenter, yCenter);
            centeredRect2 = CenterRectOnPointd(baseRect2, xCenter, yCenter);
            
            % Set the color of the rect to red
            %rectColor = [1 0 0];
            
            % Draw the rect to the screen
            Screen('FrameOval', w, white, centeredRect1, 10);
            Screen('FrameOval', w, white, centeredRect2, 10);
            
        case 'closed_eye'
            Screen('FillRect',w,black);
            % Make a base Rect of 200 by 250 pixels
            baseRect1 = [0 0 500 25];
            
            [xCenter, yCenter] = RectCenter(rect);
            centeredRect1 = CenterRectOnPointd(baseRect1, xCenter, yCenter);
            
            % Draw the rect to the screen
            Screen('FillOval', w, white, centeredRect1, 20);
            
        case 'right_arrow'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [-80, 0, 0, 80,   0,  0,-80,-80] + xCenter;
            yPosVector = [ 40,40,80,  0, -80,-40,-40, 40] + yCenter;
            
            % Draw the rect to the screen
            Screen('FillPoly', w, white, [xPosVector; yPosVector]', 0);
        
        case 'right_arrow_frame'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [-80, 0, 0, 80,   0,  0,-80,-80] + xCenter;
            yPosVector = [ 40,40,80,  0, -80,-40,-40, 40] + yCenter;
            
            % Draw the rect to the screen
            Screen('FramePoly', w, white, [xPosVector; yPosVector]', 0);
            
        case 'left_arrow'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [-80, 0, 0, 80,   0,  0,-80,-80].*(-1) + xCenter;
            yPosVector = [ 40,40,80,  0, -80,-40,-40, 40].*(-1) + yCenter;
            
            % Draw the rect to the screen
            Screen('FillPoly', w, white, [xPosVector; yPosVector]', 0);
            
        case 'left_arrow_frame'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [-80, 0, 0, 80,   0,  0,-80,-80].*(-1) + xCenter;
            yPosVector = [ 40,40,80,  0, -80,-40,-40, 40].*(-1) + yCenter;
            
            % Draw the rect to the screen
            Screen('FramePoly', w, white, [xPosVector; yPosVector]', 0);
        case 'right_foot'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [0, 40, 40, 80,   80,  0, 0] + xCenter;
            yPosVector = [0, 0, -80, -80, -120, -120, 0].*(-1) + yCenter;
            
            % Draw the rect to the screen
            Screen('FillPoly', w, white, [xPosVector; yPosVector]', 0);
            
        case 'left_foot'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [0, 40, 40, 80,   80,  0, 0].*(-1) + xCenter;
            yPosVector = [0, 0, -80, -80, -120, -120, 0].*(-1) + yCenter;
            
            % Draw the rect to the screen
            Screen('FillPoly', w, white, [xPosVector; yPosVector]', 0);
            
        case 'right_foot_frame'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [0, 40, 40, 80,   80,  0, 0] + xCenter;
            yPosVector = [0, 0, -80, -80, -120, -120, 0].*(-1) + yCenter;
            
            % Draw the rect to the screen
            Screen('FramePoly', w, white, [xPosVector; yPosVector]', 0);
            
        case 'left_foot_frame'
            Screen('FillRect',w,black);
            
            [xCenter, yCenter] = RectCenter(rect);
            
            xPosVector = [0, 40, 40, 80,   80,  0, 0].*(-1) + xCenter;
            yPosVector = [0, 0, -80, -80, -120, -120, 0].*(-1) + yCenter;
            
            % Draw the rect to the screen
            Screen('FramePoly', w, white, [xPosVector; yPosVector]', 0);
        case 'right_hand_m_text'
            Screen('FillRect',w,black);
%              str = 'Jobb ököl szorít\n\n';
             str = 'Constrict RIGHT hand\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
            
        case 'right_hand_mi_text'
            Screen('FillRect',w,black);
%             str = 'Jobb ököl képzelt\n\n';
            str = 'Imagine RIGHT hand constriction\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'left_hand_m_text'
            Screen('FillRect',w,black);
%             str = 'Bal ököl szorít\n\n';
            str = 'Constrict LEFT hand\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'left_hand_mi_text'
            Screen('FillRect',w,black);
%             str = 'Bal ököl képzelt\n\n';
            str = 'Imagine LEFT hand constriction\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'right_foot_m_text'
            Screen('FillRect',w,black);
%             str = 'Jobb láb tapos\n\n';
            str = 'Tread with RIGHT foot\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'right_foot_mi_text'
            Screen('FillRect',w,black);
%              str = 'Jobb láb képzelt\n\n';
             str = 'Imagine RIGHT foot treading\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'left_foot_m_text'
            Screen('FillRect',w,black);
%             str = 'Bal láb tapos\n\n';
            str = 'Tread with LEFT foot\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'left_foot_mi_text'
            Screen('FillRect',w,black);
%             str = 'Bal láb képzelt\n\n';
            str = 'Imagine LEFT foot treading\n\n';
            DrawFormattedText(w, str, 'center', 'center',[255 255 255 255]);
%             clearvars  str
        case 'end'
            %Close all
            ShowCursor; 
            Screen('CloseAll');
            
        otherwise
            error('Wrong input parameter in new_scene function!')
    end % switch
    
    % Show time!
    Screen('Flip',w, [],1);
    '116'
end % function