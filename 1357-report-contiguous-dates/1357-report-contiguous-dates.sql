with cte as
(select fail_date as date, 'failed' as period_state
from Failed
where fail_date between '2019-01-01' and '2019-12-31'
union all
select success_date as date, 'succeeded' as period_state
from succeeded
where success_date between '2019-01-01' and '2019-12-31'),

scte1 as
((select period_state,date as 'start_date'
from cte
order by date
limit 1)
union
(select C2.period_state,C2.date 
from cte C1, cte C2
where datediff(C2.date,C1.date) = 1 and C1.period_state != C2.period_state)),

scte2 as
((select C1.period_state,C1.date as 'end_date'
from cte C1, cte C2
where datediff(C2.date,C1.date) = 1 and C1.period_state != C2.period_state)
union
(select period_state,date
from cte
order by date desc
limit 1)
)

select A.period_state, A.start_date, B.end_date
from
(select period_state, start_date, row_number() over (order by start_date) as rrank
from scte1) A inner join
(select period_state, end_date, row_number() over (order by end_date) as rrank
from scte2) B
on A.rrank = B.rrank
