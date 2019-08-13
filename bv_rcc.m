classdef bv_rcc
    %BV_RCC Remote Control Client to send triggers
    %   This is a remote control client, which can open and control the
    %   brain vision recorder and send trigger signals
    
    properties
        tcp;
    end
    
    methods
        %% MAIN functions
        function obj = bv_rcc(ip, port)
            %BV_RCC Construct an instance of this class
            %   IP and port address is required to open remote control
            %   client
            obj.tcp = tcpip(ip, port);
            obj.tcp.Terminator = 'CR';
            fopen(obj.tcp);
        end
        
%         function clear_data(obj)
%             flushinput(obj.bv_rcc)
%         end
        
        function send_message(obj, message)
            %SEND_MESSAGE base class to send message
            fprintf(obj.tcp, message);
        end
        
        function message = get_message(obj)
            message = fscanf(obj.tcp);
        end
        
        function state = check_state(obj, message)
            answ = '';
            while ~strcmp(answ, message)
                msg = get_message(obj);
                msg = split(msg, ':');
                answ = msg{1};
            end
            state = strtrim(msg{2});
        end
        
        function wait_till(obj, message, code)
%             clear_data(obj)
            code = num2str(code);
%             send_message(obj, message);
            state = '';
            while ~strcmp(state, code)
%                 message = get_message(obj);
% %                 fprintf(message);
%                 state = split(message, ':');
                send_message(obj, message);
                state = check_state(obj, message);
                
                WaitSecs(0.1);
            end
        end
        
        %% Helper functions
        
        function open_recorder(obj)
            send_message(obj, 'O');
        end
        
        function view_data(obj)
            send_message(obj, 'M');
        end
        
        function view_impedance(obj)
            send_message(obj, 'I');
        end
        
        function close_recorder(obj)
            send_message(obj, 'X');
        end
        
        function path_to_workspace(obj, path)
            send_message(obj, ['1:', path]);
        end
        
        function experiment_num(obj, num)
            send_message(obj, ['2:', num2str(num)]);
        end
        
        function subject_id(obj, id)
            send_message(obj, ['3:', num2str(id)]);
        end
        
        function start_recording(obj)
            send_message(obj, 'S');
        end
        
        function stop_recording(obj)
            send_message(obj, 'Q');
        end
        
        function trigger(obj, stimulus)
            send_message(obj, ['AN:', stimulus, ';Stimulus']);
        end
        
        function wait_till_open(obj)
            wait_till(obj, 'AP', 1);
        end
        
        function wait_till_acquisition(obj)
            wait_till(obj, 'AQ', 1);
        end
        
        function bool = is_recording(obj)
            state = check_state(obj, 'RS');
            bool = strcmp(state, '4');
        end
    end
end

