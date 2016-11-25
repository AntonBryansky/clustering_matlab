function [ output, centroids ] = split_data_by_kmeans( data, NC )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%   ������ ������� ������ ����� ������� �������
output = cell(NC, 1);
%   ������ �������� ��� ������� ������-���������
clusters_counts = zeros(NC, 1);
%   �������� ������ �� k-means
[idx, centroids] = kmeans(data, NC);
%   ������������ ���������� �������� � ������ ��������
data_length = length(data);

%   ���������� ���������� �������� � ������ �������� ������
for i = 1:data_length
    clusters_counts(idx(i, 1)) = clusters_counts(idx(i, 1)) + 1;
end

%   �������� � ������ ������� � ������ ������� �������
for i = 1:NC
    output{i, 1} = zeros(clusters_counts(i, 1), 2);
end
%   ������ �������� ��� ���������� ������� ����� �������
clusters_counters = ones(NC, 1);
%   �������� ���������� ������� ������
for i = 1:data_length
    output{idx(i, 1), 1}(clusters_counters(idx(i, 1)), 1) = data(i, 1);
    output{idx(i, 1), 1}(clusters_counters(idx(i, 1)), 2) = data(i, 2);
    clusters_counters(idx(i, 1), 1) = clusters_counters(idx(i, 1), 1) + 1;
end
end

