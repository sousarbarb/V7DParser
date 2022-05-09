close all
clear all
clc

%% INITIALIZATION
V7DParser = readmatrix("../../../doc/evaluation/performance/results.xlsx","Range","B3:U82","Sheet","V7DParser");
GerbLib   = readmatrix("../../../doc/evaluation/performance/results.xlsx","Range","B3:U82","Sheet","GerbLib");
[N,Ns] = size(V7DParser);
N = round(N / 2);

V7Ddyn = V7DParser(1:N,:)';
GLdyn  = GerbLib(1:N,:)';
V7Dstc = V7DParser(N+1:end,:)';
GLstc  = GerbLib(N+1:end,:)';

%% LABELS
labels = cell(1,N);
xaxislb = cell(N,1);
for i=1:N
  labels{i} = sprintf("%d",i);
  if((i==1) || (floor(i/5) == ceil(i/5)))
    xaxislb{i} = sprintf('%d',i);
  else
    xaxislb{i} = '';
  end
end

%% VISUALIZATION
figure
hold on
boxplot(V7Ddyn/1000,labels,'LabelOrientation','horizontal')
grid on
xlim([ 0 , N+1 ])
ylim([ 0 , max([V7Ddyn(:)/1000 ; GLdyn(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('V7DParser')
set(gcf, 'Position', [680 558 560 440])
axisfig = gca;
axisfig.XAxis.TickLabels = xaxislb;
axisfig.XAxis.TickLabelRotation = 0;

figure
hold on
boxplot(GLdyn/1000,labels)
grid on
xlim([ 0 , N+1 ])
ylim([ 0 , max([V7Ddyn(:)/1000 ; GLdyn(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('GerbLib')
set(gcf, 'Position', [680 558 560 440])
axisfig = gca;
axisfig.XAxis.TickLabels = xaxislb;
axisfig.XAxis.TickLabelRotation = 0;

figure
hold on
boxplot(V7Dstc/1000,labels)
grid on
xlim([ 0 , N+1 ])
ylim([ 0 , max([GLstc(:)/1000 ; V7Dstc(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('V7DParser')
set(gcf, 'Position', [680 558 560 440])
axisfig = gca;
axisfig.XAxis.TickLabels = xaxislb;
axisfig.XAxis.TickLabelRotation = 0;

figure
hold on
boxplot(GLstc/1000,labels)
grid on
xlim([ 0 , N+1 ])
ylim([ 0 , max([GLstc(:)/1000 ; V7Dstc(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('GerbLib')
set(gcf, 'Position', [680 558 560 440])
axisfig = gca;
axisfig.XAxis.TickLabels = xaxislb;
axisfig.XAxis.TickLabelRotation = 0;