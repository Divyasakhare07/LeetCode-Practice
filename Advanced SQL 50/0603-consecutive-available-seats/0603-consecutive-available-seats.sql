# Write your MySQL query statement below
select distinct(seat_id)
from
(select C2.seat_id
from Cinema C1 cross join Cinema C2
on C1.seat_id = C2.seat_id +1 
where C1.free =1 and C2.free = 1
union all
select C1.seat_id
from Cinema C1 cross join Cinema C2
on C1.seat_id = C2.seat_id +1 
where C1.free =1 and C2.free = 1) S
order by 1