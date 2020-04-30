% This module is for testing the function implemented in
% LagrangeInterpolation.m.
% Authors:
%   Angelina Jellineck
%   Kei Thoma

x = [pi / 4, pi / 2, 3 * pi / 4, 2 * pi];
xvec = 0:0.5:3.5;
yvec = cos(xvec);
y = LagrangeInterpolation(x, xvec, yvec);
error = y - cos(x);

fprintf('Given the following data,\n\n')
disp(['sampling points: [' num2str(xvec(:).') ']'])
disp(['function values: [' num2str(yvec(:).') ']'])
disp(['evaluate the polynomial at: [' num2str(x(:).') ']'])
fprintf('\n\nwe have the solution array\n\n')
disp(['y = [' num2str(y(:).') ']'])
fprintf('\n\nand the error compared with cos(x) is\n\n')
error
fprintf('\n\n End of demonstration.\n')