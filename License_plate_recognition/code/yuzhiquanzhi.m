function  yuzhiquanzhi(net)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
V = net.iw{1,1};%输入层到中间层权值
subplot(3,2,1) 
plot(V);%绘图函数
title('输入层到中间层的权值');
xlabel('第x个神经元');  %x轴
ylabel('权值');%y轴
theta1 = net.b{1};%隐含1层各神经元阈值
subplot(3,2,2) 
 plot(theta1);%绘图函数
title('隐含1层各神经元阈值');
xlabel('第x个神经元');  %x轴
ylabel('阈值');%y轴

W1 = net.lw{2,1};%隐含1层到2层权值
subplot(3,2,3) 
 plot(W1);%绘图函数
title('隐含1层到2层权值');
xlabel('第x个神经元');  %x轴
ylabel('权值');%y轴
theta2 =net.b{2};%隐含2层各神经元阈值
subplot(3,2,4) 
 plot(theta2);%绘图函数
title('隐含2层各神经元阈值');
xlabel('第x个神经元');  %x轴
ylabel('阈值');%y轴

W2=net.lw{3,2};%2层到输出层
subplot(3,2,5) 
 plot(W2);%绘图函数
title('隐含2层到输出层的权值');
xlabel('第x个神经元');  %x轴
ylabel('权值');%y轴
theta3 = net.b{3};%输出层各神经元阈值
subplot(3,2,6) 
plot(theta3);%绘图函数
title('输出层各神经元阈值');
xlabel('第x个神经元');  %x轴
ylabel('阈值');%y轴

end

