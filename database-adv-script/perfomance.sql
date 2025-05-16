
-- Optimize the Query

CREATE INDEX IF NOT EXISTS idx_booking_user_id ON booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON booking(property_id);
CREATE INDEX IF NOT EXISTS idx_property_host_id ON property(host_id);
CREATE INDEX IF NOT EXISTS idx_payment_bookin_id ON payment(booking_id);
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);
CREATE INDEX IF NOT EXISTS idx_property_property_id ON property(property_id);
CREATE INDEX IF NOT EXISTS idx_booking_booking_id ON booking(booking_id);
CREATE INDEX IF NOT EXISTS idx_payment_payment_id ON payment(payment_id);

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
INNER JOIN payment py ON b.booking_id = py.booking_id
WHERE b.status = 'confirmed' 
AND py.payment_method = 'paypal';
