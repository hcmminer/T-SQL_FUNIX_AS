WITH CTE AS (
  SELECT
    Start_Date,
    End_Date,
    DATEADD (
      DAY,
      - ROW_NUMBER() OVER (
        ORDER BY
          Start_Date
      ),
      Start_Date
    ) grp
  FROM
    Projects
)
SELECT
  MIN(Start_Date),
  MAX(End_Date)
FROM
  CTE
GROUP BY
  grp
ORDER BY
  COUNT(*),
  MIN(Start_Date)