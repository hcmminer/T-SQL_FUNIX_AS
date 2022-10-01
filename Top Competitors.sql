SELECT
    s.hacker_id,
    h.name
FROM
    hackers h
    JOIN submissions s ON h.hacker_id = s.hacker_id
    JOIN challenges c ON s.challenge_id = c.challenge_id
    JOIN difficulty d ON c.difficulty_level = d.difficulty_level
WHERE
    d.score = s.score
GROUP BY
    s.hacker_id,
    h.name
HAVING
    COUNT(s.hacker_id) > 1
ORDER BY
    count(s.hacker_id) DESC,
    s.hacker_id