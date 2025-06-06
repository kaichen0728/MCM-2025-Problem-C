% 更新15里面我们讲过的SIR模型
clear;clc
load mydata.mat  % 导入数据（共三列，分别是S,I,R的数量）
n = size(mydata,1);  % 一共有多少行数据
true_s = mydata(:,1);   
true_i = mydata(:,2);
true_r = mydata(:,3);
figure(1) 
plot(1:n,true_s,'r-',1:n,true_i,'b-',1:n,true_r,'g-')  % S的数量太大了
legend('S','I','R')
plot(1:n,true_i,'b-',1:n,true_r,'g-') % 单独画出真实的I和R的数量
hold on  % 等会接着在这个图形上面画图

% 随便先给一组参数来计算微分方程的数值解
beta = 0.1;   % 易感染者与已感染者接触且被传染的强度
gamma = 0.01;  % 康复率
[t,p]=ode45(@(t,x) SIR_fun(t,x,beta,gamma), [1:n],[true_s(1) true_i(1) true_r(1)]);
% p就是计算的数值解，它有三列，分别是S I R的数量
p = round(p);  % 对p进行四舍五入(人数为整数)
% 注意，四舍五入后有可能出现总人数之和不为10000的情况，例如为9999或10001，但是这种误差可以忽略不计。
plot(1:n,p(:,2),'b--',1:n,p(:,3),'g--') 
legend('I','R','拟合的I','拟合的R')
hold off  % 和hold on对应
% 计算残差平方和
sse = sum((true_s - p(:,1)).^2  + (true_i -  p(:,2)).^2  + (true_r - p(:,3)).^2)


%% 网格法搜索（枚举法） 地毯式搜索
BETA = 0.1:0.01:0.3;  % 估计一个BETA所在的范围
GAMMA = 0.01:0.001:0.1;  % 估计一个GAMMA所在的范围
n1 = length(BETA);
n2 = length(GAMMA);
SSE = zeros(n1,n2);  % 初始化残差平方和矩阵
for i = 1:n1
    for j = 1:n2
        beta = BETA(i);
        gamma = GAMMA(j);
        [t,p]=ode45(@(t,x) SIR_fun(t,x,beta,gamma), [1:n],[true_s(1) true_i(1) true_r(1)]);
        % p就是计算的数值解，它有三列，分别是S I R的数量
        p = round(p);  % 对p进行四舍五入(人数为整数)
        % 计算残差平方和
        sse = sum((true_s - p(:,1)).^2  + (true_i -  p(:,2)).^2  + (true_r - p(:,3)).^2);
        SSE(i,j) = sse;
    end
end
% 画出SSE这个矩阵的热力图，放到论文中显得高大上
figure(2) 
pcolor(GAMMA,BETA,SSE)  % 注意，这里GAMMA和BETA的顺序不能反了（类似于更新13里面的mesh函数的用法）
colorbar % 加上颜色条
% 找到sse最小的那组参数
min_sse = min(min(SSE));  % 注意，min(SSE)是找出每一列的最小值，因此我们还需要再使用一次min函数才能找到整个矩阵里面的最小值
[r,c] = find(SSE == min_sse,1);  % find后面加了一个1，表示返回第一个最小值所在的行和列的序号
beta = BETA(r)
gamma = GAMMA(c)

figure(3)
plot(1:n,true_i,'b-',1:n,true_r,'g-') % 单独画出真实的I和R的数量
hold on
[t,p]=ode45(@(t,x) SIR_fun(t,x,beta,gamma), [1:n],[true_s(1) true_i(1) true_r(1)]);
% p就是计算的数值解，它有三列，分别是S I R的数量
p = round(p);  % 对p进行四舍五入(人数为整数)
plot(1:n,p(:,2),'b--',1:n,p(:,3),'g--') 
legend('I','R','拟合的I','拟合的R')
hold off
% 计算残差平方和
sse = sum((true_s - p(:,1)).^2  + (true_i -  p(:,2)).^2  + (true_r - p(:,3)).^2)
% beta =0.2100
% gamma =0.0420
% sse =2302

%% 思考：能不能再让这个找到的结果更好点？
BETA = 0.2:0.0001:0.22;  % 缩小BETA所在的搜索范围
GAMMA = 0.041:0.0001:0.043;  % 缩小GAMMA所在的搜索范围
% 这样可能会陷入局部最优解！
% beta =0.2094
% gamma =0.0415
% sse =2219

% 下个视频我们讲的粒子群算法，得到的结果为：
% beta =0.2067
% gamma =0.0388
% sse =2185

% 总结：
% 搜索的精度越高（网格划分的越细），搜索耗费的时间越长
% 如果缩小网格搜索范围（可以减少搜索时间）可能会让我们找到的解陷入局部最优
% 另外，如果我们有多个要搜索的变量，网格搜索法就很难办了，多重循环会大大增加搜索时间！


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）
