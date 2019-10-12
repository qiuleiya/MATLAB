function out = testAnser(testImg,net)
testimg_feature=testFeature(testImg);
testAn=sim(net,testimg_feature);
out=find(testAn==max(testAn))