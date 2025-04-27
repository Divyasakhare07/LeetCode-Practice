with cte as
(select customer_id, product_id, count(order_id) as cout
from Orders
group by 1,2)




select C.customer_id, C.product_id, P.product_name
from (select customer_id, product_id, cout, rank() over(partition by customer_id order by cout desc) as rrank
from cte) C inner join Products P
on C.product_id = P.product_id
where C.rrank = 1


