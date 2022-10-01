-- c1
SELECT
    W.ID,
    P.Age,
    W.Coins_Needed,
    W.Power
FROM
    Wands W
    INNER JOIN Wands_Property P ON W.Code = P.Code
    INNER JOIN (
        SELECT
            Code,
            Power,
            MIN(Coins_Needed) as Min_Coins
        FROM
            Wands
        Group By
            Code,
            POWER
    ) WW ON W.Code = WW.Code
    AND W.Power = WW.Power
WHERE
    W.Coins_Needed = WW.Min_Coins
    AND P.Is_Evil = 0
ORDER BY
    W.Power DESC,
    P.Age DESC;

-- c2
select
    id,
    age,
    coins_needed,
    power
from
    Wands w,
    Wands_Property w2
where
    w.code = w2.code
    and is_evil = 0
    and w.coins_needed = (
        select
            min(w3.coins_needed)
        from
            wands w3
        where
            w.code = w3.code
            and w.power = w3.power
    )
order by
    power desc,
    age desc