--  Doctor, Professor, Singer, and Actor
with CTE as (
    select
        row_number() over(
            partition by OCCUPATION
            order by
                name
        ) as row,
        CASE
            when OCCUPATION = 'Doctor' then Name
            else null
        END as Doctor,
        CASE
            when OCCUPATION = 'Professor' then Name
            else null
        END as Professor,
        CASE
            when OCCUPATION = 'Singer' then Name
            else null
        END as Singer,
        CASE
            when OCCUPATION = 'Actor' then Name
            else null
        END as Actor
    from
        OCCUPATIONS
)
select
    max(Doctor),
    max(Professor),
    max(Singer),
    max(Actor)
from
    CTE
group by
    row