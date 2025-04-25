with cte as(
select * from Calls
union all
select callee_id, caller_id, duration 
from Calls
)

select Co.name as Country
from Country Co right join
(
select left(P.phone_number, 3) as code, avg(S.duration) as adur
from cte S left join Person P
on S.caller_id = P.id
group by code
having adur > (select avg(duration) from Calls)) S1
on Co.country_code = S1.code
