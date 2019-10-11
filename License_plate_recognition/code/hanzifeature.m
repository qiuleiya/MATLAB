%①把字符水平分成四份,垂直分成两份,分别统计这8个区域的白像素的个数,得到8个特征。
%②水平和垂直各划两条线把水平和垂直分割成三分, 统计这四条线穿过的白像素个数,得到4个特征。
%③字符图像全部白像素数目作为1个特征, 总共得到13个特征。
function hanfeature=hanzifeature(img)

for i=1:length(img)
    d=im2bw(img{i},graythresh(img{i}));
    count=13;%选取特征个数
ff=zeros(1,count);%特征
[m,n]=size(d);
%B=blkproc(Image,[m n])
%水平分成四份,垂直分成两份,分别统计这8个区域的白像素的个数,得到8个特征
low = 4; % 水平块数
row=2;%垂直块数
ch = m/low; cw = n/row;
t1 = (0:low-1)*ch + 1; t2 = (1:low)*ch;
t3 = (0:row-1)*cw + 1; t4 = (1:row)*cw;
for x = 1 : low
    for j = 1 : row
        temp = d(t1(x):t2(x), t3(j):t4(j));
        %subplot(low, row, (i-1)*row+j);
        %imshow(temp, 'border', 'tight');
        ff((x-1)*row+j)=sum(sum(temp));%统计这8个区域的白像素的个数,得到8个特征
    end
end
%水平和垂直各划两条线把水平和垂直分割成三分, 统计这四条线穿过的白像素个数,得到4个特征
num=2;%划分数
for k=1:num
    ff(low*row+k)=sum(d(round(k*m/(num+1)),:));%水平线白像素和
end
for k=1:num
    ff(low*row+num+k)=sum(d(:,round(k*n/(num+1))));%垂直线白像素和
end
ff(count)=sum(sum(d));%图像全像素和
hanfeature(:,i)=ff;
end


