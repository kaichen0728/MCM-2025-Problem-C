% 分段三次埃尔米特插值
x = -pi:pi; y = sin(x); 
new_x = -pi:0.1:pi;
p = pchip(x,y,new_x);
figure(1); % 在同一个脚本文件里面，要想画多个图，需要给每个图编号，否则只会显示最后一个图哦~
plot(x, y, 'o', new_x, p, 'r-')

% plot函数用法:
% plot(x1,y1,x2,y2) 
% 线方式： - 实线 :点线 -. 虚点线 - - 波折线 
% 点方式： . 圆点  +加号  * 星号  x x形  o 小圆
% 颜色： y黄； r红； g绿； b蓝； w白； k黑； m紫； c青


% 三次样条插值和分段三次埃尔米特插值的对比
x = -pi:pi; 
y = sin(x); 
new_x = -pi:0.1:pi;
p1 = pchip(x,y,new_x);   %分段三次埃尔米特插值
p2 = spline(x,y,new_x);  %三次样条插值
figure(2);
plot(x,y,'o',new_x,p1,'r-',new_x,p2,'b-')
legend('样本点','三次埃尔米特插值','三次样条插值','Location','SouthEast')   %标注显示在东南方向
% 说明：
% LEGEND(string1,string2,string3, …)
% 分别将字符串1、字符串2、字符串3……标注到图中，每个字符串对应的图标为画图时的图标。
% ‘Location’用来指定标注显示的位置


% n维数据的插值
x = -pi:pi; y = sin(x); 
new_x = -pi:0.1:pi;
p = interpn (x, y, new_x, 'spline');
% 等价于 p = spline(x, y, new_x);
figure(3);
plot(x, y, 'o', new_x, p, 'r-')

% 人口预测（注意：一般我们很少使用插值算法来预测数据，随着课程的深入，后面的章节会有更适合预测的算法供大家选择，例如灰色预测、拟合预测等）
population=[133126,133770,134413,135069,135738,136427,137122,137866,138639, 139538];
year = 2009:2018;
p1 = pchip(year, population, 2019:2021)  %分段三次埃尔米特插值预测
p2 = spline(year, population, 2019:2021) %三次样条插值预测
figure(4);
plot(year, population,'o',2019:2021,p1,'r*-',2019:2021,p2,'bx-')
legend('样本点','三次埃尔米特插值预测','三次样条插值预测','Location','SouthEast')

% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）