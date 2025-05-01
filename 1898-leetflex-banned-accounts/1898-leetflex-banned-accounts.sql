select distinct L1.account_id
from LogInfo L1, LogInfo L2
where ((L1.login between L2.login and L2.logout) 
or (L1.logout between L2.login and L2.logout))
and (L1.account_id = L2.account_id) 
and (L1.ip_address != L2.ip_address)