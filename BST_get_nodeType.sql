/*

You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

*/

select N, node_type from 
(select N, 'Root' as node_type
FROM BST where P IS NULL
union ALL
SELECT N, 'Inner'  as node_type
FROM BST WHERE
N IN (SELECT b2.P FROM BST b2) AND P IS NOT NULL)
UNION ALL
SELECT N, 'Leaf'  as node_type
FROM BST WHERE N NOT IN (SELECT distinct b2.P FROM BST b2 WHERE b2.P IS NOT NULL)
ORDER BY N;

