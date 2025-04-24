# Write your MySQL query statement below
select T.team_id as team_id, T.team_name, coalesce(sum(M1.score),0) as num_points
from(
select host_team, case
when (host_goals > guest_goals) then 3 
when (host_goals < guest_goals) then 0 
else 1 End as score 
from
(select host_team, guest_team, host_goals, guest_goals
from Matches
union all
select guest_team, host_team, guest_goals, host_goals
from Matches) M) M1 right join Teams T
on M1.host_team = T.team_id
group by 1
order by 3 desc, 1 asc