# Write your MySQL query statement below

/*select distinct(L.num) as ConsecutiveNums 
from Logs L,Logs L1,Logs L2
where L.num = L1.num and L1.num = L2.num and L.id +1 = L1.id and L1.id +1 = L2.id*/

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1 AND l1.num = l2.num
JOIN Logs l3 ON l1.id = l3.id - 2 AND l1.num = l3.num;