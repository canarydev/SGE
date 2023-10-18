WITH totales as (
	SELECT po.partner_id, SUM(amount_total) as total
	FROM POS_order AS po
	WHERE po.partner_id IS NOT NULL
	GROUP BY po.partner_id
	ORDER BY total DESC)

SELECT name, total
FROM res_partner
JOIN totales ON totales.partner_id = res_partner.id;
