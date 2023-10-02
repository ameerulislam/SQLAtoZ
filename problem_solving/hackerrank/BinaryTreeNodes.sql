select N,
CASE
    when P is null then "Root"
    when N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN "Leaf"
    else "Inner"
END
    as node_type
from BST
order by N
