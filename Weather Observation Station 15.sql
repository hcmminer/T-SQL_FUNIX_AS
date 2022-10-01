-- Select
--     cast((LONG_W) as Decimal(10, 4))
-- from
--     STATION
-- where
--     LAT_N =(
--         select
--             MAX(LAT_N)
--         from
--             STATION
--         where
--             LAT_N < 137.2345
--     );
select
    top 1 cast(long_w as decimal(10, 4))
from
    station
where
    lat_n < 137.2345
order by
    lat_n desc