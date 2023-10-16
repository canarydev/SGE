SELECT pt.name
FROM pos_order_line pol
JOIN product_product pp ON pol.product_id = pp.id
JOIN product_template pt ON pp.product_tmpl_id = pt.id
WHERE pol.order_id =6;
