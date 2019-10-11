function net = shuzizimunetwork_train(train_data,train_label )
% ÊäÈë£ºÑµÁ·Í¼ÏñÌØÕ÷ºÍlabel¡£Êä³ö£ºÑµÁ·ºÃµÄÉñ¾­ÍøÂç

% BPÍøÂçÑµÁ·
% ³õÊ¼»¯ÍøÂç½á¹¹
layer=[50,100];    %Òşº¬²ã
net=newff(train_data,train_label,layer);    
net.trainParam.epochs=800;
net.trainParam.lr=0.1;       
net.trainParam.goal=0.001;
net.trainFcn='trainrp';
% ÍøÂçÑµÁ·
net=train(net,train_data,train_label);

end

