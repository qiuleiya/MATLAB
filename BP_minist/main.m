clc;
clear all;
close all;
%% ��ȡͼ��
root='./data/training';
img=read_train(root);         
%% ��ȡ����
img_feature=feature_lattice(img);
%% �����ǩ
class=33;                   %ʮ�е���������Ӧλ����1������Ϊ0
numberpclass=500;       
ann_label=zeros(class,numberpclass*class);            %lable�Ǳ�ǩ
ann_data=img_feature;                           
for i=1:class                   
 for j=numberpclass*(i-1)+1:numberpclass*i   %��ÿһ��ͼƬ���ϱ�ǩ
     ann_label(i,j)=1;                 
 end
end

%% ѡ��ѵ�����Ͳ��Լ�
k=rand(1,numberpclass*class);  
[m,n]=sort(k);  
ntraindata=4500;       %�������磬��ѵ��    
ntestdata=500;          %δ���ֹ��ģ�������   
train_data=ann_data(:,n(1:ntraindata));                    %�и�35��500��
test_data=ann_data(:,n(ntraindata+1:numberpclass*class));   %10��500��
train_label=ann_label(:,n(1:ntraindata));                 
test_label=ann_label(:,n(ntraindata+1:numberpclass*class)); %���ǩ
%% BP�����紴����ѵ���Ͳ���
net=network_train(train_data,train_label);      %ѵ������ѵ����ǩ
predict_label=network_test(test_data,net);           %Ԥ�⣬ʣ�µ�500��
%% ��ȷ�ʼ���
[u,v]=find(test_label==1);    %�±�����
label=u';
error=label-predict_label;
accuracy=size(find(error==0),2)/size(label,2)           %׼ȷ��
figure(1)
plot(error)
title('BP����������','fontsize',12)
xlabel('��������','fontsize',12)
ylabel('�������','fontsize',12)

root='./d';


