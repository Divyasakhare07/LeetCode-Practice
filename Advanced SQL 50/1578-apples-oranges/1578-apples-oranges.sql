# Write your MySQL query statement below
select A.sale_date, (A.sold_num - O.sold_num) as diff
from
(select sale_date, fruit, sold_num
from Sales
where fruit = 'apples') A inner join (select sale_date, fruit, sold_num
from Sales
where fruit = 'oranges') O
on A.sale_date = O.sale_date


