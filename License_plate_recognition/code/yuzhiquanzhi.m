function  yuzhiquanzhi(net)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
V = net.iw{1,1};%����㵽�м��Ȩֵ
subplot(3,2,1) 
plot(V);%��ͼ����
title('����㵽�м���Ȩֵ');
xlabel('��x����Ԫ');  %x��
ylabel('Ȩֵ');%y��
theta1 = net.b{1};%����1�����Ԫ��ֵ
subplot(3,2,2) 
 plot(theta1);%��ͼ����
title('����1�����Ԫ��ֵ');
xlabel('��x����Ԫ');  %x��
ylabel('��ֵ');%y��

W1 = net.lw{2,1};%����1�㵽2��Ȩֵ
subplot(3,2,3) 
 plot(W1);%��ͼ����
title('����1�㵽2��Ȩֵ');
xlabel('��x����Ԫ');  %x��
ylabel('Ȩֵ');%y��
theta2 =net.b{2};%����2�����Ԫ��ֵ
subplot(3,2,4) 
 plot(theta2);%��ͼ����
title('����2�����Ԫ��ֵ');
xlabel('��x����Ԫ');  %x��
ylabel('��ֵ');%y��

W2=net.lw{3,2};%2�㵽�����
subplot(3,2,5) 
 plot(W2);%��ͼ����
title('����2�㵽������Ȩֵ');
xlabel('��x����Ԫ');  %x��
ylabel('Ȩֵ');%y��
theta3 = net.b{3};%��������Ԫ��ֵ
subplot(3,2,6) 
plot(theta3);%��ͼ����
title('��������Ԫ��ֵ');
xlabel('��x����Ԫ');  %x��
ylabel('��ֵ');%y��

end

