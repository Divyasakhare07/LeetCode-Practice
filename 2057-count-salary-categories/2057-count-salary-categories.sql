# Write your MySQL query statement below
/*select category, count(category) as accounts_count
from(
select account_id,
case 
when income < 20000 then "Low Salary"
when income >= 20000 and income < 50000 then "Average Salary"
when income > 50000 then "High Salary"
End as category
from Accounts) A
group by category*/

select "High Salary" as category, count(account_id) as accounts_count
from Accounts
where income > 50000

union all

select "Low Salary" as category, count(account_id) as accounts_count
from Accounts
where income < 20000

union all

select "Average Salary" as category, count(account_id) as accounts_count
from Accounts
where income between  20000 and  50000




