
counts = [];    % 총 횟수 기록할 배열 선언
scores = [];    % 총 score 기록할 배열 선언

for i=1:100     % 100번 반복
    
score = 0;  % score 선언
hits = 0;   % hit 수
count = 0;  % 조건을 만족 할 때까지 총 던진 횟수

    while score < 25 && hits < 2    % 점수가 25점 이상이거나 hits가 2회 이상일 경우 종료
        count = count + 1;
        xy = -2 + rand(1, 2)*4;     % 다트가 맞은 점 랜덤값
        [r, theta] = xypolar(xy(1), xy(2)); % 극 좌표계로 변환
        
        if r <= 0.5     % 반지름이 0.5인 원 안일 경우
            score = score + 10;
            hits = hits + 1;
        elseif r > 1.5  % 반지름이 1.5인 원 밖일 경우
            if xy(2) > 0    % y 좌표가 양수인 경우
                score = score - 1;
            else    % y 좌표가 음수인 경우
                score = score - 2;
            end
        else    % 반지름 0.5에서 1.5 사이 일 경우
            if theta < 0    % theta가 음수인 경우 양수로 변환
                theta = 2*pi + theta;
            end
            
            if theta >= 0 && theta < (2*pi/8)   % 0도에서 45도 사이 인 경우
                score = score + 1;
            elseif theta >= (2*pi/8) && theta < (2*pi/8)*2  % 45도에서 90도 사이 인 경우
                score = score + 2;
            elseif theta >= (2*pi/8)*2 && theta < (2*pi/8)*3    % 90도에서 135도 사이 인 경우
                score = score + 3;
            elseif theta >= (2*pi/8)*3 && theta < (2*pi/8)*4    % 135도에서 180도 사이 인 경우
                score = score + 4;
            elseif theta >= (2*pi/8)*4 && theta < (2*pi/8)*5    % 180도에서 225도 사이 인 경우
                score = score + 5;
            elseif theta >= (2*pi/8)*5 && theta < (2*pi/8)*6    % 225도에서 270도 사이 인 경우
                score = score + 6;
            elseif theta >= (2*pi/8)*6 && theta < (2*pi/8)*7    % 270도에서 315도 사이 인 경우
                score = score + 7;
            else    % 315도에서 360도 사이 인 경우
                score = score + 8;
            end
        end
    end      
    counts = [counts count];    % 총 횟수 기록
    scores = [scores score];    % 총 score 기록
end

disp('평균 던진 횟수:');
disp(mean(counts));
disp('평균 score:');
disp(mean(scores));