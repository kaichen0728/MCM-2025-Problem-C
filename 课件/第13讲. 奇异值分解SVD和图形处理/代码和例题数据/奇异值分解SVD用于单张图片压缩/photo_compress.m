function []= photo_compress(photo_address, save_address, ratio, greycompress)
    % 函数作用：利用SVD对图形进行压缩
    % 输入变量
    %     photo_address：要压缩的图片存放的位置（建议输入完整的路径）
    %     save_address：将压缩后的图片保存的位置（建议输入完整的路径）
    %     ratio：要保留原矩阵的特征比例（100%表示不压缩）
    %     greycompress: 如果该值等于1，则会彩色的原图片转换为灰色图片后再压缩；默认值为0，表示不进行转换
    % 输出变量
    %     无（不需要输出，因为函数运行过程中已经将图片保存了~）

    if nargin == 3  % 判断用户输入的参数，如果只输入了前三个参数，则默认最后的参数greycompress=0
        greycompress = 0;
    end
    
    img = double(imread(photo_address));
    % 图片保存的对象是 'uint8' 类型，需要将其转换为double类型才能进行奇异值分解的操作
    % 注意:  img是图形的像素矩阵，如果是彩色图片则是三维矩阵，如果是灰色图片(R=G=B)则是二维矩阵
    % '赫本.jpg'是灰色的图片，得到的img类型是[914×1200]double
    % '千与千寻.jpg'是彩色的图片，得到的img类型是[768×1024×3]double
    % 因此我们可利用第三个维度的大小来判断图片是否为灰色的
    % 灰色图片的只有两个维度，所以size(img ,3) == 1
 
    if (greycompress == 1) && (size(img ,3) == 3)  % 如果图片为彩色，且greycompress的值等于1，则会彩色的原图片转换为灰色图片后再压缩
        img = double(rgb2gray(imread(photo_address)));    % rgb2gray函数可以将彩色图片转换为灰色图片, 注意：输入的变量要为默认的'uint8' 类型的图片对象
    end  % 注意： grey(英)和gray(美)都表示灰色

    if size(img ,3) == 3   % 判断图片是否为彩色的
        R=img(:,:,1);       % RGB色彩模式三要素：红色
        G=img(:,:,2);       % RGB色彩模式三要素：绿色
        B=img(:,:,3);       % RGB色彩模式三要素：蓝色
        disp(['正在压缩:  ',photo_address,'的红色要素'])
        r = mysvd(R, ratio);  % 调用自定义函数将R矩阵压缩成r
        disp(['正在压缩:  ',photo_address,'的绿色要素'])
        g = mysvd(G, ratio); % 调用自定义函数将G矩阵压缩成g
        disp(['正在压缩:  ',photo_address,'的蓝色要素'])
        b = mysvd(B, ratio); % 调用自定义函数将B矩阵压缩成b
        compress_img=cat(3,r,g,b);  % 根据三个RGB矩阵（压缩后的r、g、b）生成图片对象
    else  % 如果图片是灰色的要执行的步骤
        disp(['正在压缩灰色图片:  ',photo_address])
        compress_img = mysvd(img, ratio);  %如果是灰色图片的话，直接压缩img矩阵就好了
    end

    % 将压缩后的图片保存
    imwrite(uint8(compress_img), save_address);   % 如果你的矩阵是double格式的，导出时会自动将范围认为是[0 1]，需要重新转换为uint8类型

end


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）