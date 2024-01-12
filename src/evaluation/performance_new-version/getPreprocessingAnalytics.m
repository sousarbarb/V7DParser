function [analytics] = getPreprocessingAnalytics(data)
%[ANALYTICS] = GETPREPROCESSINGANALYTICS(DATA)
%
% Compute average, median, standard deviation, minimum, and maximum
% indicators for the input data
%
%   DATA     : rows are the Gerber file index used in testing
%              cols are the index of the test evaluation sample
%
%   ANALYTICS: data structure with the indicators
%

  analytics.mean = mean(data,2);

  analytics.median = median(data,2);

  analytics.std = std(data,ones(1,size(data,2)),2);

  analytics.min = min(data,[],2);

  analytics.min = max(data,[],2);

end

