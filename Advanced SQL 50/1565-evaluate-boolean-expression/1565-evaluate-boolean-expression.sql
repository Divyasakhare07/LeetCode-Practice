
select E.left_operand, E.operator, E.right_operand, 
case when(E.operator = '<' and V1.value < V2.value) then 'true'
when(E.operator = '>' and V1.value > V2.value ) then 'true'
when (E.operator = '=' and V1.value = V2.value)  then 'true'
else 'false'
end as value
from Variables V1 right join Expressions E 
on V1.name = E.left_operand
left join Variables V2
on V2.name = E.right_operand