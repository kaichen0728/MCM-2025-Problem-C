%% 符号函数的求导
clear;clc

% 一元函数的导数
syms x
y = x^4-5*x^2+6
diff(y) %求一阶导数
% 4*x^3 - 10*x
diff(y,2) %求二阶导数
% 12*x^2 - 10

y = cos(x)*tan(x)
dy = diff(y,10)  %求十阶导数
simplify(dy)
y = sin(x)*tan(x)
dy = diff(y,10)  %求十阶导数
simplify(dy)


% 多元函数的导数
syms x1 x2 x3
y1 = x1^5*x2+x2*x3-x1^2*x3
py1 = diff(y1,x1,1) % 对x1求一阶偏导
% 5*x2*x1^4 - 2*x3*x1
py2 = diff(y1,x1,2) % 对x1求二阶偏导
% 20*x2*x1^3 - 2*x3
py3 = diff(y1,x1,x2) % 先对x1求偏导，再对x2求偏导
% 5*x1^4
py4 = diff(y1,x2,x1) % 先对x2求偏导，再对x1求偏导
% 5*x1^4


%% 注意，如果diff函数作用的对象不是符号函数，而是矩阵，那么对应的功能是求差分。
A=[4 5 6 3 2 1];
diff(A)  % 求向量A的一阶差分     1     1    -3    -1    -1
diff(A,2)  % 在一阶差分的基础上再差分一次     0    -4     2     0

A=[4 5 6; 
     7 4 2;
     5 6 2]
A1=diff(A)  % 下一行减去上一行求一阶差分
%      3    -1    -4
%     -2     2     0
A2=diff(A,2) % 下一行减去上一行求二阶差分（在一阶差分的基础上再差分一次）
%     -5     3     4
A3=diff(A,2,1) % 最后面的1表示在行上进行差分（在列的方向上进行差分）
%     -5     3     4
A4=diff(A,1,2)  % 后一列减去前一列求一阶差分， 最后面的2表示在列上进行差分（在行的方向上进行差分）
%      1     1
%     -3    -2
%      1    -4
A4=diff(A,2,2) % 后一列减去前一列求二阶差分
%      0
%      1
%     -5


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）