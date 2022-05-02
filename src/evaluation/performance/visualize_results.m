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
labels = [];
for i=1:N
  labels = [ labels ; repmat( sprintf("%d",i) , Ns , 1 ) ];
end

%% VISUALIZATION
figure
hold on
boxplot(V7Ddyn(:)/1000,labels)
grid on
ylim([ 0 , max([V7Ddyn(:)/1000 ; GLdyn(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('V7DParser')
set(gcf, 'Position', [680 558 560 440])

figure
hold on
boxplot(GLdyn(:)/1000,labels)
grid on
ylim([ 0 , max([V7Ddyn(:)/1000 ; GLdyn(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('GerbLib')
set(gcf, 'Position', [680 558 560 440])

figure
hold on
boxplot(V7Dstc(:)/1000,labels)
grid on
ylim([ 0 , max([GLstc(:)/1000 ; V7Dstc(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('V7DParser')
set(gcf, 'Position', [680 558 560 440])

figure
hold on
boxplot(GLstc(:)/1000,labels)
grid on
ylim([ 0 , max([GLstc(:)/1000 ; V7Dstc(:)/1000]) ])
xlabel('#D03 of a C standard aperture \rightarrow')
ylabel('time (ms) \rightarrow')
title('GerbLib')
set(gcf, 'Position', [680 558 560 440])