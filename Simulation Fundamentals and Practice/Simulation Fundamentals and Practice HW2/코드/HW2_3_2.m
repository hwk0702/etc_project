
counts = [];    % �� Ƚ�� ����� �迭 ����
scores = [];    % �� score ����� �迭 ����

for i=1:100     % 100�� �ݺ�
    
score = 0;  % score ����
hits = 0;   % hit ��
count = 0;  % ������ ���� �� ������ �� ���� Ƚ��

    while score < 25 && hits < 2    % ������ 25�� �̻��̰ų� hits�� 2ȸ �̻��� ��� ����
        count = count + 1;
        xy = -2 + rand(1, 2)*4;     % ��Ʈ�� ���� �� ������
        [r, theta] = xypolar(xy(1), xy(2)); % �� ��ǥ��� ��ȯ
        
        if r <= 0.5     % �������� 0.5�� �� ���� ���
            score = score + 10;
            hits = hits + 1;
        elseif r > 1.5  % �������� 1.5�� �� ���� ���
            if xy(2) > 0    % y ��ǥ�� ����� ���
                score = score - 1;
            else    % y ��ǥ�� ������ ���
                score = score - 2;
            end
        else    % ������ 0.5���� 1.5 ���� �� ���
            if theta < 0    % theta�� ������ ��� ����� ��ȯ
                theta = 2*pi + theta;
            end
            
            if theta >= 0 && theta < (2*pi/8)   % 0������ 45�� ���� �� ���
                score = score + 1;
            elseif theta >= (2*pi/8) && theta < (2*pi/8)*2  % 45������ 90�� ���� �� ���
                score = score + 2;
            elseif theta >= (2*pi/8)*2 && theta < (2*pi/8)*3    % 90������ 135�� ���� �� ���
                score = score + 3;
            elseif theta >= (2*pi/8)*3 && theta < (2*pi/8)*4    % 135������ 180�� ���� �� ���
                score = score + 4;
            elseif theta >= (2*pi/8)*4 && theta < (2*pi/8)*5    % 180������ 225�� ���� �� ���
                score = score + 5;
            elseif theta >= (2*pi/8)*5 && theta < (2*pi/8)*6    % 225������ 270�� ���� �� ���
                score = score + 6;
            elseif theta >= (2*pi/8)*6 && theta < (2*pi/8)*7    % 270������ 315�� ���� �� ���
                score = score + 7;
            else    % 315������ 360�� ���� �� ���
                score = score + 8;
            end
        end
    end      
    counts = [counts count];    % �� Ƚ�� ���
    scores = [scores score];    % �� score ���
end

disp('��� ���� Ƚ��:');
disp(mean(counts));
disp('��� score:');
disp(mean(scores));