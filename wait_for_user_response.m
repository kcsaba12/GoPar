function stop = wait_for_user_response(in_address)
%function stop = wait_for_user_response(ioObj, in_address)

%     % wait for user response
%     IO64_flag = false;
%     
%     if IO64_flag
%         %pause;
%         [secs, keyCode] = KbWait; % Wait until at least one key is pressed and return its time.
%         if find(keyCode) > 40
%             stop = true;
%         else
%             stop = false;
%         end
%         
%         data=103;
%         while data==103
%             %data=io64(ioObj,in_address); % check for button input
%             data=rport(in_address); % check for button input
%         end
%         
%         %stop = false;
%     else
        [secs, keyCode] = KbWait; % Wait until at least one key is pressed and return its time.     
        if find(keyCode) > 40
            stop = true;
        else
            stop = false;
        end
    
       %end
    
    
end