SELECT 
    p.product_id,
    CASE 
        WHEN lp.new_price IS NOT NULL THEN lp.new_price
        ELSE 10
    END AS price
FROM 
    (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN 
    (SELECT 
         product_id,
         new_price,
         change_date
     FROM 
         Products
     WHERE 
         change_date <= '2019-08-16') lp
ON 
    p.product_id = lp.product_id
    AND lp.change_date = (
        SELECT 
            MAX(change_date)
        FROM 
            Products
        WHERE 
            product_id = lp.product_id
            AND change_date <= '2019-08-16'
    );