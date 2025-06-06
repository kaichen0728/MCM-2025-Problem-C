%% 求硬币兑换的方案数
coins = [2 3 5 6];
S = 10 ;
f = coin_change_numbers(coins, S)
% f = 5

coins = [1 2 3];
S = 4 ;
f = coin_change_numbers(coins, S)
% f = 4

%%  国赛1992年真题
coins = [57,71,87,97,99,101,103,113,114,115,128,129,131,137,147,156,163,186]
[f, FF] = coin_change_numbers(coins, 1000);
ff = FF(end,:);  % 取出DP数组(FF)的最后一行（即分子量从X为1至1000时的方案数）
ff(100:100:1000)  % 每隔100输出一次值
plot(ff,'LineWidth',2)   % 线的宽度取2，好看一点
xlabel('分子量'); ylabel('方案数');   % x y轴的坐标轴标签
