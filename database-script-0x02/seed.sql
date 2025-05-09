-- USERS
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('u1', 'Alice', 'Walker', 'alice@example.com', 'hashed_pw_1', '1234567890', 'host'),
('u2', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'guest'),
('u3', 'Charlie', 'Lee', 'charlie@example.com', 'hashed_pw_3', NULL, 'guest'),
('u4', 'Diana', 'Jones', 'diana@example.com', 'hashed_pw_4', NULL, 'host');

-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
('p1', 'u1', 'Beachside Bungalow', 'Cozy house near the beach', 'Malibu, CA', 250.00),
('p2', 'u4', 'Downtown Loft', 'Modern loft in city center', 'New York, NY', 320.00);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('b1', 'p1', 'u2', '2025-06-10', '2025-06-15', 1250.00, 'confirmed'),
('b2', 'p2', 'u3', '2025-07-01', '2025-07-05', 1280.00, 'pending');

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay1', 'b1', 1250.00, 'credit_card'),
('pay2', 'b2', 1280.00, 'paypal');

-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('r1', 'p1', 'u2', 5, 'Amazing stay, perfect location!'),
('r2', 'p2', 'u3', 4, 'Nice place, but a bit noisy.');

-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('m1', 'u2', 'u1', 'Hey, is early check-in possible?'),
('m2', 'u1', 'u2', 'Yes, you can check in at 1 PM.'),
('m3', 'u3', 'u4', 'Can I extend my stay by one day?');
