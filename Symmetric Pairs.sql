with
  cte as (
    select
      x,
      y,
      CASE
        WHEN x <= y THEN concat (cast(x as char(5)), cast(y as char(5)))
        ELSE concat (cast(y as char(5)), cast(x as char(5)))
      END AS z
    from
      functions
  )
select
  min(x),
  max(y)
from
  cte
group by
  z
having
  count(z) >= 2
order by
  min(x)