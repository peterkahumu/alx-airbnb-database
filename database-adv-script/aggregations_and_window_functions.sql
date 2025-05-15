--- Total Number of booking made by each user
SELECT 
	CONCAT(u.first_name, ' ', u.last_name) AS "NAME",
	COUNT(*) AS "NUMBER OF BOOKINGS"
FROM booking b
INNER JOIN users u ON u.user_id = b.user_id
GROUP BY "NAME"
ORDER BY "NUMBER OF BOOKINGS" DESC;

-- Rank Properties based on the number of bookings they've recieved.

SELECT 
	RANK() OVER(ORDER BY COUNT(*) DESC) AS "RANK",
	p.name AS "PROPERTY NAME",
	COUNT(*)
FROM booking b
INNER JOIN property p ON p.property_id = b.property_id
GROUP BY "PROPERTY NAME"
ORDER BY count DESC;