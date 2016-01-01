% Author: Oswaldo Fratini Filho
% Email: offox2001@gmail.com
% 
% MATLAB Utilities
%
% Fuction to calculate Intel Hex checksum
%
% In the calcIntelHexChecksum(e) function the paramenter 'e' is a hexadecimal
% string and return 'c' hexadecimal checksum
function c = calcIntelHexChecksum(e)
    sum = 0;

    for i=1:2:(size(e,2)-1)
        sum = sum + hex2dec(e(1,i:i+1));
    end
    
    sum = mod(sum, 256);
    
    c = dec2hex(bitcmp(uint8(sum))+1,2);
end
