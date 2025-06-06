function dx=fun3(t,x)   % 大家可以修改里面的参数，来看结果的变化
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    u = 0.002;  % 人口出生率
    v = 0.001;  % 自然死亡率
    dx = zeros(3,1);  % x(1)表示易感染者S  x(2)表示已感染者I  x(3)表示自然死亡人数ND
    dx(1) = - beta*x(1)*x(2)/(x(1)+x(2)) +u*(x(1)+x(2)) - v*x(1);  
    dx(2) = beta*x(1)*x(2)/(x(1)+x(2)) - v*x(2);
    dx(3) = v*x(1) + v*x(2);
end
