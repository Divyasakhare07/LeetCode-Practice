# Write your MySQL query statement below
select name
from SalesPerson
where sales_id not in
(select O.sales_id    
from Orders O inner join Company C
on O.com_id = C.com_id 
where C.name = 'RED')