SELECT full_product_name, SUM(qty) AS qty
FROM pos_order_line_pol
GROUP BY full_product_name
ORDER BY qty DESC
