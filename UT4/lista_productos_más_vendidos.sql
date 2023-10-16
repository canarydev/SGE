SELECT pol.product_id, sum(pol.qty) as qty
FROM pos_order_line pol
GROUP BY pol.product_id
ORDER BY qty DESC;
