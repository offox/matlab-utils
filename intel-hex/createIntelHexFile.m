% Author: Oswaldo Fratini Filho
% Email: offox2001@gmail.com
%
% MATLAB Utilities
%
% Fuction to create a Intel Hex file
%
% In the createIntelHexFile(a, d, f) the parameter 'a' is the memory
% addresses column vector, the parameter 'd' is the data column vector with
% hexadecimal strings and the parameter 'f' is the file path
function createIntelHexFile(a, d, f)

    if size(a, 1) ~= size(d, 1)
       error('a address vector size is different of d data vector');
    end
    
    s = size(d,2)/2;
    s = dec2hex(s,2);
     
    h = fopen(f, 'w')

    for i=1:size(a)
        e = sprintf('%s%s%s', s, a(i,:), d(i,:))
        c = calcIntelHexChecksum(e);
        fprintf(h,':%s%s\n',e,c);
    end

    fprintf(h,':00000001ff');

    fclose(h);
end
