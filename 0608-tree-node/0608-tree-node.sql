with new_tree as
(select id, coalesce(p_id,0) as p_id
from tree)


select id, case
when p_id = 0 then 'Root' 
when id not in (select distinct(p_id) from new_tree) then 'Leaf'
else 'Inner'
end as type
from new_tree