-- select cast(avg(population) as int) from CITY;
select
    floor(avg(population))
from
    CITY;