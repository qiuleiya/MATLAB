function out = hanzitestAnser(hanziImg,net)
hanzitestimg_feature=hanzitestFeature(hanziImg);
testAn=sim(net,hanzitestimg_feature);
out=find(testAn==max(testAn));

