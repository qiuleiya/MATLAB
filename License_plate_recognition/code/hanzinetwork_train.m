function net = hanzinetwork_train(train_data,train_label )
% ÊäÈë£ºÑµÁ·Í¼ÏñÌØÕ÷ºÍlabel¡£Êä³ö£ºÑµÁ·ºÃµÄÉñ¾­ÍøÂç

% BPÍøÂçÑµÁ·
% ³õÊ¼»¯ÍøÂç½á¹¹
layer=[40,60];    %Òşº¬²ã
net=newff(train_data,train_label,layer);    
net.trainParam.epochs=1000;
net.trainParam.lr=0.05;       
net.trainParam.goal=0.001;
net.trainFcn='trainrp';
% ÍøÂçÑµÁ·
net=train(net,train_data,train_label);
end