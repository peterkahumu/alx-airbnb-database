SELECT 
	RANK() OVER (ORDER BY COUNT(*) DESC) AS "Rank",
	CONCAT(u.first_name, ' ', u.last_name) AS "Name",
	COUNT(*) AS "Total Bookings"
FROM booking b
INNER JOIN users u ON b.user_id = u.user_id
GROUP BY "Name"
ORDER BY "Total Bookings" DESC;