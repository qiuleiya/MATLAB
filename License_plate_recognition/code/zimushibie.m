function out = zimushibie()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
 load('net2.mat')
zimu=char(['A' 'J':'S' 'B' 'T':'Z' 'C':'I']);
[filename, pathname] = uigetfile('*.bmp', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�

       pathfile=fullfile(pathname, filename);  %���ͼƬ·��
     
       z=imread(pathfile);     %��ͼƬ�������
     out=zimu(testAnser(z,net2));
     figure;
     imshow(z);title(['ʶ����Ϊ=' num2str(out)]) 

end
