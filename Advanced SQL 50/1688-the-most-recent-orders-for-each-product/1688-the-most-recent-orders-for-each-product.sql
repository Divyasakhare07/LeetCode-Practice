# Write your MySQL query statement below
select P.product_name, P.product_id, O.order_id, O.order_date 
from Orders O inner join Products P
on O.product_id = P.product_id
where (O.order_date,O.product_id) in
(
select max(order_date) as order_date, product_id
from Orders
group by product_id)
order by 1, 2, 3