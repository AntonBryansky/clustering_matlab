function create_clusters_plots( file )
%GET_CLUSTERIZATION Summary of this function goes here
%   Detailed explanation goes here
%   ����� ���������� ���������
number_of_clusters = 4;
%   �������� ���� �� ����� � ������
[path, ~, ~] = fileparts(file);
%   ��������� ������ �� �����
[from_sensor_1, from_sensor_2] = get_table_from_xlsx(file);
%   �������� ��������� ��������
amps1 = from_sensor_1(:, 6);
amps2 = from_sensor_2(:, 6);
%   �������� ������� ��������
energy1 = from_sensor_1(:, 8);
energy2 = from_sensor_2(:, 8);
%   ������������ ����������������� ��������
prolongations1 = calculate_prolongation(amps1, energy1);
prolongations2 = calculate_prolongation(amps2, energy2);
%   ��������� �������
sample1 = [amps1, prolongations1];
sample2 = [amps2, prolongations2];

%   ���������� � ������������� ��������
%   �������� �������� �������� � �� ��������� ������� k-means
[kmeans_clusters1, kmeans_centroids1] = split_data_by_kmeans(sample1, number_of_clusters);
[kmeans_clusters2, kmeans_centroids2] = split_data_by_kmeans(sample2, number_of_clusters);
%   �������� �������� �������� � �� ��������� ������� c-means
[cmeans_clusters1, cmeans_centroids1] = split_data_by_cmeans(sample1, number_of_clusters);
[cmeans_clusters2, cmeans_centroids2] = split_data_by_cmeans(sample2, number_of_clusters);
%   ������������� SOM ����������
[SOMNN_clusters1, SOMNN_centroids1] = SOMNN_clustering(sample1);
[SOMNN_clusters2, SOMNN_centroids2] = SOMNN_clustering(sample2);


%   �������� ������ ���� �� ����� � ���������
plots_directory = strcat(path, '\clusters_plots');
%   ������ ����� ��� �������� � ���������� ��������� ����� xlsx
mkdir(plots_directory);

%   ������ ������ �������

%   k-means
%   � ������� �������
kmeans1_figure = figure('doublebuffer','off','Visible','Off');
plot(kmeans_clusters1{1, 1}(:, 2), kmeans_clusters1{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters1{2, 1}(:, 2), kmeans_clusters1{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters1{3, 1}(:, 2), kmeans_clusters1{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters1{4, 1}(:, 2), kmeans_clusters1{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(kmeans_centroids1(:, 2), kmeans_centroids1(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
kmeans1_path = strcat(plots_directory, '/', 'kmeans1');
print(kmeans1_path, '-dpng');
%   �� ������� �������
kmeans2_figure = figure('doublebuffer','off','Visible','Off');
plot(kmeans_clusters2{1, 1}(:, 2), kmeans_clusters2{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters2{2, 1}(:, 2), kmeans_clusters2{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters2{3, 1}(:, 2), kmeans_clusters2{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters2{4, 1}(:, 2), kmeans_clusters2{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(kmeans_centroids2(:, 2), kmeans_centroids2(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
kmeans2_path = strcat(plots_directory, '/', 'kmeans2');
print(kmeans2_path, '-dpng');


%   c-means
%   � ������� �������
cmeans1_figure = figure('doublebuffer','off','Visible','Off');
plot(cmeans_clusters1{1, 1}(:, 2), cmeans_clusters1{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters1{2, 1}(:, 2), cmeans_clusters1{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters1{3, 1}(:, 2), cmeans_clusters1{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters1{4, 1}(:, 2), cmeans_clusters1{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(cmeans_centroids1(:, 2), cmeans_centroids1(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
cmeans1_path = strcat(plots_directory, '/', 'cmeans1');
print(cmeans1_path, '-dpng');
%   �� ������� �������
cmeans2_figure = figure('doublebuffer','off','Visible','Off');
plot(cmeans_clusters2{1, 1}(:, 2), cmeans_clusters2{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters2{2, 1}(:, 2), cmeans_clusters2{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters2{3, 1}(:, 2), cmeans_clusters2{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters2{4, 1}(:, 2), cmeans_clusters2{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(cmeans_centroids2(:, 2), cmeans_centroids2(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
cmeans2_path = strcat(plots_directory, '/', 'cmeans2');
print(cmeans2_path, '-dpng');


%   SOMNN
%   � ������� �������
SOMNN1_figure = figure('doublebuffer','off','Visible','Off');
plot(SOMNN_clusters1{1, 1}(:, 2), SOMNN_clusters1{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters1{2, 1}(:, 2), SOMNN_clusters1{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters1{3, 1}(:, 2), SOMNN_clusters1{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters1{4, 1}(:, 2), SOMNN_clusters1{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(SOMNN_centroids1(:, 2), SOMNN_centroids1(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
SOMNN1_path = strcat(plots_directory, '/', 'SOMNN1');
print(SOMNN1_path, '-dpng');
%   �� ������� �������
SOMNN2_figure = figure('doublebuffer','off','Visible','Off');
plot(SOMNN_clusters2{1, 1}(:, 2), SOMNN_clusters2{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters2{2, 1}(:, 2), SOMNN_clusters2{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters2{3, 1}(:, 2), SOMNN_clusters2{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters2{4, 1}(:, 2), SOMNN_clusters2{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(SOMNN_centroids2(:, 2), SOMNN_centroids2(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
SOMNN2_path = strcat(plots_directory, '/', 'SOMNN2');
print(SOMNN2_path, '-dpng');

%   ��������
good_news = ['Plots creating for file ' file ' has been finished succesful'];
disp(good_news);
end

