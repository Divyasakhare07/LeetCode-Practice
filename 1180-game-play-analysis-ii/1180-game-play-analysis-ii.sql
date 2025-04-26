select A.player_id, A.device_id
from 
Activity A inner join (select player_id, min(event_date) as event_date
from Activity
group by player_id) S
on S.player_id = A.player_id 
and S.event_date = A.event_date