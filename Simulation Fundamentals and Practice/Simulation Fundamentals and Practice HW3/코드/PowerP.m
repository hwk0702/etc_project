function y = PowerP(x, n)

if n == 0   % n이 0일 때
    y = 1;
elseif n > 0 && rem(n, 2) == 0  % n이 0보다 크고 짝수 일 때
    y = PowerP(x, n/2) * PowerP(x, n/2);
elseif n > 0 && rem(n, 2) == 1  % n이 0보다 크고 홀수 일 때
    y = PowerP(x, (n-1)/2) * PowerP(x, (n-1)/2) * x;
else    % n이 음수일 경우 오류 메시지 출력
    disp('n은 0보다 크거나 같은 정수이어야 합니다.')
end

