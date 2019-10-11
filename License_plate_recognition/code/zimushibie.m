function out = zimushibie()
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
 load('net2.mat')
zimu=char(['A' 'J':'S' 'B' 'T':'Z' 'C':'I']);
[filename, pathname] = uigetfile('*.bmp', '读取图片文件'); %选择图片文件

       pathfile=fullfile(pathname, filename);  %获得图片路径
     
       z=imread(pathfile);     %将图片读入矩阵
     out=zimu(testAnser(z,net2));
     figure;
     imshow(z);title(['识别结果为=' num2str(out)]) 

end
