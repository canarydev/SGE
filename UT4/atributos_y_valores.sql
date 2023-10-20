WITH pav AS (
	SELECT id, attribute_id,
	   name::json->>'es_ES' AS name
	FROM product_attribute_value
),

pa AS (
	SELECT id,
	   name::json->>'es_ES' AS name
	FROM product_attribute)
	
SELECT pav.id, CONCAT(pa.name , ': ' , pav.name)
FROM pav
JOIN pa ON pa.id = pav.attribute_id
