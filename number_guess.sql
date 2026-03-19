--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO postgres;

\connect number_guess

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
-- Name: game_stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_stats (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.game_stats OWNER TO freecodecamp;

--
-- Name: game_stats_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_stats_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_stats_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_stats_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_stats_game_id_seq OWNED BY public.game_stats.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game_stats game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats ALTER COLUMN game_id SET DEFAULT nextval('public.game_stats_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_stats VALUES (1, 1, 10);
INSERT INTO public.game_stats VALUES (2, 2, 759);
INSERT INTO public.game_stats VALUES (3, 2, 488);
INSERT INTO public.game_stats VALUES (4, 3, 344);
INSERT INTO public.game_stats VALUES (5, 3, 718);
INSERT INTO public.game_stats VALUES (6, 2, 86);
INSERT INTO public.game_stats VALUES (7, 2, 354);
INSERT INTO public.game_stats VALUES (8, 2, 18);
INSERT INTO public.game_stats VALUES (9, 4, 694);
INSERT INTO public.game_stats VALUES (10, 4, 44);
INSERT INTO public.game_stats VALUES (11, 5, 604);
INSERT INTO public.game_stats VALUES (12, 5, 493);
INSERT INTO public.game_stats VALUES (13, 4, 382);
INSERT INTO public.game_stats VALUES (14, 4, 909);
INSERT INTO public.game_stats VALUES (15, 4, 586);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'TestUser');
INSERT INTO public.users VALUES (2, 'user_1773900260044');
INSERT INTO public.users VALUES (3, 'user_1773900260043');
INSERT INTO public.users VALUES (4, 'user_1773900329819');
INSERT INTO public.users VALUES (5, 'user_1773900329818');


--
-- Name: game_stats_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_stats_game_id_seq', 15, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- Name: game_stats game_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats
    ADD CONSTRAINT game_stats_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: game_stats game_stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_stats
    ADD CONSTRAINT game_stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

