function new_scene(option, w, rect)
    % Params:
    % - option: select which text to display on screen
    % - w: handle to the window
    black = BlackIndex(w);
    white = WhiteIndex(w);
    
    global LANGUAGE;
    TASK_LIST = {'welcome', 'thanks', 'task_eye', 'task_hand', 'task_foot', ...
        'task_hand_foot', 'right_hand_m_text', 'right_hand_mi_text', ...
        'left_hand_m_text', 'left_hand_mi_text', 'right_foot_m_text', ...
        'right_foot_mi_text', 'left_foot_m_text', 'left_foot_mi_text', ...
        'open_eye', 'closed_eye'};
    
    switch option
        case TASK_LIST
            Screen('FillRect',w,black);
            DrawFormattedText(w, getfield(LANGUAGE, option), 'center', 'center',[255 255 255 255]);
        case 'black'
            Screen('FillRect',w,black);
        case '3_2_1'
            for i=3:-1:1
                Screen('FillRect',w,black);
                DrawFormattedText(w, int2str(i), 'center', 'center',[255 255 255 255]);
                WaitSecs(1);
                Screen('Flip',w, [],1);
            end
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

        case 'open_eye_fig'
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

        case 'closed_eye_fig'
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

        case 'end'
            %Close all
            ShowCursor; 
            Screen('CloseAll');

        otherwise
            error('Wrong input parameter in new_scene function!')
    end % switch
    
    % Show time!
    if ~strcmp(option,'end')
        Screen('Flip',w, [],1);
    end
end % function
