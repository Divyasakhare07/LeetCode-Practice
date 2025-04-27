with cte as
(select player_id, min(event_date) as fdate
from activity
group by player_id)

select round(count(distinct(c.player_id))/(select count(distinct(player_id)) from Activity), 2) as fraction  
from cte c inner join Activity a
on c.player_id = a.player_id
where datediff(a.event_date,c.fdate) = 1 