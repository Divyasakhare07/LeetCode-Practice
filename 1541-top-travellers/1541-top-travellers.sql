# Write your MySQL query statement below
select U.name, coalesce(sum(R.distance), 0) as travelled_distance
from Users U left join Rides R
on U.id = R.user_id
group by R.user_id
order by 2 desc, 1 asc