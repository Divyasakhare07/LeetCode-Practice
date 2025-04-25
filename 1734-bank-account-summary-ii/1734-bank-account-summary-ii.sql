select U.name as Name, S.totamount as Balance
from Users U inner join
(select sum(amount) totamount, account
from Transactions
group by account
having totamount > 10000) S
on U. account = S.account