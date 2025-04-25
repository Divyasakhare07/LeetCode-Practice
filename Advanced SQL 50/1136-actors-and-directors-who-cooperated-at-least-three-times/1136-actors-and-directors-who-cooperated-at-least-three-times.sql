# Write your MySQL query statement below
select actor_id, director_id
from
(select actor_id, director_id, count(timestamp) as cout
from ActorDirector
group by actor_id, director_id
having cout >2) S
