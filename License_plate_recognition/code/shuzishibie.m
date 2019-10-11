function out = shuzishibie()
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
 load('net1.mat')
shuzi=char(['0':'9']);
[filename, pathname] = uigetfile('*.bmp', '读取图片文件'); %选择图片文件

       pathfile=fullfile(pathname, filename);  %获得图片路径
     
       M=imread(pathfile);     %将图片读入矩阵
       out=shuzi(testAnser(M,net1));
       figure;
     imshow(M);title(['识别结果为=' out]);
end

