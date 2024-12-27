# Write your MySQL query statement below
select row_number() over (order by id asc) as id, student
from(select if(id%2=0, id-1, id+1) as id, student
from Seat
order by id) s
