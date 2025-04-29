# Write your MySQL query statement below
with cte as
(select P.project_id, E.employee_id, E.experience_years
from Project P inner join Employee E
on P.employee_id = E.employee_id)

select project_id,employee_id
from cte
where (project_id,experience_years) in 
(select project_id,max(experience_years)
from cte group by project_id )


