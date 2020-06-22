function [r, theta] = xypolar(x, y)

r = sqrt(x^2 + y^2);
theta = atan(y/x);