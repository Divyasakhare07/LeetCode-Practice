


select Max(salary) as SecondHighestSalary
from  Employee
where salary <
(select Max(salary) as salary from Employee)



