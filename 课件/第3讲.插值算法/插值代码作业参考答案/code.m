%插值预测中间周的水体评价指标
load Z.mat
x=Z(1,:); %Z的第一行是星期Z: 1     3     5     7     9    11    13    15
[n,m]=size(Z);%n为Z的行数，m为Z的列数
% 注意Matlab的数组中不能保存字符串，如果要生成字符串数组，就需要使用元胞数组，其用大括号{}定义和引用
ylab={'周数','轮虫','溶氧','COD','水温','PH值','盐度','透明度','总碱度','氯离子','透明度','生物量'};  % 等会要画的图形的标签
disp(['共有' num2str(n-1) '个指标要进行插值。'])
disp('正在对一号池三次埃尔米特插值，请等待')%一号池共有十一组要插值的数据，算上星期所在的第一行，共十二行
P=zeros(11,15);%对要储存数据的矩阵P赋予初值
for i=2:n%从第二行开始都是要进行插值的指标
    y=Z(i,:);%将每一行依次赋值给y
    new_x=1:15;%要进行插值的x
    p1=pchip(x,y,new_x);%调用三次埃尔米特插值函数
    subplot(4,3,i-1);%将所有图依次变现在4*3的一幅大图上
    plot(x,y,'ro',new_x,p1,'-');%画出每次循环处理后的图像
    axis([0 15,-inf,inf])  %设置坐标轴的范围，这里设置横坐标轴0-15，纵坐标不变化
    %  xlabel('星期')%x轴标题
    ylabel(ylab{i})%y轴标题  这里是直接引用元胞数组中的字符串哦
    P(i-1,:)=p1;%将每次插值之后的结果保存在P矩阵中       
end
legend('原始数据','三次埃尔米特插值数据','Location','SouthEast')%加上标注，注意要手动在图中拖动标注到图片右下角哦
P = [1:15; P]  %把P的第一行加上周数


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）