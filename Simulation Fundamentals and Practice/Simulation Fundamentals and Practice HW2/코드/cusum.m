function A = cusum(M)

col = size(M, 1);   % M�� ���
row = size(M, 2);   % M�� ����

for k=1:row
    for j=1:col
        A(j,k) = sum(M(1:j, k));    % ���� ���� �ְ� �� �ຸ�� ���ų� ���� �࿡ �ִ� ��ҵ��� ���� A ��Ŀ� �Է�
    end
end
        
    