function dx=fun4(t,x)   % 大家可以修改里面的参数，来看结果的变化
    beta = 0.1;  % 易感染者与已感染者接触且被传染的强度
    d = 0.01;  % 得病的死亡率
    dx = zeros(3,1);  % x(1)表示易感染者S  x(2)表示已感染者I  x(3)表示患病死亡人数ID
    dx(1) = - beta*x(1)*x(2)/(x(1)+x(2)) ;  
    dx(2) = beta*x(1)*x(2)/(x(1)+x(2)) -d*x(2);
    dx(3) = d*x(2);
end


