# Write your MySQL query statement below
select d.name as Department , e.name  as employee, e.salary as Salary 
from Department d inner join  (select id, name, salary,departmentId, 
DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS drank
from Employee
) e
on d.Id = e.departmentId 
where e.drank < 4

