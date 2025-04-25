# Write your MySQL query statement below
select round(count(delivery_id)*100/(select count(delivery_id) from Delivery),2) as immediate_percentage
from Delivery
where order_date = customer_pref_delivery_date