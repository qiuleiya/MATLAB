function out = shibie()
%UNTITLED7 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
load('net3.mat');
load('net4.mat');
hun=char(['0' '1' 'A':'H' 'JK' '2' 'L':'N' 'P':'V' '3' 'W':'Z' '4':'9']);
hanzi=char(['��' '��' '��' '��' '��' '��' '��' '³' '��' 'ԥ']);

 img= imread(strcat('./chepai/1.bmp'));
 a=hanzi(hanzitestAnser(img,net3));
x='';
for i=1:6
     img0 = imread(strcat('./chepai/',num2str(i+1),'.bmp'));%�ļ�����·��
     x=[x hun(testAnser(img0,net4))];
     
end
out=strcat(a,x);
str1=['���ƺ�ʶ����Ϊ��' out ];
msgbox(str1);
end

