classdef bv_rcc
    %BV_RCC Remote Control Client to send triggers
    %   This is a remote control client, which can open and control the
    %   brain vision recorder and send trigger signals
    
    properties
        tcp;
    end
    
    methods
        function obj = bv_rcc(ip, port)
            %BV_RCC Construct an instance of this class
            %   IP and port address is required to open remote control
            %   client
            obj.tcp = tcpip(ip, port);
            obj.tcp.Terminator = 'CR';
            fopen(obj.tcp);
        end
        
        function send_message(obj, message)
            %SEND_MESSAGE base class to send message
            fprintf(obj.tcp, message);
        end
        
        function message = read_message(obj)
            message = fread(obj.tcp);
        end
        
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
    end
end

