% 题目来源：剑指 Offer 47: 礼物的最大价值
M = [5 1 5 1;
         3 5 3 5;
         4 2 1 1;
         1 5 1 3;
         1 5 3 4];
     
% 只计算结果，不输出路径
f = max_gift_value1(M)
% f =32

% 输出所走的路线
[f,path] = max_gift_value2(M)
% f =32
% path =
%      1     0     0     0
%      1     1     0     0
%      0     1     0     0
%      0     1     0     0
%      0     1     1     1