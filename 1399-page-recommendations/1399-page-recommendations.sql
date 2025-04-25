# Write your MySQL query statement below
select distinct(page_id) recommended_page
from Likes
where user_id in (
select distinct(user2_id)
from(select *
from Friendship
union all
select user2_id, user1_id
from Friendship) P
where user1_id =1)
except
select page_id from Likes
where user_id =1