select C.from_id as person1, C.to_id as person2, 
count(C.duration) as call_count, sum(C.duration) as total_duration
from
(
(select *
from Calls) 
union all
(select to_id, from_id, duration
from calls)
) C
where C.from_id<C.to_id
group by C.from_id, C.to_id 