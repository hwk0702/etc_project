% 201401210 ������
% HW1 1.2)

n = 3;  % ���� ��
an = n/2*sin(2*pi/n);   % �����ϴ� �ٰ����� ����
bn = n*tan(pi/n);   % �����ϴ� �ٰ����� ����
pn = (an+bn)/2; % pi�� �ٻ�ȭ
tol = 0.001;    % ���� �Ӱ谪

while abs(an-pi) >= tol && abs(bn-pi) >= tol % abs(an-pi) < tol �Ǵ� abs(bn-pi) < tol�� �� ������
    n = n+1;
    an = n/2*sin(2*pi/n);
    bn = n*tan(pi/n);
end

disp('n�� ��: ')
disp(n)
disp('���� ���� ��: ')
disp(abs(pn-pi))