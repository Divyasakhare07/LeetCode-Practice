
select student_id, min(course_id) as  course_id, grade
from(
select student_id, course_id, grade, rank() over (partition by student_id order by grade desc) as rrank
from Enrollments) E
where rrank =1
group by student_id

