CREATE DATABASE bioskop;

USE bioskop;

CREATE TABLE `Users` (
    `user_id` int AUTO_INCREMENT,
    `username` varchar(50) NOT NULL,
    `email_address` varchar(50) NOT NULL,
    `password` varchar(50) NOT NULL,
    PRIMARY KEY(`user_id`)
);

CREATE TABLE `Seats` (
    `seat_id` int AUTO_INCREMENT,
    `studio_name` varchar(50),
    `nomor_kursi` int,
    PRIMARY KEY(`seat_id`)
);

CREATE TABLE `Films` (
    `film_code` int,
    `seat_id` int,
    `film_name` varchar(100),
    `is_playing` bool,
    PRIMARY KEY (`film_code`),
    FOREIGN KEY (`seat_id`) REFERENCES `Seats`(`seat_id`)
);

CREATE TABLE Schedule (
    schedule_id int AUTO_INCREMENT,
    film_code int,
    tanggal_tayang date,
    jam_mulai time,
    jam_selesai time,
    harga_tiket double,
    PRIMARY KEY(schedule_id),
    FOREIGN KEY(film_code) REFERENCES Films(film_code)
);

ALTER TABLE bioskop.films ADD created_at TIMESTAMP;
ALTER TABLE bioskop.films ADD updated_at TIMESTAMP;

ALTER TABLE bioskop.users ADD created_at TIMESTAMP;
ALTER TABLE bioskop.users ADD updated_at TIMESTAMP;

ALTER TABLE bioskop.schedule ADD created_at TIMESTAMP;
ALTER TABLE bioskop.schedule ADD updated_at TIMESTAMP;

alter table seats add baris_kursi char;

alter table seats add is_available bool;

ALTER TABLE bioskop.seats ADD created_at TIMESTAMP;
ALTER TABLE bioskop.seats ADD updated_at TIMESTAMP;

