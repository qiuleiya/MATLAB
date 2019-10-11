clc;
clear all;
close all;
net1=shuzinet();
save('net1.mat','net1')

net2=zimunet();
save('net2.mat','net2');

net3=hanzinet();
save('net3.mat','net3');

net4=shuzizimunet();
save('net3.mat','net4');

% figure('name''汉字神经网络模型各阈值权值');
% yuzhiquanzhi(net2);
% figure('name''数字字母神经网络模型各阈值权值');
% yuzhiquanzhi(net4);


chepaishibie();