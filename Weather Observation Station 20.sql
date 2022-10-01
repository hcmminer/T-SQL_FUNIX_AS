WITH CTE AS (
    SELECT
        *,
        ROW_NUMBER() OVER(
            ORDER BY
                LAT_N ASC
        ) rn,
        ROW_NUMBER() OVER(
            ORDER BY
                LAT_N DESC
        ) dn
    FROM
        STATION
)
SELECT
    CAST(AVG(LAT_N) AS DECIMAL (20, 4))
FROM
    CTE
WHERE
    ABS(rn - dn) <= 1