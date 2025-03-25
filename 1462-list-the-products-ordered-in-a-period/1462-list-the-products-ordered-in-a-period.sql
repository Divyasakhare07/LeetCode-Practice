# Write your MySQL query statement below
select product_name, unit
from Products P inner join (select product_id, sum(unit) as unit
from Orders 
where (order_date between '2020-02-01' and '2020-02-29') 
group by product_id
having unit >= 100) as O
on P.product_id = O.product_id 