% 201401210 강형원
% HW1 1.1)

n = 3;  % 점의 수
an = n/2*sin(2*pi/n);   % 내접하는 다각형의 넓이
bn = n*tan(pi/n);   % 외접하는 다각형의 넓이
pn = (an+bn)/2; % pi값 근사화
tol = 0.001;    % 오차 임계값

while abs(pn-pi) >= tol % abs(pn-pi)<tol 될 때 까지
    n = n+1;
    an = n/2*sin(2*pi/n);
    bn = n*tan(pi/n);
    pn = (an+bn)/2;
end

disp('n의 값: ')
disp(n)
disp('절대 오차 값: ')
disp(abs(pn-pi))