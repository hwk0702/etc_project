% 201401210 ������
% HW1 2.1)

trial = 1000; % trial Ƚ��

disp('4�������� �̵� �� ��')
% 4�������� �̵� �� ��
for n=[5 10 20 40]  % Ÿ�� ũ�� [5 10 20 40]
    count_wh = 0;
    for k=1:trial
        xc=0;yc=0;
        count = 0;
        while abs(xc) < n && abs(yc) < n % Ÿ�� ���� �ٴٸ� �� ����
    
            r = rand;
            if r<=0.25
                yc=yc+1;    % �������� �� ĭ �̵�
            elseif 0.25<r && r<=0.5
                xc=xc+1;    % �������� �� ĭ �̵�
            elseif 0.5<r && r<=0.75
                yc=yc-1;    % �������� �� ĭ �̵�
            else 
                xc=xc-1;    % �������� �� ĭ �̵�
            end
            count = count + 1;  % �̵� Ƚ�� 
        end
        count_wh = count_wh + count;     % 1000�� �õ� ���� ��� �� �̵� Ƚ��
    end
    mean = count_wh/1000;   % ���� �ٴٸ� �� ���� ��� �̵� Ƚ��
    disp('n = ')
    disp(n)
    disp('mean = ')
    disp(mean)
end

disp('8�������� �̵� �� ��')
% 8�������� �̵� �� ��
for n=[5 10 20 40]  % Ÿ�� ũ�� [5 10 20 40]
    count_wh = 0;
    for k=1:trial
        xc=0;yc=0;
        count = 0;
        while abs(xc) < n && abs(yc) < n % Ÿ�� ���� �ٴٸ� �� ����
    
            r = rand;
            if r<=0.125
                yc=yc+1;    % �������� �� ĭ �̵�
            elseif 0.125<r && r<=0.25
                xc=xc+1;    % �������� �� ĭ �̵�
            elseif 0.25<r && r<=0.375
                yc=yc-1;    % �������� �� ĭ �̵�
            elseif 0.375<r && r<=0.5
                xc=xc-1;    % �������� �� ĭ �̵�
            elseif 0.5<r && r<=0.625
                xc=xc+1;    % �ϵ������� �밢�� �̵�
                yc=yc+1;
            elseif 0.625<r && r<=0.75
                xc=xc+1;    % ���������� �밢�� �̵�
                yc=yc-1;
            elseif 0.75<r && r<=0.875
                xc=xc-1;    % �ϼ������� �밢�� �̵�
                yc=yc+1;
            else
                xc=xc-1;    % ���������� �밢�� �̵�
                yc=yc-1;
            end
            count = count + 1;  % �̵� Ƚ�� 
        end
        count_wh = count_wh + count;    % 1000�� �õ� ���� ��� �� �̵� Ƚ��
    end
    mean = count_wh/1000;   % ���� �ٴٸ� �� ���� ��� �̵� Ƚ��
    
    disp('n = ')
    disp(n)
    disp('mean = ')
    disp(mean)
end

