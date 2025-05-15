EXPLAIN ANALYZE SELECT 
	RANK() OVER (ORDER BY COUNT(*) DESC) AS "Rank",
	CONCAT(u.first_name, ' ', u.last_name) AS "Name",
	COUNT(*) AS "Total Bookings"
FROM booking b
INNER JOIN users u ON b.user_id = u.user_id
GROUP BY "Name"
ORDER BY "Total Bookings" DESC;

CREATE INDEX IF NOT EXISTS index01_users ON users(user_id, first_name, last_name);
CREATE INDEX IF NOT EXISTS index01_booking ON booking(booking_id);

EXPLAIN ANALYZE SELECT 
	RANK() OVER (ORDER BY COUNT(*) DESC) AS "Rank",
	CONCAT(u.first_name, ' ', u.last_name) AS "Name",
	COUNT(*) AS "Total Bookings"
FROM booking b
INNER JOIN users u ON b.user_id = u.user_id
GROUP BY "Name"
ORDER BY "Total Bookings" DESC;