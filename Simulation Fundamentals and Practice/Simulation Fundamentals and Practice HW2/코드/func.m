function y = func(x)

for k=1:length(x)
    
    if x(k) <= 0    % x<=0�ΰ��
        y(k) = (x(k)-1)^2;
    elseif (x(k) > 0) && (x(k) <= 1)    % 0<x<=1�ΰ��
        y(k) = -2*(x(k)-0.5)^2+1.5; 
    else    % x>1�ΰ��
        y(k) = -x(k)+2;
    end
end