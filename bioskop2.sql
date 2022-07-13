--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: films; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.films (
    film_code integer NOT NULL,
    seat_id integer,
    film_name character varying(100),
    is_playing boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: films_film_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.films_film_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: films_film_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.films_film_code_seq OWNED BY public.films.film_code;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservations (
    reservation_id integer NOT NULL,
    user_id integer NOT NULL,
    schedule_id integer NOT NULL,
    is_active boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservations_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservations_reservation_id_seq OWNED BY public.reservations.reservation_id;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    film_code integer,
    tanggal_tayang date,
    jam_mulai time without time zone,
    jam_selesai time without time zone,
    harga_tiket double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.schedule_schedule_id_seq OWNED BY public.schedule.schedule_id;


--
-- Name: seats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seats (
    seat_id integer NOT NULL,
    studio_name character varying(50),
    nomor_kursi integer,
    baris_kursi character(1),
    is_available boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: seats_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seats_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seats_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seats_seat_id_seq OWNED BY public.seats.seat_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email_address character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: films film_code; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films ALTER COLUMN film_code SET DEFAULT nextval('public.films_film_code_seq'::regclass);


--
-- Name: reservations reservation_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations ALTER COLUMN reservation_id SET DEFAULT nextval('public.reservations_reservation_id_seq'::regclass);


--
-- Name: schedule schedule_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.schedule_schedule_id_seq'::regclass);


--
-- Name: seats seat_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seats ALTER COLUMN seat_id SET DEFAULT nextval('public.seats_seat_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.films (film_code, seat_id, film_name, is_playing, created_at, updated_at) FROM stdin;
12345	1	dunia lain	t	2022-08-21 08:07:13	2022-05-17 01:44:00
12346	2	dear nathan	f	2022-05-10 17:37:43	2022-01-08 02:38:16
12347	3	dealova	t	2022-02-18 17:46:55	2022-06-11 01:57:03
12348	4	danur	t	2022-04-17 18:06:00	2022-09-03 14:42:39
12349	5	ku kira kau rumah	f	2022-07-04 09:35:24	2022-08-13 04:33:52
12350	6	danur 2	t	2022-05-25 02:36:36	2022-09-15 15:20:19
12351	7	KKN	f	2022-11-14 03:26:07	2022-02-24 12:45:29
12352	8	matt n mou	t	2022-05-28 13:25:10	2022-08-06 15:05:46
12353	9	hangout	t	2022-04-18 09:50:03	2022-11-03 01:57:50
20178	9	Guardian Of The Galaxy	f	2022-03-16 02:12:56	2022-09-15 04:19:28
34281	4	Enigma of Kaspar Hauser,	f	2022-05-18 14:41:35	2022-06-19 23:13:54
34282	5	Persuasion	f	2022-02-23 23:04:55	2022-10-06 15:43:02
34284	2	16 Acres	f	2022-01-04 09:10:16	2022-01-24 03:50:28
34285	1	Blood and Sand	f	2022-08-03 17:57:49	2022-11-14 05:36:24
34289	3	Hecho en México	t	2022-08-21 03:55:34	2022-05-10 15:49:02
51686	21	Terminator 	t	2022-01-06 01:12:35	2022-11-12 07:09:16
52687	22	Terminator 2	t	2022-08-21 15:49:33	2022-06-26 22:24:16
53688	23	Terminator 3	f	2022-01-09 12:58:36	2022-03-16 13:05:17
54689	34	Pirates of Carrabean	t	2022-02-03 14:33:16	2022-01-06 22:22:42
55690	35	Spiderman	t	2022-04-11 01:27:43	2022-07-22 12:51:19
56691	46	Spiderman 2	f	2022-06-25 16:06:23	2022-08-07 01:06:03
57692	47	Spiderman 3	t	2022-03-09 15:37:40	2022-03-16 10:21:24
58693	18	The Matrix	t	2022-10-28 01:10:57	2022-10-27 23:45:05
59694	19	The Matrix : Reloaded	f	2022-03-08 23:51:00	2022-04-24 11:27:18
60695	30	The Matrix : Revolution	f	2022-07-28 02:24:19	2022-02-22 05:28:34
65158	20	The Unbearable Weight of Massive Talent	t	2022-10-02 13:10:19	2022-09-26 04:33:15
65234	16	Top Gun: Maverick	t	2022-02-13 12:48:34	2022-10-22 06:02:28
65272	19	Death on the Nile	f	2022-08-27 01:30:47	2022-02-17 02:37:23
65432	18	Uncharted	t	2022-05-06 23:01:11	2022-01-13 06:46:36
65476	12	The Dark Knight Rises	t	2022-05-15 22:29:51	2022-03-18 12:22:12
65764	11	Aquaman	t	2022-10-10 23:34:09	2022-08-08 07:36:47
65875	14	Rogue One: A Star Wars Story	f	2022-08-22 19:17:22	2022-02-19 22:41:54
65896	15	Venom	t	2022-04-16 12:31:46	2022-10-12 21:06:15
65986	17	Water Gate Bridge	t	2022-09-30 22:50:32	2022-08-23 23:44:38
65987	13	Skyfall	f	2022-07-07 00:19:20	2022-04-24 16:25:22
70129	14	The Avangers - End Game	f	2022-01-02 21:34:22	2022-03-29 05:02:51
73118	1	Keluarga Cemara 2	t	2022-11-12 20:42:33	2022-06-23 02:08:50
73128	2	Shang-Chi	f	2022-08-23 15:08:10	2022-07-30 05:15:41
73138	3	Pengabdi Setan 2	t	2022-05-05 18:48:02	2022-08-14 02:50:56
73148	4	Morbius	t	2022-03-01 09:55:42	2022-08-27 20:29:11
73158	5	Black Widow	f	2022-06-25 14:18:46	2022-07-02 00:45:37
73168	6	Doctor Strange	f	2022-03-02 08:41:03	2022-10-29 15:32:38
73178	7	Venom 2	t	2022-06-17 12:37:04	2022-04-03 17:59:05
73188	8	Turning Red	t	2022-02-12 14:45:00	2022-04-12 18:56:40
73198	9	Death On The Nile	f	2022-10-04 23:39:57	2022-06-23 23:44:19
73199	10	Sinf 2	t	2022-08-17 10:26:31	2022-09-26 12:08:55
101290	22	Pengabdi Setan 2	f	2022-07-23 19:16:45	2022-11-04 23:50:46
102114	20	Interstellar	t	2022-11-09 06:21:47	2022-11-28 05:36:21
109228	16	Milly & Mamoet	t	2022-07-22 08:38:26	2022-05-04 17:47:12
303224	11	The Raids	t	2022-07-09 21:47:21	2022-06-24 16:29:12
401229	15	Naruto The Movie - The Last	f	2022-08-11 22:50:01	2022-01-02 13:10:26
402212	19	Jomblo	f	2022-01-09 07:59:31	2022-09-13 16:10:59
702112	21	A Quiete Place 2	t	2022-09-23 10:45:30	2022-08-03 15:47:26
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reservations (reservation_id, user_id, schedule_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schedule (schedule_id, film_code, tanggal_tayang, jam_mulai, jam_selesai, harga_tiket, created_at, updated_at) FROM stdin;
46	53688	2022-04-05	19:00:00	21:00:00	30000	\N	\N
47	57692	2022-05-06	12:30:00	15:00:00	40000	\N	\N
48	57692	2022-05-07	16:30:00	18:00:00	40000	\N	\N
49	57692	2022-05-08	19:30:00	21:00:00	40000	\N	\N
50	60695	2022-06-08	15:00:00	17:50:00	50000	\N	\N
51	60695	2022-06-08	19:00:00	21:50:00	50000	\N	\N
1	34285	2021-12-29	12:00:00	14:55:00	29472	2022-07-17 12:00:16	2022-11-26 20:24:08
2	34284	2021-06-28	13:02:00	15:10:00	26706	2022-05-03 06:51:15	2022-04-30 12:14:06
3	34289	2022-03-09	13:27:00	13:56:00	21392	2022-07-24 02:06:20	2022-06-14 08:15:42
4	34281	2021-12-09	13:04:00	13:48:00	20057	2022-03-22 15:20:25	2022-05-03 02:34:52
5	34281	2021-08-30	12:17:00	13:59:00	29890	2022-06-21 14:32:55	2022-03-18 06:27:45
6	34289	2022-03-09	13:27:00	13:56:00	21392	2022-02-26 05:39:06	2022-01-09 19:31:13
7	34281	2021-12-09	13:04:00	13:48:00	20057	2022-03-16 12:13:31	2022-07-04 13:56:23
8	34281	2021-08-30	12:17:00	13:59:00	29890	2022-09-20 06:35:08	2022-05-29 16:55:15
9	34289	2022-03-09	13:27:00	13:56:00	21392	2022-10-09 03:06:02	2022-02-20 12:24:58
10	34281	2021-12-09	13:04:00	13:48:00	20057	2022-09-30 09:32:38	2022-09-15 11:11:04
11	34281	2021-08-30	12:17:00	13:59:00	29890	2022-08-02 06:15:58	2022-05-29 07:03:47
12	702112	2022-07-20	13:00:00	15:00:00	25000	2022-10-29 08:13:30	2022-06-29 11:08:59
13	402212	2022-06-22	15:30:00	18:00:00	35000	2022-02-16 09:12:29	2022-03-19 09:27:37
14	101290	2022-07-28	18:00:00	20:00:00	35000	2022-11-17 19:23:25	2022-01-08 04:06:13
15	102114	2022-07-22	13:00:00	15:00:00	25000	2022-06-04 01:35:01	2022-07-19 17:15:10
16	102114	2022-07-23	18:00:00	20:00:00	35000	2022-06-28 15:19:10	2022-03-11 05:46:10
17	402212	2022-07-02	17:00:00	19:00:00	45000	2022-03-30 02:24:48	2022-10-12 15:43:17
18	109228	2022-06-08	18:00:00	20:00:00	25000	2022-02-01 16:01:04	2022-10-14 03:17:41
19	20178	2022-07-15	18:00:00	20:00:00	35000	2022-07-17 06:42:50	2022-09-07 21:21:16
20	402212	2022-07-05	17:00:00	19:00:00	35000	2022-04-01 01:26:32	2022-08-13 08:06:05
21	102114	2022-07-22	15:00:00	17:00:00	25000	2022-08-12 23:32:35	2022-05-27 02:18:28
22	12345	2022-06-09	12:00:00	14:00:00	20000	2022-10-07 10:19:54	2022-08-12 20:07:36
23	12346	2022-07-01	08:00:00	10:00:00	20000	2022-09-02 11:47:18	2022-01-31 04:06:08
24	12347	2022-08-02	09:00:00	11:00:00	25000	2022-03-27 15:33:48	2022-08-09 12:42:18
25	12348	2022-03-08	13:00:00	15:00:00	30000	2022-04-28 02:38:46	2022-11-10 00:32:47
26	12349	2022-02-03	15:00:00	17:00:00	20000	2022-01-30 06:02:17	2022-06-30 13:52:34
27	12350	2022-06-05	16:00:00	18:00:00	25000	2022-11-09 02:02:07	2022-05-21 08:41:59
28	12351	2022-08-04	17:00:00	19:00:00	20000	2022-05-09 05:08:13	2022-04-21 03:45:07
29	12352	2022-09-17	10:00:00	12:00:00	30000	2022-07-28 06:09:10	2022-04-16 00:12:06
30	12353	2022-04-11	11:00:00	13:00:00	25000	2022-06-07 18:55:53	2022-05-01 16:06:34
31	12353	2022-05-07	10:00:00	12:00:00	30000	2022-07-05 07:52:12	2022-08-23 11:46:22
32	73118	2022-06-11	11:30:00	13:40:00	40000	2022-10-06 12:46:18	2022-11-03 05:07:15
33	73128	2022-06-11	11:30:00	13:40:00	40000	2022-01-21 13:30:10	2022-01-11 17:53:26
34	73138	2022-06-11	11:30:00	13:40:00	40000	2022-08-10 19:18:42	2022-09-12 08:36:17
35	73148	2022-06-11	11:30:00	13:40:00	40000	2022-07-26 03:43:06	2022-01-04 15:46:53
36	73158	2022-07-11	12:30:00	14:40:00	40000	2022-03-28 03:29:18	2022-10-18 03:01:26
37	73168	2022-07-11	12:30:00	14:40:00	40000	2022-02-03 14:00:22	2022-04-26 22:26:21
38	73178	2022-08-11	13:30:00	15:40:00	40000	2022-10-13 23:00:33	2022-08-11 08:01:25
39	73188	2022-09-11	13:30:00	15:40:00	40000	2022-02-15 04:31:53	2022-11-29 02:05:21
40	73198	2022-09-11	14:30:00	16:40:00	40000	2022-01-20 12:29:00	2022-11-07 01:02:16
41	73199	2022-09-11	15:30:00	17:40:00	40000	2022-04-23 21:50:17	2022-08-08 13:54:03
42	54689	2022-03-01	13:00:00	15:00:00	35000	2022-08-20 17:50:51	2022-09-20 14:13:58
43	54689	2022-03-02	16:00:00	18:00:00	35000	2022-10-30 02:53:58	2022-06-16 14:53:33
44	53688	2022-04-03	12:00:00	14:00:00	30000	2022-05-07 16:09:30	2022-09-27 18:38:50
45	53688	2022-04-04	15:00:00	17:00:00	30000	2022-09-20 02:36:59	2022-04-26 16:10:12
\.


--
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.seats (seat_id, studio_name, nomor_kursi, baris_kursi, is_available, created_at, updated_at) FROM stdin;
28	Studio C	22	B	f	2022-08-22 08:21:09	2022-05-27 21:23:36
63	Studio H	22	B	f	2022-08-22 08:21:09	2022-05-27 21:23:36
22	Studio B	24	C	t	2022-03-30 02:33:56	2022-04-20 05:54:35
29	Studio C	26	C	t	2022-11-01 12:45:24	2022-04-30 20:00:28
64	Studio I	28	C	t	2022-05-27 04:16:04	2022-05-02 23:30:23
23	Studio B	30	D	t	2022-04-15 17:02:24	2022-01-31 22:53:04
33	Studio D	30	D	t	2022-04-15 17:02:24	2022-01-31 22:53:04
34	Studio D	31	D	t	2022-05-19 06:23:30	2022-02-17 05:18:17
35	Studio D	32	D	t	2022-10-10 15:28:45	2022-03-06 08:50:21
36	Studio D	33	D	f	2022-11-21 19:12:13	2022-03-10 16:40:08
70	studio C	\N	\N	\N	\N	\N
1	Studio A	1	A	t	2022-06-13 23:58:01	2022-01-07 05:08:16
7	Studio B	1	A	t	2022-06-13 23:58:01	2022-01-07 05:08:16
24	Studio C	1	A	t	2022-06-13 23:58:01	2022-01-07 05:08:16
30	Studio D	1	A	t	2022-06-13 23:58:01	2022-01-07 05:08:16
37	Studio E	1	A	t	2022-06-13 23:58:01	2022-01-07 05:08:16
53	Studio G	1	A	t	2022-06-13 23:58:01	2022-01-07 05:08:16
2	Studio A	2	A	t	2022-07-24 21:37:05	2022-11-26 02:07:39
8	Studio B	2	A	t	2022-07-24 21:37:05	2022-11-26 02:07:39
25	Studio C	2	A	t	2022-07-24 21:37:05	2022-11-26 02:07:39
31	Studio D	2	A	t	2022-07-24 21:37:05	2022-11-26 02:07:39
38	Studio E	2	A	t	2022-07-24 21:37:05	2022-11-26 02:07:39
54	Studio G	2	A	t	2022-07-24 21:37:05	2022-11-26 02:07:39
9	Studio B	3	A	t	2022-09-17 05:43:49	2022-10-13 12:52:50
55	Studio G	3	A	t	2022-09-17 05:43:49	2022-10-13 12:52:50
10	Studio B	4	A	t	2022-04-27 08:46:21	2022-06-30 12:52:04
56	Studio G	4	A	t	2022-04-27 08:46:21	2022-06-30 12:52:04
11	Studio B	5	A	t	2022-06-05 08:24:05	2022-10-03 12:18:37
57	Studio G	5	A	t	2022-06-05 08:24:05	2022-10-03 12:18:37
58	Studio G	6	A	t	2022-06-19 11:01:23	2022-03-15 19:34:34
32	Studio D	7	B	t	2022-11-22 15:40:19	2022-07-02 01:52:55
59	Studio G	7	B	t	2022-11-22 15:40:19	2022-07-02 01:52:55
60	Studio G	8	B	t	2022-07-10 11:13:15	2022-01-25 14:29:47
39	Studio E	9	B	t	2022-05-20 19:28:48	2022-08-31 17:55:15
61	Studio G	9	B	t	2022-05-20 19:28:48	2022-08-31 17:55:15
51	Studio F	10	B	f	2022-02-04 19:17:20	2022-01-16 19:37:55
62	Studio G	10	B	f	2022-02-04 19:17:20	2022-01-16 19:37:55
3	Studio A	11	B	t	2022-06-28 05:00:48	2022-03-26 22:07:43
12	Studio B	11	B	t	2022-06-28 05:00:48	2022-03-26 22:07:43
41	Studio E	11	B	t	2022-06-28 05:00:48	2022-03-26 22:07:43
52	Studio G	11	B	t	2022-06-28 05:00:48	2022-03-26 22:07:43
4	Studio A	12	B	t	2022-10-17 23:01:43	2022-06-29 04:22:00
13	Studio B	12	B	t	2022-10-17 23:01:43	2022-06-29 04:22:00
42	Studio E	12	B	t	2022-10-17 23:01:43	2022-06-29 04:22:00
5	Studio A	13	B	f	2022-10-24 09:18:35	2022-09-13 23:19:15
14	Studio B	13	B	f	2022-10-24 09:18:35	2022-09-13 23:19:15
43	Studio E	13	B	f	2022-10-24 09:18:35	2022-09-13 23:19:15
15	Studio B	14	B	f	2022-06-14 17:54:31	2022-06-11 16:20:49
44	Studio E	14	B	f	2022-06-14 17:54:31	2022-06-11 16:20:49
16	Studio B	15	B	t	2022-08-01 22:01:45	2022-09-22 12:06:22
45	Studio E	15	B	t	2022-08-01 22:01:45	2022-09-22 12:06:22
17	Studio B	16	B	t	2022-02-19 09:18:59	2022-02-09 14:19:42
46	Studio E	16	B	t	2022-02-19 09:18:59	2022-02-09 14:19:42
18	Studio B	17	B	f	2022-11-26 04:16:33	2022-08-06 12:55:10
47	Studio E	17	B	f	2022-11-26 04:16:33	2022-08-06 12:55:10
65	Studio J	17	B	f	2022-11-26 04:16:33	2022-08-06 12:55:10
19	Studio B	18	B	t	2022-03-03 10:57:54	2022-04-28 22:21:47
48	Studio E	18	B	t	2022-03-03 10:57:54	2022-04-28 22:21:47
20	Studio B	19	B	t	2022-08-10 02:06:24	2022-05-01 15:53:58
49	Studio E	19	B	t	2022-08-10 02:06:24	2022-05-01 15:53:58
6	Studio A	20	B	t	2022-08-17 06:05:17	2022-11-16 18:29:50
21	Studio B	20	B	t	2022-08-17 06:05:17	2022-11-16 18:29:50
26	Studio C	20	B	t	2022-08-17 06:05:17	2022-11-16 18:29:50
40	Studio E	20	B	t	2022-08-17 06:05:17	2022-11-16 18:29:50
27	Studio C	21	B	t	2022-10-04 02:31:16	2022-10-04 17:24:56
50	Studio E	21	B	t	2022-10-04 02:31:16	2022-10-04 17:24:56
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, username, email_address, password, created_at, updated_at) FROM stdin;
1	Reidara	rthirsk0@phoca.cz	baANbC	2022-06-21 05:06:01	2022-11-22 10:09:53
2	Adriannaa	anaismith1@quantcast.com	ZQAW3d	2022-02-02 05:22:34	2022-01-07 02:44:32
3	Alexandraa	aimesen2@multiply.com	2x3Fb7uKUrk	2022-06-13 00:56:33	2022-09-01 15:39:06
4	Shainaa	smcsporrin3@youku.com	EKSXNC	2022-03-19 20:00:41	2022-09-17 20:15:51
5	Brynaa	bemmerson4@cbslocal.com	V14BYxZZ3	2022-05-17 16:22:38	2022-02-28 08:49:46
6	najibdj_	najib.djulfikar@gmail.com	sad28sj2919k099	2022-08-29 04:51:01	2022-11-16 20:09:26
7	annisyayh_	annisya.yuliah@gmail.com	ddj992j38j4w1a1	2022-06-10 16:09:38	2022-11-13 01:26:28
8	_fahmikamil	fahmi.kamil@gmail.com	11mkkalpi02j442	2022-08-28 09:31:30	2022-03-12 20:30:27
9	yadim21	yadimul@gmail.com	8dnv9op01o1dffh	2022-01-14 07:10:59	2022-02-02 04:32:23
10	miqbalash	m.iqbalash@gmail.com	jl0as9d84bnvj32	2022-10-10 02:47:33	2022-09-20 10:53:43
11	aneu_an	aneu.andiani@gmail.com	99sjdb0w1y342hg	2022-03-16 20:27:01	2022-11-12 09:48:58
12	__hanad	hanadiar@gmail.com	4hjllsm013xasf8	2022-03-12 12:21:59	2022-10-16 22:11:00
13	dedenj	dedenj@gmail.com	s01933bbv0x092j	2022-04-03 00:54:39	2022-01-02 05:28:20
14	rizkyam	rizky.am@gmail.com	jjs01m2cx84j2fg	2022-07-18 16:10:05	2022-08-16 22:28:10
15	zeviraal	zevir.al@gmail.com	92nnco10fipe3bc	2022-09-11 17:23:48	2022-02-14 03:22:49
16	20001dini	dini@gmail.com	1001	2022-11-01 23:08:10	2022-02-03 06:52:48
17	20002zahra	zahra@gmail.com	1002	2022-01-31 17:39:48	2022-09-01 13:15:37
18	20003agus	agus@gmail.com	1003	2022-10-25 02:55:20	2022-09-29 07:10:11
19	20004tisya	tisya@gmail.com	1004	2022-03-22 23:13:05	2022-04-25 23:58:24
20	20005rani	rani@gmail.com	1005	2022-09-22 06:09:58	2022-10-01 16:48:09
21	20006fajar	fajar@gmail.com	1006	2022-03-11 09:13:23	2022-10-29 05:06:45
22	20007irsyad	irsyad@gmail.com	1007	2022-05-20 09:58:35	2022-08-02 22:16:33
23	20008dani	dani@gmail.com	1008	2022-03-20 15:23:16	2022-11-11 08:32:54
24	20009firman	firman@gmail.com	1009	2022-01-08 13:07:40	2022-09-04 22:20:27
25	20010syifa	syifa@gmail.com	1010	2022-03-05 10:09:58	2022-07-24 13:10:39
26	Yasmin	yasmin@gmail.com	ya5M1N	2022-01-22 12:20:31	2022-09-05 07:45:28
27	Anindita	anindita@gmail.com	AN0174	2022-03-11 17:00:00	2022-06-08 15:02:47
28	Jovian	jovian@gmail.com	70V14N	2022-03-07 06:39:01	2022-01-10 13:14:03
29	Bintang	bintang@gmail.com	81NT4NG	2022-11-10 15:06:57	2022-07-24 21:26:12
30	Dimas	dimas@gmail.com	D1M45	2022-01-05 20:15:07	2022-02-01 08:00:38
31	Jannah	jannah@gmail.com	74N4H	2022-09-04 23:13:26	2022-09-23 10:41:36
32	Alden	alden@gmail.com	4LD3N	2022-03-03 11:16:03	2022-01-07 21:03:44
33	Nazwa	nazwa@gmail.com	N4ZW4	2022-05-24 00:30:58	2022-07-08 23:16:54
34	Stefan	stefan@gmail.com	5T3V4N	2022-11-21 11:52:02	2022-07-20 14:22:52
35	Fadil	fadil@gmail.com	F4D1L	2022-08-29 04:32:27	2022-08-20 04:03:12
36	JokoNugroho	jknug@gmail.com	asdf98sf7d89	2022-06-29 13:27:29	2022-06-16 01:42:41
37	AniMaryani	animar@gmail.com	sg7gdf8sgs7f	2022-11-04 15:56:17	2022-09-16 07:54:24
38	FaisalAmar	faisar@gmail.com	8ars6fd86f7d	2022-10-23 19:00:57	2022-05-26 00:53:57
39	WahyuRudi	wahyued@gmail.com	lk3j425jkh34	2022-06-12 10:58:27	2022-05-17 20:51:38
40	ArifinArkan	arifi@gmail.com	asdf98sf7d89	2022-04-12 03:01:41	2022-10-06 10:36:05
41	BudiRaharja	budir@gmail.com	jh4v56jh456h	2022-11-11 14:29:32	2022-07-06 07:00:50
42	SonyArdian	sonyar@gmail.com	kj56h7jk577j	2022-09-21 11:40:06	2022-01-28 21:51:47
43	RudiRenad	rudiren@gmail.com	vssjhdfb8742	2022-09-09 08:13:33	2022-02-02 07:12:13
44	AhmadWahid	ahmadw@gmail.com	bdnfgbfd8997	2022-02-09 04:14:40	2022-07-31 12:23:20
45	IqbalRama	iqbalra@gmail.com	dfgh87gdf6hf	2022-11-15 19:50:33	2022-08-17 12:34:25
46	ArieDewanta	aried@gmail.com	asvhsa87sdab	2022-09-29 17:39:52	2022-02-20 02:34:05
47	KhaznanLabas	khaz@gmail.com	5b6gf4f6g51b	2022-07-13 18:24:00	2022-04-10 02:38:22
48	AdrianMayori	adri@gmail.com	5f4gdbf65fdb	2022-05-09 11:04:14	2022-01-10 18:37:07
49	FahdnulHerma	fahd@gmail.com	dfg8hj4y8etr	2022-11-22 19:21:31	2022-08-16 13:59:21
50	BryanTika	bryanti@gmail.com	tuik4uyi98kj	2022-11-03 00:21:51	2022-04-06 00:30:52
51	HizkiaFeb	hizkiaf@gmail.com	er8y97ret65h	2022-08-21 15:44:12	2022-10-11 11:34:25
52	BanniOnnara	banni@gmail.com	89fb43d2fb1b	2022-10-13 10:36:38	2022-10-26 14:59:28
53	SuryaTomo	suryato@gmail.com	78gnh46456fn	2022-04-30 23:54:40	2022-04-16 01:44:01
54	FirasSha	firashad@gmail.com	8reyt7er65eh	2022-11-21 21:04:09	2022-10-21 15:13:58
55	Syahid	syahidalast@gmail.com	231nbvc56n4h	2022-09-26 23:09:33	2022-08-30 23:12:10
56	rovestio	tanabear@getmail.lt	webranh	2022-03-01 17:22:14	2022-05-27 11:10:17
57	odlextro	schizogirl@mservices.life	scrigna	2022-01-21 02:15:49	2022-09-06 02:38:34
58	ehaderca	stalker4100@fixthisrecipe.com	orkirth	2022-03-20 23:35:18	2022-10-12 08:07:06
59	oindebit	pud2@mexcool.com	omenzan	2022-01-03 10:33:39	2022-02-07 17:32:52
60	inordime	waterpulse92@frepsalan.website	stionfu	2022-02-12 02:16:24	2022-04-22 08:53:19
61	devouson	zppr@alvinneo.com	eirempe	2022-05-19 10:28:01	2022-01-26 17:28:27
62	venatrin	dnwekl@4su.one	amidima	2022-08-24 13:49:20	2022-01-26 06:26:41
63	tecotban	crooks@pakkaji.com	sculega	2022-09-21 13:47:39	2022-07-26 17:05:49
64	antonzar	lyathifnsjau@gmailiz.com	dlatona	2022-10-24 20:30:39	2022-09-04 00:08:10
65	sparialo	katolap@nakiuha.com	antionc	2022-08-12 20:45:06	2022-08-02 13:46:13
\.


--
-- Name: films_film_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.films_film_code_seq', 1, false);


--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservations_reservation_id_seq', 1, false);


--
-- Name: schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 51, true);


--
-- Name: seats_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seats_seat_id_seq', 65, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 65, true);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (film_code);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (reservation_id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: reservations reservations_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedule(schedule_id);


--
-- Name: reservations reservations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

