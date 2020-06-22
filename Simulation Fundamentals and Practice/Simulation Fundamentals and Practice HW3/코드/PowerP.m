function y = PowerP(x, n)

if n == 0   % n�� 0�� ��
    y = 1;
elseif n > 0 && rem(n, 2) == 0  % n�� 0���� ũ�� ¦�� �� ��
    y = PowerP(x, n/2) * PowerP(x, n/2);
elseif n > 0 && rem(n, 2) == 1  % n�� 0���� ũ�� Ȧ�� �� ��
    y = PowerP(x, (n-1)/2) * PowerP(x, (n-1)/2) * x;
else    % n�� ������ ��� ���� �޽��� ���
    disp('n�� 0���� ũ�ų� ���� �����̾�� �մϴ�.')
end

