select
    ceiling(
        avg(salary) - avg(
            cast(replace(salary, '0', '') as int)
        ) + 1
    )
from
    EMPLOYEES