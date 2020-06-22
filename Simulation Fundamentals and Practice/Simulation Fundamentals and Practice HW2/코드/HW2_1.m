
x = linspace(-2, 4, 200);   % x축에서 [-2, 4] 범위 균등하게 200개 점

plot(x, func(x), '-or') % x에 따른 fx값 구해서 plot 생성
title('1번 그래프');
xlabel('x');
ylabel('y')