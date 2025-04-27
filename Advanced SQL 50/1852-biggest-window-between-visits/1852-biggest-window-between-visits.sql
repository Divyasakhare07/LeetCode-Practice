with cte as
(select user_id, visit_date, rank() over(partition by user_id order by visit_date ) as rrank
from(select *
from UserVisits
 union all
select distinct(user_id), '2021-1-1' as visit_date from UserVisits) S )

select user_id, max(windowt) as biggest_window
from
(select  C1.user_id, datediff(C1.visit_date, C2.visit_date ) as windowt
from cte C1, cte C2
where C1.rrank = C2.rrank + 1 and C1.user_id = C2.user_id) S1
group by user_id
