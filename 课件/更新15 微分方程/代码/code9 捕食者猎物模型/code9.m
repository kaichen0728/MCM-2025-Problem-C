clear;clc
%  Matlab求不出来解析解
% dsolve('Dx1=x1*(0.9-0.1*x2)','Dx2=x2*(-0.6+0.02*x1)','x1(0)=25,x2(0)=2','t')

% 下面用ode45函数求数值解
% 自变量t的范围为0-15年，食饵和捕食者（鲨鱼）初始值分别为25和2 
% 注意：战前和战后是战争开始前和战争开始后的简写哦
[t1,x1]=ode45('pre_war',[0 15],[25 2]);  % 战前的微分方程       
[t2,x2]=ode45('past_war',[0 15],[25 2]);     % 战后的微分方程
% [t1,x1]=ode45('pre_war',[0:15],[25 2]);  % 战前的微分方程       
% [t2,x2]=ode45('past_war',[0:15],[25 2]);     % 战后的微分方程

pre_prey=x1(:,1); pre_shark=x1(:,2);   % 战前的食饵和鲨鱼的数量
past_prey=x2(:,1); past_shark=x2(:,2);  % 战后的食饵和鲨鱼的数量

figure(1)
plot(pre_prey,pre_shark,'--r',past_prey,past_shark,'-b')
legend('战前','战后')
title('鲨鱼和食饵数量变化的相轨线图')
xlabel('食饵数量');   ylabel('鲨鱼数量')

figure(2)
plot(t1,pre_prey,'--r',t1,pre_shark,'-r',t2,past_prey,'--b',t2,past_shark,'-b')
legend('战前食饵数量','战前鲨鱼数量','战后食饵数量','战后鲨鱼数量')
xlabel('时间');   ylabel('数量')

% 鲨鱼比例  =  鲨鱼数量 /（鲨鱼数+食饵数）
pre_rate=pre_shark./(pre_prey+pre_shark);  % 战前的鲨鱼比例    
past_rate=past_shark./(past_prey+past_shark);   % 战后的鲨鱼比例
figure(3)
plot(t1,pre_rate,'--r',t2,past_rate,'-b')
legend('战前的鲨鱼比例','战后的鲨鱼比例')


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文 
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）
