I have used the POSSTGRESQL Explain tool for this exercise.

# QUERY ONE: GET ALL BOOKINGS MADE BY EACH USER


### Before optimization

Running time: 192 ms

Other statitics

![user_bookings](BEFORE%20INDEXING.png)

The following columns were created for indexed:
1. users.first_name
2. users.last_name
3. booking.booking_id
4. users.user_id

```sql 
CREATE INDEX IF NOT EXISTS index01_users ON users(user_id, first_name, last_name);
CREATE INDEX IF NOT EXISTS index01_booking ON booking(booking_id);
```

### After optimization (creating index)
Running time: 149ms

Other statistics: 
![user_bookings](After%20indexing.png)


## Observations
- Query time reduced (192ms -> 149ms)
- The cost improved significantly (please refer to provided images.)