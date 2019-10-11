function out = shibie()
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
load('net3.mat');
load('net4.mat');
hun=char(['0' '1' 'A':'H' 'JK' '2' 'L':'N' 'P':'V' '3' 'W':'Z' '4':'9']);
hanzi=char(['京' '闽' '粤' '苏' '沪' '浙' '皖' '鲁' '晋' '豫']);

 img= imread(strcat('./chepai/1.bmp'));
 a=hanzi(hanzitestAnser(img,net3));
x='';
for i=1:6
     img0 = imread(strcat('./chepai/',num2str(i+1),'.bmp'));%文件所在路径
     x=[x hun(testAnser(img0,net4))];
     
end
out=strcat(a,x);
str1=['车牌号识别结果为：' out ];
msgbox(str1);
end

