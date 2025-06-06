%% 注意：在论文写作中，应该先对判断矩阵进行一致性检验，然后再计算权重，因为只有判断矩阵通过了一致性检验，其权重才是有意义的。
%% 在下面的代码中，我们先计算了权重，然后再进行了一致性检验，这是为了顺应计算过程，事实上在逻辑上是说不过去的。
%% 因此大家自己写论文中如果用到了层次分析法，一定要先对判断矩阵进行一致性检验。
%% 而且要说明的是，只有非一致矩阵的判断矩阵才需要进行一致性检验。
%% 如果你的判断矩阵本身就是一个一致矩阵(各行各列成比例)，那么就没有必要进行一致性检验。

disp('请输入判断矩阵A')     
A=input('A=');     
ERROR = 0;  
[r,c]=size(A);
if r ~= c  || r <= 1
    ERROR = 1;
end
if ERROR == 0
    [n,n] = size(A);
    if sum(sum(A <= 0)) > 0
        ERROR = 2;
    end
end
if ERROR == 0
    if n > 15
        ERROR = 3;
    end
end
if ERROR == 0
    if sum(sum(A' .* A ~=  ones(n))) > 0
        ERROR = 4;
    end
end

if ERROR == 0
    % % % % % % % % % % % % %方法1： 算术平均法求权重% % % % % % % % % % % % %
    Sum_A = sum(A);
    SUM_A = repmat(Sum_A,n,1);
    Stand_A = A ./ SUM_A;
    disp('算术平均法求权重的结果为：');
    disp(sum(Stand_A,2)./n)
    % % % % % % % % % % % % %方法2： 几何平均法求权重% % % % % % % % % % % % %
    Prduct_A = prod(A,2);
    Prduct_n_A = Prduct_A .^ (1/n);
    disp('几何平均法求权重的结果为：');
    disp(Prduct_n_A ./ sum(Prduct_n_A))
    % % % % % % % % % % % % %方法3： 特征值法求权重% % % % % % % % % % % % %
    [V,D] = eig(A);
    Max_eig = max(max(D));
    [r,c]=find(D == Max_eig , 1);
    disp('特征值法求权重的结果为：');
    disp( V(:,c) ./ sum(V(:,c)) )
    % % % % % % % % % % % % %下面是计算一致性比例CR的环节% % % % % % % % % % % % %
    CI = (Max_eig - n) / (n-1);
    RI=[0 0.00001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];  %注意哦，这里的RI最多支持 n = 15
    % 这里n=2时，一定是一致矩阵，所以CI = 0，我们为了避免分母为0，将这里的第二个元素改为了很接近0的正数
    CR=CI/RI(n);
    disp('一致性指标CI=');disp(CI);
    disp('一致性比例CR=');disp(CR);
    if CR<0.10
        disp('因为CR<0.10，所以该判断矩阵A的一致性可以接受!');
    else
        disp('注意：CR >= 0.10，因此该判断矩阵A需要进行修改!');
    end
elseif ERROR == 1
    disp('请检查矩阵A的维数是否不大于1或不是方阵')
elseif ERROR == 2
    disp('请检查矩阵A中有元素小于等于0')
elseif ERROR == 3
    disp('A的维数n超过了15，请减少准则层的数量')
elseif ERROR == 4
    disp('请检查矩阵A中存在i、j不满足A_ij * A_ji = 1')
end

% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）