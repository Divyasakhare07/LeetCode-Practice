# Write your MySQL query statement below
select distinct(O.customer_id) as customer_id , C. customer_name 
from Orders O join Customers C
on O.customer_id = C.customer_id 
where O.customer_id in (select Customer_id from Orders where product_name = 'A') 
and O.customer_id in (select Customer_id from Orders where product_name = 'B')
and O.customer_id  not in (select Customer_id from Orders where product_name = 'C')

