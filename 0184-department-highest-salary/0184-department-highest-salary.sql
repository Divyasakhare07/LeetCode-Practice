
select D.name as  Department, E.name as Employee , E.salary as Salary
from Department D inner join (
select id, name,salary, departmentId, rank() over (partition by departmentId order by salary desc) as rrank
from Employee
) E
on E.departmentId = D.id
where E.rrank =1

