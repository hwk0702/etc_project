% 201401210 ������
% HW1 3.

n = 0; 

while 1
    n = n+1;
    en1 = 0;
    en = 0;
    for i=1:n+1
        en = en1;
        en1 = en1 + 1/i;
    end
    en1 = en1 - log(n+1); % Euler ��� (E(n+1))
    en = en - log(n);   % Euler ��� (En)
    if abs(en1-en) < 0.001
        break   % abs(en1-en) < 0.001�� ��� �ݺ��� �ߴ�
    end
end

disp('n: ')
disp(n)
disp('en: ')
disp(en)