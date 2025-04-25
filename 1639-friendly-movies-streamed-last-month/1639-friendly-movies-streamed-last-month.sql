# Write your MySQL query statement below
select distinct(C.title) as title
from TVProgram T inner join Content C
on T.content_id    = C.content_id    
where C.Kids_content = 'Y' and year(T.program_date) = 2020 and month(T.program_date) = 6 and C.content_type = 'Movies'