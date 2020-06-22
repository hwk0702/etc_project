% 201401210 강형원
% HW1 2.2)

trial = 1000; % trial 횟수

for n=[5 10 20 40]  % 타일 크기 [5 10 20 40]
    count_wh = 0;   % 전체 이동 횟수
    count1 = 0; % 완전 코너가 아닌 부분에 들어가는 경우 이동 수
    count2 = 0; % 완전 코너에 들어가는 경우 이동 수
    n1 = 0; % 완전 코너가 아닌 부분에 들어가는 횟수
    n2 = 0; % 완전 코너에 들어가는 횟수
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
        count_wh = count_wh + count;     % 1000번 시도 했을 경우 총 이동 횟수
        
        if abs(xc) >= n || abs(yc) >= n     % 타일 끝에 도달하는 경우 중
            if abs(xc) >= n && abs(yc) >= n     % 완전 코너에 도달 하는 경우
                count2 = count2 + count;
                n2 = n2 + 1;
            else    % 완전 코너 부분이 아닌 부분에 들어가는 경우
                count1 = count1 + count;
                n1 = n1 + 1;
            end
        end
    end
    mean = count_wh/1000;   % 전체 평균 이동 횟수
    mean1 = count1/n1;  % 완전 코너 부분이 아닌 부분에 들어가는 평균 이동 횟수
    mean2 = count2/n2;  % 완전 코너 부분에 들어가는 평균 이동 횟수
    
    disp('-------------------------------------------------------')
    disp('타일 크기 n = ')
    disp(n)
    disp('전체 평균 이동 횟수 = ')
    disp(mean)
    disp('완전 코너 부분이 아닌 부분에 들어가는 횟수 = ')
    disp(n1)
    disp('완전 코너 부분이 아닌 부분에 들어가는 평균 이동 횟수 = ')
    disp(mean1)
    disp('완전 코너 부분에 들어가는 횟수 = ')
    disp(n2)
    disp('완전 코너 부분에 들어가는 평균 이동 횟수 = ')
    disp(mean2)
end