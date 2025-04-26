# Write your MySQL query statement below
select *
from ((select employee_id
from Employees 


union

select employee_id
from Salaries)

except

(select E.employee_id 
from Employees E inner join Salaries S
on E.employee_id=S.employee_id)) M
order by 1