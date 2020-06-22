% 201401210 강형원
% HW1 2.1)

trial = 1000; % trial 횟수

disp('4방향으로 이동 할 때')
% 4방향으로 이동 할 때
for n=[5 10 20 40]  % 타일 크기 [5 10 20 40]
    count_wh = 0;
    for k=1:trial
        xc=0;yc=0;
        count = 0;
        while abs(xc) < n && abs(yc) < n % 타일 끝에 다다를 때 까지
    
            r = rand;
            if r<=0.25
                yc=yc+1;    % 북쪽으로 한 칸 이동
            elseif 0.25<r && r<=0.5
                xc=xc+1;    % 동쪽으로 한 칸 이동
            elseif 0.5<r && r<=0.75
                yc=yc-1;    % 남쪽으로 한 칸 이동
            else 
                xc=xc-1;    % 서쪽으로 한 칸 이동
            end
            count = count + 1;  % 이동 횟수 
        end
        count_wh = count_wh + count;     % 1000번 시도 했을 경우 총 이동 횟수
    end
    mean = count_wh/1000;   % 끝에 다다를 때 까지 평균 이동 횟수
    disp('n = ')
    disp(n)
    disp('mean = ')
    disp(mean)
end

disp('8방향으로 이동 할 때')
% 8방향으로 이동 할 때
for n=[5 10 20 40]  % 타일 크기 [5 10 20 40]
    count_wh = 0;
    for k=1:trial
        xc=0;yc=0;
        count = 0;
        while abs(xc) < n && abs(yc) < n % 타일 끝에 다다를 때 까지
    
            r = rand;
            if r<=0.125
                yc=yc+1;    % 북쪽으로 한 칸 이동
            elseif 0.125<r && r<=0.25
                xc=xc+1;    % 동쪽으로 한 칸 이동
            elseif 0.25<r && r<=0.375
                yc=yc-1;    % 남쪽으로 한 칸 이동
            elseif 0.375<r && r<=0.5
                xc=xc-1;    % 서쪽으로 한 칸 이동
            elseif 0.5<r && r<=0.625
                xc=xc+1;    % 북동쪽으로 대각선 이동
                yc=yc+1;
            elseif 0.625<r && r<=0.75
                xc=xc+1;    % 남동쪽으로 대각선 이동
                yc=yc-1;
            elseif 0.75<r && r<=0.875
                xc=xc-1;    % 북서쪽으로 대각선 이동
                yc=yc+1;
            else
                xc=xc-1;    % 남서쪽으로 대각선 이동
                yc=yc-1;
            end
            count = count + 1;  % 이동 횟수 
        end
        count_wh = count_wh + count;    % 1000번 시도 했을 경우 총 이동 횟수
    end
    mean = count_wh/1000;   % 끝에 다다를 때 까지 평균 이동 횟수
    
    disp('n = ')
    disp(n)
    disp('mean = ')
    disp(mean)
end

