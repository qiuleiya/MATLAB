function net = shuzizimunet()
%UNTITLED14 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
root4='./data/numberzimu/';
img4=read_train(root4);
%% ��ȡ����
img_feature4=feature_lattice(img4);

%% �������ֵı�ǩ
class4=34;                   %ʮ�е���������Ӧλ����1������Ϊ0
numberpclass=200;       
ann_label4=zeros(class4,numberpclass*class4);            %lable�Ǳ�ǩ
ann_data4=img_feature4;                           
for i=1:class4                   
 for j=numberpclass*(i-1)+1:numberpclass*i   %��ÿһ��ͼƬ���ϱ�ǩ
     ann_label4(i,j)=1;                 
 end
end

%% ѡ��ѵ�����Ͳ��Լ�����1
k4=rand(1,numberpclass*class4);  
[m4,n4]=sort(k4);  
ntraindata4=6000;       %�������磬��ѵ��    
ntestdata4=800;          %δ���ֹ��ģ�������   
train_data4=ann_data4(:,n4(1:ntraindata4));                    %�и�35��500��
test_data4=ann_data4(:,n4(ntraindata4+1:numberpclass*class4));   %10��500��
train_label4=ann_label4(:,n4(1:ntraindata4));                 
test_label4=ann_label4(:,n4(ntraindata4+1:numberpclass*class4)); %���ǩ


%% BP�����紴����ѵ���Ͳ���
 net4=shuzizimunetwork_train(train_data4,train_label4);      %ѵ������ѵ����ǩ
 predict_label4=network_test(test_data4,net4);           %Ԥ�⣬ʣ�µ�500��

  
  %% ������ȷ�ʼ���
[u,v]=find(test_label4==1);    %�±�����
label4=u';
error=label4-predict_label4;
accuracy4=size(find(error==0),2)/size(label4,2)           %׼ȷ��
%%
str1=['����+��ĸ������ʶ��ѵ����׼ȷ��Ϊ',num2str(accuracy4)];
msgbox(str1)
%%
% hun=char(['0' '1' 'A':'H' 'JK' '2' 'L':'N' 'P':'V' '3' 'W':'Z' '4':'9']);
% [filename, pathname] = uigetfile('*.bmp', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�
% 
%        pathfile=fullfile(pathname, filename);  %���ͼƬ·��
%      
%        z=imread(pathfile);     %��ͼƬ�������
%      a=hun(testAnser(z,net4));
%      figure;
%      imshow(z);title(['ʶ����Ϊ=' num2str(a)]);
%
figure('name','������ĸ������ģ�͸���ֵȨֵ');
yuzhiquanzhi(net4);
net=net4;
end