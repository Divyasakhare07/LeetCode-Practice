# Write your MySQL query statement below
select C.customer_id, C.name
from Customers C inner join (
select O.customer_id, sum(P.price*O.quantity) as amount
from Product P right join Orders O
on P.product_id =O.product_id
where left(order_date,4) = '2020' and month(order_date) in (6,7)
group by O.customer_id, month(order_date)) S
on C.customer_id =S.customer_id
where S.amount >= 100
group by 1
having count(C.customer_id)>1

