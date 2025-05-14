-- Query to get all users with their bookings
SELECT 	
	CONCAT(users.first_name, ' ', users.last_name) AS "Full Name",
	property.name AS "Hotel",
	booking.start_date AS "Arrival",
	booking.end_date AS "Departure",
	booking.status AS "Status"
FROM booking
INNER JOIN users ON booking.user_id = users.user_id
INNER JOIN property ON booking.property_id = property.property_id;


-- Query to get all properties with their reviews (includes those without reviews)
SELECT 
	property.name,
	review.rating,
	review.comment,
	review.created_at
FROM property
LEFT JOIN Review on property.property_id = review.property_id
ORDER BY review.rating;

-- FULL OUTER JOIN to retrieve all users and all bookings.
SELECT
	CONCAT(users.first_name, ' ', users.last_name) AS "Full Name",
	property.name AS "Hotel",
	booking.start_date AS "Arrival",
	booking.end_date AS "Departure",
	booking.status AS "Status"
FROM users
FULL OUTER JOIN booking ON users.user_id = booking.user_id
FULL OUTER JOIN property ON property.property_id = booking.property_id;

