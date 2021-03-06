CREATE TABLE reservations (
   reservation_id serial4 primary key,
   user_id int not null,
   schedule_id int not null,
   is_active boolean,
   created_at timestamp,
   updated_at timestamp,
   foreign key (user_id) references users(user_id),
   foreign key (schedule_id) references schedule(schedule_id)
);
