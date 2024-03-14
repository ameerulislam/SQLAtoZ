select N,
CASE
    when P is null then "Root"
    when N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN "Leaf"
    else "Inner"
END
    as node_type
from BST
order by N

-- chatgpt solution
-- with cte we can avoid recalculating distinct values 

WITH DistinctNonNullP AS (
  SELECT DISTINCT P
  FROM BST
  WHERE P IS NOT NULL
)

SELECT N,
  CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N NOT IN (SELECT P FROM DistinctNonNullP) THEN 'Leaf'
    ELSE 'Inner'
  END AS node_type
FROM BST
ORDER BY N;
