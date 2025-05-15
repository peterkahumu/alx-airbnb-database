-- Properties where average rating is >= 4.0
SELECT 
	p.name AS "Property Name",
	ROUND(AVG(r.rating), 2) as "Average Rating"
FROM property p
INNER JOIN review r on r.property_id = p.property_id
WHERE (SELECT AVG(r.rating) AS "Average Rating" FROM review r WHERE r.property_id = p.property_id) >=4
GROUP BY p.name
ORDER BY "Average Rating" DESC;

-- Users with more than 3 bookings
SELECT 
	u.first_name,
	COUNT(*)
FROM booking b
INNER JOIN users u ON u.user_id = b.user_id
WHERE (
	SELECT  COUNT(*) FROM  booking b
	WHERE b.user_id = u.user_id
) >= 4
GROUP BY u.first_name
ORDER BY count DESC;
