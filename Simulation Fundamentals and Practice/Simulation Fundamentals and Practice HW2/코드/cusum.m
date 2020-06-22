function A = cusum(M)

col = size(M, 1);   % M의 행수
row = size(M, 2);   % M의 열수

for k=1:row
    for j=1:col
        A(j,k) = sum(M(1:j, k));    % 같은 열에 있고 그 행보다 같거나 작은 행에 있는 요소들의 합을 A 행렬에 입력
    end
end
        
    