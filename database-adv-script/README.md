# Complex Queries Implementation

## 1. Inner Join

Selects all rows from both tables as long as the condition is satisfied.

![Inner join](inner_join.png)

Implementation example: *Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings*

```sql 

SELECT 	
	CONCAT(users.first_name, ' ', users.last_name) AS "Full Name",
	property.name AS "Hotel",
	booking.start_date AS "Arrival",
	booking.end_date AS "Departure",
	booking.status AS "Status"
FROM booking
INNER JOIN users ON booking.user_id = users.user_id
INNER JOIN property ON booking.property_id = property.property_id;

```

## 2. LEFT JOIN

Returns all rows from the left table, along with matching rows from the right table.

![left join](left_join.png)

implemenation example: *Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.*

```sql 
SELECT 
	property.name,
	review.rating,
	review.comment,
	review.created_at
FROM property
LEFT JOIN Review on property.property_id = review.property_id
ORDER BY review.rating;
```

## 3. Full Outer Join
Returns all the rows from all the tables, whether they match or not.

implementation example: *Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.*

```sql 
SELECT
	CONCAT(users.first_name, ' ', users.last_name) AS "Full Name",
	property.name AS "Hotel",
	booking.start_date AS "Arrival",
	booking.end_date AS "Departure",
	booking.status AS "Status"
FROM users
FULL OUTER JOIN booking ON users.user_id = booking.user_id
FULL OUTER JOIN property ON property.property_id = booking.property_id;
```