# Write your MySQL query statement below

# using max function
/*select transaction_id 
from Transactions
where (day, amount) in (
select day, max(amount) over (partition by day order by day) as maxamount
from Transactions)
order by 1*/

with cte as
(select day, amount, rank() over (partition by day order by amount desc) as rrank
from Transactions)

select transaction_id 
from Transactions
where (day, amount) in( select day, amount from cte where rrank = 1)

order by 1