close all
clear
clc



%% INITIALIZATION
% rows: gerber file (<dynamic|static>-<index>)
% cols: test sample index

dyn_old_parse = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","B3:U42", ...
    "Sheet","V7DParser_old_raw");

dyn_old_render = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","B46:U85", ...
    "Sheet","V7DParser_old_raw");



stat_old_parse = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","Z3:AS42", ...
    "Sheet","V7DParser_old_raw");

stat_old_render = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","Z46:AS85", ...
    "Sheet","V7DParser_old_raw");





dyn_new_parse = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","B3:U42", ...
    "Sheet","V7DParser_new_raw");

dyn_new_prerender = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","B46:U85", ...
    "Sheet","V7DParser_new_raw");

dyn_new_alloc = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","B89:U128", ...
    "Sheet","V7DParser_new_raw");

dyn_new_render = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","B132:U171", ...
    "Sheet","V7DParser_new_raw");



stat_new_parse = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","Z3:AS42", ...
    "Sheet","V7DParser_new_raw");

stat_new_prerender = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","Z46:AS85", ...
    "Sheet","V7DParser_new_raw");

stat_new_alloc = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","Z89:AS128", ...
    "Sheet","V7DParser_new_raw");

stat_new_render = readmatrix( ...
    "../../../doc/evaluation/performance_new-version/results.xlsx", ...
    "Range","Z132:AS171", ...
    "Sheet","V7DParser_new_raw");





%% PRE-PROCESSING
% mean
% median
% standard deviation
% minimum
% maximum

dyn_old_parse_kpis = getPreprocessingAnalytics(dyn_old_parse);

dyn_old_render_kpis = getPreprocessingAnalytics(dyn_old_render);

stat_old_parse_kpis = getPreprocessingAnalytics(stat_old_parse);

stat_old_render_kpis = getPreprocessingAnalytics(stat_old_render);

dyn_new_parse_kpis = getPreprocessingAnalytics(dyn_new_parse);

dyn_new_prerender_kpis = getPreprocessingAnalytics(dyn_new_prerender);

dyn_new_alloc_kpis = getPreprocessingAnalytics(dyn_new_alloc);

dyn_new_render_kpis = getPreprocessingAnalytics(dyn_new_render);

stat_new_parse_kpis = getPreprocessingAnalytics(stat_new_parse);

stat_new_prerender_kpis = getPreprocessingAnalytics(stat_new_prerender);

stat_new_alloc_kpis = getPreprocessingAnalytics(stat_new_alloc);

stat_new_render_kpis = getPreprocessingAnalytics(stat_new_render);





%% DATA VISUALIZATION

% Dynamic file expansion
visualizeDataAnalytics(dyn_old_parse, dyn_old_render,                       ...
    dyn_new_parse, dyn_new_prerender, dyn_new_alloc, dyn_new_render,        ...
    dyn_old_parse_kpis, dyn_old_render_kpis,                                ...
    dyn_new_parse_kpis, dyn_new_prerender_kpis, dyn_new_alloc_kpis, dyn_new_render_kpis)



% Static file expansion
visualizeDataAnalytics(stat_old_parse, stat_old_render,                       ...
    stat_new_parse, stat_new_prerender, stat_new_alloc, stat_new_render,        ...
    stat_old_parse_kpis, stat_old_render_kpis,                                ...
    stat_new_parse_kpis, stat_new_prerender_kpis, stat_new_alloc_kpis, stat_new_render_kpis)





%% CLOSE OTHER FIGURES

close(1:4)
close (7:14)





%% REFINE FIGURES

figure(5)
title("V7DParser (Sousa et al., 2022)")
xlabel('#D03 of C standard apertures \rightarrow')
ylabel("time (ms) \rightarrow")


saveas(gcf, 'v7dparser_dyn_old', 'epsc')
saveas(gcf, 'v7dparser_dyn_old', 'fig')
saveas(gcf, 'v7dparser_dyn_old', 'png')

figure(6)
title("Modified V7DParser")
xlabel('#D03 of C standard apertures \rightarrow')
ylabel("time (ms) \rightarrow")
ax = gca
ax.YAxis.Exponent = 3;

saveas(gcf, 'v7dparser_dyn_new', 'epsc')
saveas(gcf, 'v7dparser_dyn_new', 'fig')
saveas(gcf, 'v7dparser_dyn_new', 'png')

