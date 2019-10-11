function out = shuzizimushibie()
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
 load('net4.mat');
 hun=char(['0' '1' 'A':'H' 'JK' '2' 'L':'N' 'P':'V' '3' 'W':'Z' '4':'9']);
[filename, pathname] = uigetfile('*.bmp', '读取图片文件'); %选择图片文件

       pathfile=fullfile(pathname, filename);  %获得图片路径
     
       z=imread(pathfile);     %将图片读入矩阵
     a=hun(testAnser(z,net4));
     figure;
     imshow(z);title(['识别结果为=' num2str(a)]);
    



end

