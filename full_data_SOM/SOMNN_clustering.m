function [ output, centroids ] = SOMNN_clustering( data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   �� ��������� 4 ��������
NC = 4;
%   ������ ������� ������ ����� ������� �������
output = cell(NC, 1);
%   ������ �������� ��� ������� ������-���������
clusters_counts = zeros(NC, 1);
%   ������������ ���������� �������� � ������ ��������
data_length = length(data);

%   �������� �������� � ����������
%   ����������� ���������
dimension1 = 2;
dimension2 = 2;
%   ������ ������������������ �����
net = selforgmap([dimension1 dimension2]);
%   �������� ���������� ���� ������ ����������� ��������
net.trainParam.epochs = length(data);
%   ��������� ���������
[net, ~] = train (net, data');
nntraintool('close');
%   ���������� ������ ���������
centroids = net.IW{1, 1};
%   ���������� ����� ������ � ������ �������� �����������
U = net(data');
idx = zeros(data_length, 1);
for i = 1:data_length
    [~, idx(i, 1)] = max(U(:, i));
end
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