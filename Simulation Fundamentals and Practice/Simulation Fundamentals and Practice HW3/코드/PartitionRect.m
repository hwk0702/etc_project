function PartitionRect(a, b, base, height, L)
x = [a a+base a+base a];    % ���簢���� x��ǥ ����
y = [b b b+height b+height];    % ���簢���� y��ǥ ����

if L==0     % �⺻ �ܰ�
    fill(x, y, 'w');    % ���� ���簢�� �κ��� ������� ǥ��

else    % ��� �ܰ�
    r = rand;   % ���� r ����
    % ������ ���� 'r', 'g', 'b', 'y' �߿� �������� ����
    if r <= 1/4
        c = 'r';
    elseif r>1/4 && r<=2/4
        c = 'g';
    elseif r>2/4 && r<=3/4
        c = 'b';
    else
        c = 'y';
    end
    
    if base > height    % base�� height���� ū ���
        % �� ���� ���̰� height�� ���簢���� �������� ������ ������ ��Ÿ����.
        x1 = [a a+height a+height a];
        y1 = [b b b+height b+height];
        fill(x1, y1, c);
        PartitionRect(a+height, b, base-height, height, L-1);   % ������ ���簢�� �κ��� ����Լ��� �ٽ� ����
    else    % height�� base���� ū ���
        % �� ���� ���̰� base�� ���簢���� �������� ������ ������ ��Ÿ����.
        x1 = [a a+base a+base a];
        y1 = [b b b+base b+base];
        fill(x1, y1, c);
        PartitionRect(a, b+base, base, height-base, L-1); % ������ ���簢�� �κ��� ����Լ��� �ٽ� ����
    end      
end