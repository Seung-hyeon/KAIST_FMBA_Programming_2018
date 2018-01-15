function BSPrice = BSPrice(S, K, r, tau, sigma, call_put)
% Sample Code
%   자세한 설명 위치

    d1 = (log(S ./ K) + (r + 0.5 * sigma .^ 2) .* tau) ./ (sigma .* sqrt(tau));
    d2 = d1 - sigma .* sqrt(tau);
    
    Nd1 = normcdf(d1);
    Nd2 = normcdf(d2);
    
    if strcmp(call_put, 'call')
        BSPrice = S .* Nd1 - K .* exp(-r .* tau) .* Nd2;
        
    elseif strcmp(call_put, 'put')
        BSPrice = K .* exp(-r .* tau) .* (1 - Nd2) - S .* (1 - Nd1);
        
    end
        
end


