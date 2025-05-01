with recursive cte as
(
    select task_id, 1 as subtask_id
    from Tasks
    union all
    select T.task_id, C.subtask_id + 1
    from cte C inner join Tasks T
    on C.task_id = T.task_id
    where C.subtask_id < T.subtasks_count
)

select *
from cte
except
select *
from Executed
