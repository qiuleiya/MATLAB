function out = shuzizimushibie()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 load('net4.mat');
 hun=char(['0' '1' 'A':'H' 'JK' '2' 'L':'N' 'P':'V' '3' 'W':'Z' '4':'9']);
[filename, pathname] = uigetfile('*.bmp', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�

       pathfile=fullfile(pathname, filename);  %���ͼƬ·��
     
       z=imread(pathfile);     %��ͼƬ�������
     a=hun(testAnser(z,net4));
     figure;
     imshow(z);title(['ʶ����Ϊ=' num2str(a)]);
    



end

