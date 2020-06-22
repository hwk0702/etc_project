clear;
close all;
a=0;
b=0;
base=1.6180;
height=1;
for L=1:5
    figure;
    hold on;
    PartitionRect(a,b,base,height,L)
end
