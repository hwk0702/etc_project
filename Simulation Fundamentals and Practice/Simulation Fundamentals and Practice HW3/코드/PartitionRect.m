function PartitionRect(a, b, base, height, L)
x = [a a+base a+base a];    % 직사각형의 x좌표 선언
y = [b b b+height b+height];    % 직사각형의 y좌표 선언

if L==0     % 기본 단계
    fill(x, y, 'w');    % 남은 직사각형 부분을 흰색으로 표시

else    % 재귀 단계
    r = rand;   % 난수 r 생성
    % 난수에 따라 'r', 'g', 'b', 'y' 중에 무작위로 선택
    if r <= 1/4
        c = 'r';
    elseif r>1/4 && r<=2/4
        c = 'g';
    elseif r>2/4 && r<=3/4
        c = 'b';
    else
        c = 'y';
    end
    
    if base > height    % base가 height보다 큰 경우
        % 각 변의 길이가 height인 정사각형을 무작위로 선택한 색으로 나타낸다.
        x1 = [a a+height a+height a];
        y1 = [b b b+height b+height];
        fill(x1, y1, c);
        PartitionRect(a+height, b, base-height, height, L-1);   % 나머지 직사각형 부분을 재귀함수로 다시 실행
    else    % height가 base보다 큰 경우
        % 각 변의 길이가 base인 정사각형을 무작위로 선택한 색으로 나타낸다.
        x1 = [a a+base a+base a];
        y1 = [b b b+base b+base];
        fill(x1, y1, c);
        PartitionRect(a, b+base, base, height-base, L-1); % 나머지 직사각형 부분을 재귀함수로 다시 실행
    end      
end