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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astroid (
    astroid_id integer NOT NULL,
    name character varying(30),
    size integer NOT NULL
);


ALTER TABLE public.astroid OWNER TO freecodecamp;

--
-- Name: astroid_astroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astroid_astroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astroid_astroid_id_seq OWNER TO freecodecamp;

--
-- Name: astroid_astroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astroid_astroid_id_seq OWNED BY public.astroid.astroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_million numeric(5,1),
    no_of_stars integer,
    galaxy_name character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    is_spherical boolean,
    distance_from_earth integer,
    planet_name character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    no_of_moons integer,
    has_life boolean,
    planet_name character varying(30),
    star_name character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    no_of_planets_orbiting integer,
    is_spherical boolean,
    distance_from_earth integer,
    star_name character varying(30),
    galaxy_name character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astroid astroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid ALTER COLUMN astroid_id SET DEFAULT nextval('public.astroid_astroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astroid VALUES (1, 'asldk', 213);
INSERT INTO public.astroid VALUES (2, 'lasjd', 3421);
INSERT INTO public.astroid VALUES (3, 'kjeij', 34122);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milkey_way', 1, 'home sweet home', 5000.4, 21012000, 'milkey_way');
INSERT INTO public.galaxy VALUES ('galaxy1', 2, 'galaxy one', 1233.0, 234, 'galaxy1');
INSERT INTO public.galaxy VALUES ('galaxy2', 3, 'galaxy two ', 4324.0, 523, 'galaxy2');
INSERT INTO public.galaxy VALUES ('galaxy3', 4, 'galaxy two ', 4324.0, 523, 'galaxy3');
INSERT INTO public.galaxy VALUES ('galaxy4', 5, 'galaxy two ', 4324.0, 523, 'galaxy4');
INSERT INTO public.galaxy VALUES ('galaxy5', 6, 'galaxy two ', 4324.0, 523, 'galaxy5');
INSERT INTO public.galaxy VALUES ('galaxy6', 7, 'galaxy two ', 4324.0, 523, 'galaxy');
INSERT INTO public.galaxy VALUES ('galaxy7', 8, 'galaxy two ', 4324.0, 523, 'galaxy7');
INSERT INTO public.galaxy VALUES ('galaxy8', 9, 'galaxy two ', 4324.0, 523, 'galaxy8');
INSERT INTO public.galaxy VALUES ('galaxy9', 10, 'galaxy two ', 4324.0, 523, 'galaxy9');
INSERT INTO public.galaxy VALUES ('galaxy10', 11, 'galaxy two ', 4324.0, 523, 'galaxy10');
INSERT INTO public.galaxy VALUES ('galaxy11', 12, 'galaxy two ', 4324.0, 523, 'galaxy11');
INSERT INTO public.galaxy VALUES ('galaxy12', 13, 'galaxy two ', 4324.0, 523, 'galaxy12');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon', 1, true, 8, 'earth');
INSERT INTO public.moon VALUES ('titan', 2, true, 2343, 'jupiter');
INSERT INTO public.moon VALUES ('hello', 3, true, 2343, 'jupiter');
INSERT INTO public.moon VALUES ('juppu', 4, true, 2343, 'jupiter');
INSERT INTO public.moon VALUES ('moon1', 5, true, 2343, 'planet1');
INSERT INTO public.moon VALUES ('moon2', 6, true, 2343, 'planet2');
INSERT INTO public.moon VALUES ('moon3', 7, true, 2343, 'planet3');
INSERT INTO public.moon VALUES ('moon4', 8, true, 2343, 'planet2');
INSERT INTO public.moon VALUES ('moon5', 9, true, 2343, 'planet1');
INSERT INTO public.moon VALUES ('moon6', 10, true, 2343, 'planet1');
INSERT INTO public.moon VALUES ('moon7', 11, true, 2343, 'planet5');
INSERT INTO public.moon VALUES ('moon8', 12, true, 2343, 'planet4');
INSERT INTO public.moon VALUES ('moon9', 13, true, 2343, 'planet5');
INSERT INTO public.moon VALUES ('moon10', 14, true, 2343, 'planet3');
INSERT INTO public.moon VALUES ('moon11', 15, true, 2343, 'planet3');
INSERT INTO public.moon VALUES ('moon12', 16, true, 2343, 'planet2');
INSERT INTO public.moon VALUES ('moon13', 17, true, 2343, 'planet3');
INSERT INTO public.moon VALUES ('moon14', 18, true, 2343, 'planet4');
INSERT INTO public.moon VALUES ('moon15', 19, true, 2343, 'planet5');
INSERT INTO public.moon VALUES ('moon21', 20, true, 2343, 'planet5');
INSERT INTO public.moon VALUES ('moon22', 21, true, 2343, 'planet5');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('earth', 1, true, 1, true, 'earth', 'sun');
INSERT INTO public.planet VALUES ('jupiter', 2, true, 4, false, 'jupiter', 'sun');
INSERT INTO public.planet VALUES ('mercury', 3, true, 4, false, 'mercury', 'sun');
INSERT INTO public.planet VALUES ('mars', 4, true, 4, false, 'mars', 'sun');
INSERT INTO public.planet VALUES ('neptune', 5, true, 4, false, 'neptune', 'sun');
INSERT INTO public.planet VALUES ('venus', 6, true, 4, false, 'venus', 'sun');
INSERT INTO public.planet VALUES ('planet1', 7, true, 4, false, 'planet1', 'star2');
INSERT INTO public.planet VALUES ('planet2', 8, true, 4, false, 'planet2', 'star3');
INSERT INTO public.planet VALUES ('planet3', 9, true, 4, false, 'planet3', 'star4');
INSERT INTO public.planet VALUES ('planet4', 10, true, 4, false, 'planet4', 'star1');
INSERT INTO public.planet VALUES ('planet5', 11, true, 4, false, 'planet5', 'star2');
INSERT INTO public.planet VALUES ('planet6', 12, true, 4, false, 'planet6', 'star2');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, 8, true, 300, 'sun', 'milkey_way');
INSERT INTO public.star VALUES ('star1', 2, 324, true, 3243, 'star1', 'milkey_way');
INSERT INTO public.star VALUES ('star2', 3, 324, true, 3243, 'star2', 'galaxy1');
INSERT INTO public.star VALUES ('star3', 4, 324, true, 3243, 'star3', 'galaxy1');
INSERT INTO public.star VALUES ('star4', 5, 324, true, 3243, 'star4', 'galaxy2');
INSERT INTO public.star VALUES ('star5', 6, 324, true, 3243, 'star5', 'galaxy2');
INSERT INTO public.star VALUES ('star6', 7, 324, true, 3243, 'star6', 'galaxy2');
INSERT INTO public.star VALUES ('star7', 8, 324, true, 3243, 'star7', 'galaxy3');
INSERT INTO public.star VALUES ('star8', 9, 324, true, 3243, 'star8', 'galaxy4');
INSERT INTO public.star VALUES ('star9', 10, 324, true, 3243, 'star9', 'galaxy5');
INSERT INTO public.star VALUES ('star10', 11, 324, true, 3243, 'star10', 'galaxy5');
INSERT INTO public.star VALUES ('star11', 12, 324, true, 3243, 'star11', 'galaxy5');


--
-- Name: astroid_astroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astroid_astroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: astroid astroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_name_key UNIQUE (name);


--
-- Name: astroid astroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_pkey PRIMARY KEY (astroid_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key1 UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: planet planet_planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key1 UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: star star_star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key1 UNIQUE (star_name);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

