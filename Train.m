clc
clear all

%loading pre-trained Alexnet model
net=alexnet;   %name of model
layer=net.Layers;


categories={'Parasitized','Uninfected'};
root_folder='cell_images\train';
imds=imageDatastore(fullfile(root_folder,categories),'LabelSource','foldernames' );

%resizing train data to feed model
inputSize = [227 227];
imds.ReadFcn = @(loc)imresize(imread(loc),inputSize);
%imshow(preview(imds));


layer=layer(1:end-3);
layer(end+1)=fullyConnectedLayer(64,'Name','Special_2');
layer(end+1)=reluLayer;
layer(end+1)=fullyConnectedLayer(2,'Name','fcB_2');
layer(end+1)=softmaxLayer
layer(end+1)=classificationLayer()

% layer(end-2).WeightLearnRateFactor=10;
% layer(end-2).WeightL2Factor=1;
% layer(end-2).BiasLearnRateFactor=20;
% layer(end-2).BiasL2Factor=0;

checkpointPath = 'G:\Machine Learning\DSP-1 Project\In Matlab\Saved Model Checkpoint';   %saving model directory
opts=trainingOptions('sgdm',...
            'LearnRateSchedule','none',...
            'InitialLearnRate',0.0001,...
            'MaxEpochs', 60, ...
            'Verbose',true, ...
            'Plots','training-progress', ...
            'Shuffle','every-epoch', ...
            'CheckpointPath',checkpointPath,...
            'MiniBatchSize', 240);

convnet=trainNetwork(imds,layer,opts);