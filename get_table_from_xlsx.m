function [sens1, sens2] = get_table_from_xlsx(file)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%   ������ ��� �������:
%   1 - ����� ���������; 2 - ����� ���� (���� ���� ���);
%   3 - ��������� ���������� ��������; 4 - ���-�� �������� �� ����;
%   6 - ���������
%   �������� ������ � ������������ ��� ������
sens1 = xlsread(file, '������. �������1');
sens2 = xlsread(file, '������. �������2');
end