# Write your MySQL query statement below
select seller_name
from Seller
where seller_id not in
(select seller_id
from Orders
where sale_date like '2020%')
order by seller_name 