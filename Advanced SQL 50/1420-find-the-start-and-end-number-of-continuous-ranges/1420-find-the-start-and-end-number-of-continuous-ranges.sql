# Write your MySQL query statement below
select S.start_id, min(E.end_id) as end_id 
from(
select case 
when (log_id -1) not in (select log_id from Logs) then log_id 
end as start_id
from Logs) S , 

(select case 
when (log_id + 1) not in (select log_id from Logs) then log_id 
end as end_id
from Logs) E

where S.start_id <= E.end_id
group by S.start_id