function y = fun(x,label)
%�������ڼ���������Ӧ��ֵ
%x           input           �������� 
%y           output          ������Ӧ��ֵ 
if label==1
    y=-Rastrigin(x);
elseif label==2
    y=-Schaffer(x);
else
    y=-Griewank(x);
end

