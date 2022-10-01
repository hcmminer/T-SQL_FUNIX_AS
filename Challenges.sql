with tmp (hacker_id, name, cnt) as (
  select
    h.hacker_id,
    h.name,
    count(challenge_id)
  from
    hackers h
    join challenges c on h.hacker_id = c.hacker_id
  group by
    h.hacker_id,
    h.name
)
select
  hacker_id,
  name,
  cnt
from
  tmp
where
  cnt in (
    select
      cnt
    from
      tmp
    group by
      cnt
    having
      count(hacker_id) = 1
  )
  or cnt = (
    select
      max(cnt)
    from
      tmp
  )
order by
  cnt desc,
  hacker_id asc