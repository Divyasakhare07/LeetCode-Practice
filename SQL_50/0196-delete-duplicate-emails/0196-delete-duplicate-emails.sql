/* Write your T-SQL query statement below */
with tempP as(
    select min(id) as mid
    from Person
    group by email
)
delete from Person
where id not in (select mid from tempP)