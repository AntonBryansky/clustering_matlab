%file = strcat('E:\�����������\MatLab\Clustering', '\', '�12��_01_20160111 full.xlsx');
%file = 'C:\Users\�����\Dropbox\Documents\�����������\MatLab\Clustering\�12��_01_20160111 full.xlsx';
%create_clusters_plots(file);

%   �������� ���� �� �������� ����� � �������
root_dir = 'F:\�����������\Experimental\������ � ���������� ��������� �������� + ��\�� ����������';
%   �������� ������ ������ � ������ ���������� ������ � �������������
%   ������ � ������� �� ������� ��������
files = searcher(root_dir, 'xlsx', 'loc');
%   ����� �������� �����, �������� �������
%   ���������� ���������� ������
files_counts = length(files);
%   ���������� ������
for i = 1:files_counts
%   ������ �������
    create_clusters_plots(files{i, 1});
end

disp('Well done!');