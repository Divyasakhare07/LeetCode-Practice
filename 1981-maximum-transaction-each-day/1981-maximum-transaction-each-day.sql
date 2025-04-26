# Write your MySQL query statement below
select transaction_id 
from Transactions
where (day, amount) in (
select day, max(amount) over (partition by day order by day) as maxamount
from Transactions)
order by 1