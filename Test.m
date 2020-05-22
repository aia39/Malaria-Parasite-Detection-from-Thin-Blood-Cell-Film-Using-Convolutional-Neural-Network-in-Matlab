clear all
clc
load('net_checkpoint__3880__2019_09_09__22_13_25','net')
layers=net.Layers;

categories={'Parasitized','Uninfected'};
root_folder='cell_images\valid';
tstds=imageDatastore(fullfile(root_folder,categories),'LabelSource','foldernames' );

inputSize = [227 227];
tstds.ReadFcn = @(loc)imresize(imread(loc),inputSize);

[labels,err_test]=classify(net,tstds,'MiniBatchSize',64);

confmat=confusionmat(tstds.Labels,labels);
confmat=confmat./sum(confmat,2);
mean(diag(confmat))

cm = confusionchart(tstds.Labels,labels);

