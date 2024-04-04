--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
-- Name: userinfo; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.userinfo (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.userinfo OWNER TO freecodecamp;

--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.userinfo VALUES ('user_1712239662636', 2, 660);
INSERT INTO public.userinfo VALUES ('user_1712239662637', 5, 73);
INSERT INTO public.userinfo VALUES ('user_1712239768279', 2, 676);
INSERT INTO public.userinfo VALUES ('user_1712239768280', 5, 328);
INSERT INTO public.userinfo VALUES ('user_1712239794898', 2, 419);
INSERT INTO public.userinfo VALUES ('user_1712239794899', 5, 49);
INSERT INTO public.userinfo VALUES ('user_1712239830997', 2, 21);
INSERT INTO public.userinfo VALUES ('user_1712239830998', 5, 204);


--
-- Name: userinfo userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

