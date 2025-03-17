/*SELECT name
FROM Customer
WHERE id NOT IN(
    SELECT id 
    FROM Customer
    where referee_id = 2
)
*/

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;