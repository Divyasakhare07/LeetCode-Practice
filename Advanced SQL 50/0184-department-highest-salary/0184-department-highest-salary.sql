# Write your MySQL query statement below
select D.name as Department , E.name as Employee , E.salary as Salary 
from Employee E inner join Department D
on E.departmentId = D.id 
where (E.departmentId,E.salary) in (select departmentId, max(salary) as salary
from Employee
group by departmentId)