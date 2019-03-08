function [ioObj, out_address, in_address] = init_parallel_port()
    ioObj = io64;
    status = io64(ioObj);
    out_address = hex2dec('378');
    in_address = hex2dec('EC00');
    % zero out the input
    io64(ioObj, out_address, 0);
end