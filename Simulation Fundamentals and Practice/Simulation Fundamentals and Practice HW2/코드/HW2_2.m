row = randi([2, 5], 1, 1);
col = randi([2, 5], 1, 1);
M = randi([3, 10], row, col);
A = cusum(M);

disp('M: ');
disp(M);
disp('A: ');
disp(A);