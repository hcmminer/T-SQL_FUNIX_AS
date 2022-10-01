SELECT
  sm.hacker_id,
  name,
  SUM(m_score) AS t_score
FROM
  (
    SELECT
      hacker_id,
      MAX(score) AS m_score
    FROM
      Submissions
    GROUP BY
      hacker_id,
      challenge_id
  ) sm
  JOIN Hackers h ON sm.hacker_id = h.hacker_id
GROUP BY
  sm.hacker_id,
  name
HAVING
  SUM(m_score) > 0
ORDER BY
  SUM(m_score) DESC,
  sm.hacker_id