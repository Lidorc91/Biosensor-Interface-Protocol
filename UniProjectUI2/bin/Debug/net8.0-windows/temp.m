%%
% clear all; close all; clc;
% addpath('C:\Users\katanmi\OneDrive - Bar-Ilan University - Students\BIU server\MATLAB\PPG codes')
% addpath('C:\Users\katanmi\OneDrive - Bar-Ilan University - Students\BIU server\MATLAB\PPG codes\OxyD')

%%
% Get list of all CSV files in the current directory
csvFiles = dir('*.csv');

% Check if there are any CSV files
if isempty(csvFiles)
    error('No CSV files found in the current directory.');
end

% Filter out files that contain '_PPG_output' in their names
filteredFiles = csvFiles(~contains({csvFiles.name}, '_PPG_output'));

% Check if there are any files left after filtering
if isempty(filteredFiles)
    error('No CSV files found excluding "_PPG_output".');
end

% Sort the filtered files based on the 'datenum' property to get the most recent one
[~, idx] = max([filteredFiles.datenum]);

% Get the most recent file name
recentFile = filteredFiles(idx).name;

[start_csv,finish_csv] = regexp(recentFile,'.csv');
file_name = recentFile(1:start_csv-1);
new_file_name = [file_name, '_PPG_output.csv'];