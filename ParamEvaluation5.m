function gisData = ParamEvaluation5(gisData)
% GMM����ѧϰ
if gisData.v == 1,
    fprintf('Parameter Evaluation... \n');
end

% ��ȡ��Ч����
data_p1 = gisData.data(gisData.all_building,:);
data_p2 = gisData.ext_fsq;

%% ��ý�������GMMģ��, ���ھ�ס��ѡַ,��������(�����߳�,�¶�,��)
trainingData = [data_p1(:,9:13)]';
gisData.model(1).name = 'basic';
gisData.model(1).covType=2;
gisData.model(1).gaussianNum=50;
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;
[gisData.model(1).GMM, logLike]=gmmTrain(trainingData, [gisData.model(1).gaussianNum, gisData.model(1).covType], gmmTrainParam);
gisData.model(1).gmmTrainParam = gmmTrainParam;


%% ��������̾���
trainingData = [data_p1(:,15)]';
gisData.model(2).name = 'dist_river';
gisData.model(2).covType=2;
gisData.model(2).gaussianNum=5;  % barNum = 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(2).GMM, logLike]=gmmTrain(trainingData, [gisData.model(2).gaussianNum, gisData.model(2).covType], gmmTrainParam);
gisData.model(2).gmmTrainParam = gmmTrainParam;


%% ��ɽˮ������̾���
trainingData = [data_p1(:,16)]';
gisData.model(3).name = 'dist_sshx';   % ��ɽˮ������̾���
gisData.model(3).covType=2;
gisData.model(3).gaussianNum=5;  % barNum = 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;
[gisData.model(3).GMM, logLike]=gmmTrain(trainingData, [gisData.model(3).gaussianNum, gisData.model(3).covType], gmmTrainParam);
gisData.model(3).gmmTrainParam = gmmTrainParam;


%% ���滮���·��̾���
% ��ԭ������ѵ��ģ�ͣ��ù滮��ľ������ݣ�idx = 24���������
trainingData = [data_p1(:,17)]';
gisData.model(4).name = 'dist_way';   % ���滮���·��̾���
gisData.model(4).covType=2;
gisData.model(4).gaussianNum=5;  % barNum = 10
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(4).GMM, logLike]=gmmTrain(trainingData, [gisData.model(4).gaussianNum, gisData.model(4).covType], gmmTrainParam);
gisData.model(4).gmmTrainParam = gmmTrainParam;


%% ������·��̾���
trainingData = [data_p1(:,23)]';
gisData.model(5).name = 'dist_highway';   % ������·��̾���
gisData.model(5).covType=2;
gisData.model(5).gaussianNum=5;  % barNum = 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(5).GMM, logLike]=gmmTrain(trainingData, [gisData.model(5).gaussianNum, gisData.model(5).covType], gmmTrainParam);
gisData.model(5).gmmTrainParam = gmmTrainParam;


%% ��������תվ��̾���
trainingData = [data_p1(:,21)]';
gisData.model(6).name = 'dist_ljzzz';   % ��������תվ��̾���
gisData.model(6).covType=2;
gisData.model(6).gaussianNum=5;  % barNum = 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(6).GMM, logLike]=gmmTrain(trainingData, [gisData.model(6).gaussianNum, gisData.model(6).covType], gmmTrainParam);
gisData.model(6).gmmTrainParam = gmmTrainParam;


%% ����ˮ��������̾���
trainingData = [data_p1(:,22)]';
gisData.model(7).name = 'dist_wsclc';   % ����ˮ��������̾���
gisData.model(7).covType=2;
gisData.model(7).gaussianNum=5;  % barNum = 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(7).GMM, logLike]=gmmTrain(trainingData, [gisData.model(7).gaussianNum, gisData.model(7).covType], gmmTrainParam);
gisData.model(7).gmmTrainParam = gmmTrainParam;


%% ��ˮ���ڸ����������ˮ���ڼȴ潨�����
trainingData = data_p2(:,1:2)';
gisData.model(8).name = 'fsq_area';
gisData.model(8).covType=2;
gisData.model(8).gaussianNum=7; % bar = 6
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;
[gisData.model(8).GMM, logLike]=gmmTrain(trainingData, [gisData.model(8).gaussianNum, gisData.model(8).covType], gmmTrainParam);
gisData.model(8).gmmTrainParam = gmmTrainParam;


%% �����彨������̾���
trainingData = gisData.ext_otherDist;
trainingData = trainingData';
gisData.model(9).name = 'dist_other';
gisData.model(9).covType=2;
gisData.model(9).gaussianNum=5;
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(9).GMM, logLike]=gmmTrain(trainingData, [gisData.model(9).gaussianNum, gisData.model(9).covType], gmmTrainParam);
gisData.model(9).gmmTrainParam = gmmTrainParam;
