# Write your MySQL query statement below
select W.name as warehouse_name, sum(W.units*P.volume) as volume
from Warehouse W inner join
(select product_id, (Width*Length*Height) as volume
from Products) P
on W.product_id = P.product_id
group by 1
