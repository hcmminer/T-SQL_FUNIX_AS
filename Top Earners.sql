select
    TOP 1 CONCAT(T.earnings, '  ', COUNT(*))
from
    (
        select
            E.salary * E.months as earnings
        from
            Employee as E
    ) as T
group by
    T.earnings
order by
    T.earnings desc