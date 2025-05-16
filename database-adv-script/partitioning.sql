--CREATE TYPE IF NOT EXISTS booking_status AS ENUM('confirmed', 'pending', 'cancelled');

CREATE TABLE IF NOT EXISTS booking_new(
	booking_id UUID NOT NULL DEFAULT uuid_generate_v4(),
	property_id UUID NOT NULL,
	user_id UUID NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	total_price DECIMAL NOT NULL,
	status booking_status NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY(booking_id, status),
	FOREIGN KEY (property_id) REFERENCES property(property_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
) PARTITION BY LIST (status);

-- CREATE A TABLE FOR EACH STATUS
CREATE TABLE booking_confirmed PARTITION OF booking_partitioned
FOR VALUES IN ('confirmed');
CREATE TABLE booking_pending PARTITION OF booking_partitioned
FOR VALUES IN ('pending');
CREATE TABLE booking_cancelled PARTITION OF booking_partitioned
FOR VALUES IN ('cancelled');

-- Insert values from the booking table
INSERT INTO booking_new
SELECT * FROM booking;

EXPLAIN ANALYZE SELECT * FROM booking_new;