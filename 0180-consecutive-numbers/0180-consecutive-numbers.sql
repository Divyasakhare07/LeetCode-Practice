# Write your MySQL query statement below

select distinct(L.num) as ConsecutiveNums 
from Logs L,Logs L1,Logs L2
where L.num = L1.num and L1.num = L2.num and L.id +1 = L1.id and L1.id +1 = L2.id