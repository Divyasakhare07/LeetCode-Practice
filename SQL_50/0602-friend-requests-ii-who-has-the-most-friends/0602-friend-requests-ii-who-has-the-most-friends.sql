# Write your MySQL query statement below
select requester_id  as id, count(distinct(accepter_id)) as num 
from(
select requester_id  ,accepter_id    
from RequestAccepted
union 
select accepter_id,  requester_id 
from RequestAccepted) R
group by 1
order by num desc
limit 1
