SELECT pg_catalog.setval(pg_get_serial_sequence('users', 'user_id'), (SELECT MAX(user_id) FROM users)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('seats', 'seat_id'), (SELECT MAX(seat_id) FROM seats)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('films', 'film_code'), (SELECT MAX(film_code) FROM films)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('schedule', 'schedule_id'), (SELECT MAX(schedule_id) FROM schedule)+1);
SELECT pg_catalog.setval(pg_get_serial_sequence('reservations', 'reservaton_id'), (SELECT MAX(reservation_id) FROM reservations)+1);
