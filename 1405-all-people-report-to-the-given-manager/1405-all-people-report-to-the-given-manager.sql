with cte1 as
(select distinct employee_id
from Employees
where manager_id =1 ),

cte2 as
(select distinct employee_id
from Employees
where manager_id in (select employee_id from cte1))

select distinct employee_id
from Employees
where manager_id in (select employee_id from cte2) and employee_id != 1