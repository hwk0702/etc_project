% 201401210 강형원
% HW1 1.2)

n = 3;  % 점의 수
an = n/2*sin(2*pi/n);   % 내접하는 다각형의 넓이
bn = n*tan(pi/n);   % 외접하는 다각형의 넓이
pn = (an+bn)/2; % pi값 근사화
tol = 0.001;    % 오차 임계값

while abs(an-pi) >= tol && abs(bn-pi) >= tol % abs(an-pi) < tol 또는 abs(bn-pi) < tol이 될 때까지
    n = n+1;
    an = n/2*sin(2*pi/n);
    bn = n*tan(pi/n);
end

disp('n의 값: ')
disp(n)
disp('절대 오차 값: ')
disp(abs(pn-pi))