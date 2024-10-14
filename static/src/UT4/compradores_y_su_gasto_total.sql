SELECT p.name, SUM(po.amount_total)
FROM res_partner p
JOIN pos_order po ON p.id = po.partner_id
GROUP BY p.name;
