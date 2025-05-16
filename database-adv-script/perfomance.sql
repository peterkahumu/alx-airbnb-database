SELECT 
	b.booking_id as "Booking ID",
	b.status as "Status",
	CONCAT(u.first_name, ' ', u.last_name) as "Full Name",
	u.phone_number as "Phone Number",
	u.email as "Email",
	p.name as "Property Name",
	p.location as "Location",
	CONCAT(h.first_name, ' ', h.last_name) as "Host Name",
	py.amount  AS "Payed Amount",
	py.payment_method AS "Payment Method"
FROM booking b
INNER JOIN users u ON u.user_id = b.user_id
INNER JOIN property p ON p.property_id = b.property_id
INNER JOIN users h ON h.user_id = p.host_id
LEFT JOIN payment py ON b.booking_id = py.booking_id;