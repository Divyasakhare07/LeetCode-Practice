# Write your MySQL query statement below
select person_name
from(
select person_id, person_name, weight, turn, sum(weight) over (order by turn) as tot_weight
from Queue) as M
where tot_weight <= 1000
order by tot_weight desc
limit 1




