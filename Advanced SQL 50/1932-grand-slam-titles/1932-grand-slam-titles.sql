# Write your MySQL query statement below
with cte as 
(select *
from
(select year, 'Wimbledon ' as tournament, Wimbledon as id
from Championships 
union all

select year, 'Fr_open  ' as tournament, Fr_open  as id
from Championships 
union all

select year, 'US_open  ' as tournament, US_open  as id
from Championships 
union all

select year, 'Au_open   ' as tournament, Au_open   as id
from Championships ) S )

select C.id as player_id, P.player_name, count(C.id) as grand_slams_count 
from Players P inner join cte C
on P.player_id = C.id
group by 1

