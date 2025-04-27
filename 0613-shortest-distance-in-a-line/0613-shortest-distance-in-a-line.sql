# Write your MySQL query statement below
with cte as
(select abs(p1.x-p2.x) as dist
from Point p1, point p2
where p1.x != p2.x)

select min(dist) as shortest 
from cte