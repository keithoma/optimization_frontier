% LagrangeInterpolation firstly constructs a polynomial matching the values
% listed in samplingPoints and functionValues, then returns the values of
% the polynomial for x. Note that if the length of samplingPoints and
% functionValues do not match this function raises an error.

% Arugments:
%   x (array) : the values where the polynomial should be evaluated
%   samplingPoints (array) : the given x-axis values
%   functionValues (array) : the given y-axis values
% Returns:
%   (array) : the values given by the constructed polynomial
function y = LagrangeInterpolation(x, samplingPoints, functionValues)
    if length(samplingPoints) ~= length(functionValues)
        error("The length of samplingPoints and functionValues do not match.")
    end

    syms ex;
    omega = prod(ex - samplingPoints);
    omega_prime = diff(omega);
    bigA = zeros(1, length(samplingPoints));
    for j = 1:length(samplingPoints)
        bigA(j) = functionValues(j) / vpa(subs(omega_prime, ex, samplingPoints(j)));
    end
    p = omega * sum(bigA./(ex - samplingPoints));

    y = zeros(1, length(x));
    for j = 1:length(x)
        y(j) = vpa(subs(p, ex, x(j)));
    end
end
    
    