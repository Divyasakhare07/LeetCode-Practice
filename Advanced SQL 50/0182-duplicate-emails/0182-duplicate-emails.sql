select email
from
(select email, count(id) as cout
from Person
group by email
having cout > 1) S