function net = hanzinetwork_train(train_data,train_label )
% ���룺ѵ��ͼ��������label�������ѵ���õ�������

% BP����ѵ��
% ��ʼ������ṹ
layer=[40,60];    %������
net=newff(train_data,train_label,layer);    
net.trainParam.epochs=1000;
net.trainParam.lr=0.05;       
net.trainParam.goal=0.001;
net.trainFcn='trainrp';
% ����ѵ��
net=train(net,train_data,train_label);
end