
select *
from
(select name as results from Users inner join MovieRating
on Users.user_id = Movierating.user_id 
group by Movierating.user_id
order by count(Movierating.user_id) desc, Users.name asc
limit 1) as der_user 
union all
(select title as results from Movies inner join MovieRating
on Movies.movie_id = Movierating.movie_id
WHERE extract(YEAR_MONTH FROM Movierating.created_at) = 202002
group by Movierating.movie_id 
ORDER BY avg(rating) DESC, Movies.title Asc
LIMIT 1)


