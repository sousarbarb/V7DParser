function [] = visualizeDataAnalytics(old_parse_raw, old_render_raw,         ...
                                     new_parse_raw, new_prerender_raw,      ...
                                     new_alloc_raw, new_render_raw,         ...
                                     old_parse_kpis,old_render_kpis,        ...
                                     new_parse_kpis, new_prerender_kpis,    ...
                                     new_alloc_kpis, new_render_kpis)
%[] = VISUALIZEDATAANALYTICS(...)
%
% Visualize 2 bar plots, each one for the older and newer versions of the Gerber
% parser, respectively.
%

  N = size(old_parse_raw,1);



  old_parse_raw  = old_parse_raw  ./ 1000;
  old_render_raw = old_render_raw ./ 1000;

  new_parse_raw     = new_parse_raw     ./ 1000;
  new_prerender_raw = new_prerender_raw ./ 1000;
  new_alloc_raw     = new_alloc_raw     ./ 1000;
  new_render_raw    = new_render_raw    ./ 1000;



  old_data_mean   = [ old_parse_kpis.mean   , old_render_kpis.mean   ] ./ 1000;
  old_data_median = [ old_parse_kpis.median , old_render_kpis.median ] ./ 1000;

  new_data_mean   = [
    new_parse_kpis.mean , new_prerender_kpis.mean , new_alloc_kpis.mean,  new_render_kpis.mean
  ] ./ 1000;
  new_data_median = [
    new_parse_kpis.median , new_prerender_kpis.median , new_alloc_kpis.median,  new_render_kpis.median
  ] ./ 1000;



  figure
  hold on
  bar(old_data_mean, "stacked")
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max(sum(old_data_mean,2),[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Bar Plot - V7DParser v1 (mean)")

  figure
  hold on
  bar(new_data_mean, "stacked")
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max(sum(new_data_mean,2),[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Bar Plot - V7DParser v2 (mean)")

  figure
  hold on
  bar(old_data_median, "stacked")
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max(sum(old_data_median,2),[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Bar Plot - V7DParser v1 (mean)")

  figure
  hold on
  bar(new_data_median, "stacked")
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max(sum(new_data_median,2),[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Bar Plot - V7DParser v2 (mean)")



  xaxislb = cell(N,1);
  for i=1:N
    if((i==1) || (floor(i/5) == ceil(i/5)))
      xaxislb{i} = sprintf('%d',i);
    else
      xaxislb{i} = '';
    end
  end

  figure
  hold on
  boxplot(old_parse_raw' + old_render_raw')
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max(old_parse_raw + old_render_raw,[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Box Plot - V7DParser v1")
  axisfig = gca;
  axisfig.XAxis.TickLabels = xaxislb;
  axisfig.XAxis.TickLabelRotation = 0;

  figure
  hold on
  boxplot(new_parse_raw' + new_prerender_raw' + new_alloc_raw' + new_render_raw')
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max(new_parse_raw + new_prerender_raw + new_alloc_raw + new_render_raw,[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Box Plot - V7DParser v2")
  axisfig = gca;
  axisfig.XAxis.TickLabels = xaxislb;
  axisfig.XAxis.TickLabelRotation = 0;

  figure
  hold on
  boxplot(old_parse_raw' + old_render_raw')
  boxplot(new_parse_raw' + new_prerender_raw' + new_alloc_raw' + new_render_raw')
  grid on
  xlim([ 0 , N+1 ])
  ylim([ 0 , max([ old_parse_raw + old_render_raw , new_parse_raw + new_prerender_raw + new_alloc_raw + new_render_raw ],[],"all")])
  xlabel('#D03 of a C standard aperture @ resolution 0.0005 mm/px \rightarrow')
  ylabel("time (ms) \rightarrow")
  title("Box Plot - V7DParser v2")
  axisfig = gca;
  axisfig.XAxis.TickLabels = xaxislb;
  axisfig.XAxis.TickLabelRotation = 0;

end

