# Write your MySQL query statement below
with cte as
(select exam_id, max(score) as highest, min(score) as lowest
from Exam
group by exam_id)

select distinct E1.student_id, S.student_name
from Exam E1 left join Student S
on E1.student_id = S.student_id
where E1.student_id not in(
select student_id
from Exam E inner join cte C
on E.exam_id = C.exam_id
where E.score = C.lowest or E.score = C.highest)
order by 1