select
    concat(name, "(", LEFT(occupation, 1), ")")
from
    occupations
order by
    name asc;

select
    concat(
        "There are a total of ",
        count(name),
        ' ',
        lower(occupation),
        's.'
    )
from
    occupations
group by
    occupation
order by
    count(occupation) asc,
    occupation asc;