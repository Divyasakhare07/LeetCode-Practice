# Write your MySQL query statement below
with cte as
(select C.name, C.customer_id, O.order_id, O.order_date, O.trank
from Customers C inner join
(select order_id, order_date, customer_id, rank() over (partition by customer_id order by order_date desc) as trank
from Orders) O
on C.customer_id = O.customer_id 
order by 1, 2, 4 desc)

select name as customer_name , customer_id, order_id, order_date
from cte
where trank < 4