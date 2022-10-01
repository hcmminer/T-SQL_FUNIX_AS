-- select
--     s.name
-- from
--     students s
--     join friends f on s.ID = f.ID
--     join packages p on s.ID = p.ID
--     join (
--         select
--             f.Friend_ID,
--             p.salary
--         from
--             friends f
--             join packages p on f.friend_ID = p.ID
--     ) t on f.friend_ID = t.friend_ID
-- where
--     p.salary < t.salary
-- order by
--     t.salary;

select
    s.name
from
    students s,
    packages p,
    friends f,
    packages p2
where
    s.id = f.id
    and s.id = p.id
    and p2.id = f.friend_id
    and p.salary < p2.salary
order by
    p2.salary