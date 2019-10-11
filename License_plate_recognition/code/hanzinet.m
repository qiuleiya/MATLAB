function net = hanzinet()
%����������
%% ��ȡͼ��
root3='./data/hanzi/';
img3=read_train(root3);

%% ��ȡ����
img_feature3=hanzifeature(img3);

%% ���캺�ֱ�ǩ
class3=10;                   %ʮ�е���������Ӧλ����1������Ϊ0
numberpclass=200;       
ann_label3=zeros(class3,numberpclass*class3);            %lable�Ǳ�ǩ
ann_data13=img_feature3;                           
for i=1:class3                 
 for j=numberpclass*(i-1)+1:numberpclass*i   %��ÿһ��ͼƬ���ϱ�ǩ
     ann_label3(i,j)=1;                 
 end
end
 %%  ����ѵ����3
k3=rand(1,numberpclass*class3);  
[m3,n3]=sort(k3);  
ntraindata3=1800;       %�������磬��ѵ��    
ntestdata3=200;          %δ���ֹ��ģ�������   
train_data3=ann_data13(:,n3(1:ntraindata3));                    %13*1800
test_data3=ann_data13(:,n3(ntraindata3+1:numberpclass*class3));   %13*200
train_label3=ann_label3(:,n3(1:ntraindata3));                 
test_label3=ann_label3(:,n3(ntraindata3+1:numberpclass*class3)); %���ǩ

 %% ����������
net3=hanzinetwork_train(train_data3,train_label3);      %ѵ������ѵ����ǩ
predict_label3=network_test(test_data3,net3);           %Ԥ�⣬ʣ�µ�500��

%% ����ʶ����ȷ��
[u,v]=find(test_label3==1);    %�±�����
label3=u';
error=label3-predict_label3;
accuracy3=size(find(error==0),2)/size(label3,2)           %׼ȷ��
%%
str1=['����������ʶ��ѵ����׼ȷ��Ϊ',num2str(accuracy3)];
msgbox(str1)
%%
 figure('name','����������ģ�͸���ֵȨֵ');
yuzhiquanzhi(net3);
net=net3;
end


