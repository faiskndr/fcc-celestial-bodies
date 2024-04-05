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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_in_million_of_light_year numeric NOT NULL,
    magnitude numeric(4,2),
    diameter_in_light_year integer
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
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_year integer,
    diameter_in_miles integer,
    planet_id integer NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_year integer NOT NULL,
    diameter_in_miles integer,
    has_life boolean,
    liveable boolean,
    planet_type_id integer,
    star_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_billion_year integer NOT NULL,
    diameter_in_miles integer NOT NULL,
    galaxy_id integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.000026, -20.50, 100000);
INSERT INTO public.galaxy VALUES (23, 'Draco II', 0.0701, 15.87, 120);
INSERT INTO public.galaxy VALUES (24, 'Tucana III', 0.0747, 15.50, 220);
INSERT INTO public.galaxy VALUES (25, 'Sagittarius Dwarf Sphr SagDEG', 0.078, 4.50, 10000);
INSERT INTO public.galaxy VALUES (26, 'Hydrus I', 0.0900, 12.49, 348);
INSERT INTO public.galaxy VALUES (27, 'Carina III', 0.0907, 14.82, 200);
INSERT INTO public.galaxy VALUES (28, 'Ursa Major II Dwarf', 0.098, 14.30, 1800);
INSERT INTO public.galaxy VALUES (29, 'Reticulum II', 0.102, 14.40, 378);
INSERT INTO public.galaxy VALUES (30, 'Carina II', 0.122, 13.36, 590);
INSERT INTO public.galaxy VALUES (31, 'Pictor II', 0.147, 15.10, 300);
INSERT INTO public.galaxy VALUES (32, 'Large Magellanic Cloud (LMC)', 0.163, 0.90, 32200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon 0', 7585, 4533, 1);
INSERT INTO public.moon VALUES (3, 'Moon 1', 6459, 4621, 8);
INSERT INTO public.moon VALUES (4, 'Moon 2', 5009, 3682, 7);
INSERT INTO public.moon VALUES (5, 'Moon 3', 4250, 4490, 3);
INSERT INTO public.moon VALUES (6, 'Moon 4', 6808, 3644, 5);
INSERT INTO public.moon VALUES (7, 'Moon 5', 6359, 4638, 3);
INSERT INTO public.moon VALUES (8, 'Moon 6', 5982, 3316, 7);
INSERT INTO public.moon VALUES (9, 'Moon 7', 5874, 4360, 9);
INSERT INTO public.moon VALUES (10, 'Moon 8', 4574, 3553, 3);
INSERT INTO public.moon VALUES (11, 'Moon 9', 7350, 4832, 5);
INSERT INTO public.moon VALUES (12, 'Moon 10', 7415, 3939, 12);
INSERT INTO public.moon VALUES (13, 'Moon 11', 5353, 4172, 1);
INSERT INTO public.moon VALUES (14, 'Moon 12', 7787, 3007, 4);
INSERT INTO public.moon VALUES (15, 'Moon 13', 4250, 4192, 1);
INSERT INTO public.moon VALUES (16, 'Moon 14', 7354, 4431, 4);
INSERT INTO public.moon VALUES (17, 'Moon 15', 5438, 4155, 12);
INSERT INTO public.moon VALUES (18, 'Moon 16', 5574, 3277, 11);
INSERT INTO public.moon VALUES (19, 'Moon 17', 6203, 4873, 2);
INSERT INTO public.moon VALUES (20, 'Moon 18', 5687, 3106, 7);
INSERT INTO public.moon VALUES (21, 'Moon 19', 6091, 4922, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4602, 7980, true, true, 15, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4700, 8000, false, true, 15, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4600, 2000, false, false, 4, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 4500, 20000, false, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4200, 40000, false, false, 2, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 4200, 20000, false, false, 2, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 10000, false, false, 2, 1);
INSERT INTO public.planet VALUES (8, 'Uranus II', 4500, 10000, false, false, 2, 1);
INSERT INTO public.planet VALUES (9, 'Uranus III', 4500, 10000, false, false, 9, 1);
INSERT INTO public.planet VALUES (10, 'Uranus IV', 4500, 10000, false, false, 10, 1);
INSERT INTO public.planet VALUES (11, 'Neptune II', 4500, 10000, false, false, 2, 1);
INSERT INTO public.planet VALUES (12, 'Neptune III', 4500, 10000, false, false, 2, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Chthonian Planet', 'An extrasolar planet that orbits close to its parent star. Most Chthonian planets are expected to be gas giants that had their atmospheres stripped away, leaving their cores.');
INSERT INTO public.planet_type VALUES (2, 'Carbon Planet', 'A theoretical terrestrial planet that could form if protoplanetary discs are carbon-rich and oxygen-poor.');
INSERT INTO public.planet_type VALUES (3, 'Coreless Planet', 'A theoretical planet that has undergone planetary differentiation but has no metallic core.');
INSERT INTO public.planet_type VALUES (4, 'Desert Planet', 'A theoretical terrestrial planet with very little water.');
INSERT INTO public.planet_type VALUES (5, 'Gas Dwarf', 'A low-mass planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (6, 'Gas Giant', 'A massive planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (7, 'Helium Planet', 'A theoretical planet that may form via mass loss from a low-mass white dwarf.');
INSERT INTO public.planet_type VALUES (8, 'Ice Giant', 'A giant planet composed mainly of ices—volatile substances heavier than hydrogen and helium, such as water, methane, and ammonia—as');
INSERT INTO public.planet_type VALUES (9, 'Ice Planet', 'A theoretical planet with an icy surface and consists of a global cryosphere.');
INSERT INTO public.planet_type VALUES (10, 'Iron Planet', 'A theoretical planet that consists primarily of an iron-rich core with little or no mantle.');
INSERT INTO public.planet_type VALUES (11, 'Lava Planet', 'A theoretical terrestrial planet with a surface mostly or entirely covered by molten lava.');
INSERT INTO public.planet_type VALUES (12, 'Ocean Planet', 'A theoretical planet which has a substantial fraction of its mass made of water.');
INSERT INTO public.planet_type VALUES (13, 'Puffy Planet', 'Also known as a hot Saturn. A gas giant with a large radius and very low density which is similar to or lower than Saturn');
INSERT INTO public.planet_type VALUES (14, 'Silicate Planet', 'A terrestrial planet that is composed primarily of silicate rocks.');
INSERT INTO public.planet_type VALUES (15, 'Terrestrial Planet', 'Also known as a telluric planet or rocky planet. A planet that is composed primarily of carbonaceous or silicate rocks or metals.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, 865000, 1);
INSERT INTO public.star VALUES (2, 'Betelgues', 4700, 565000, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 4600, 400000, 1);
INSERT INTO public.star VALUES (4, 'Regulus', 4400, 480000, 1);
INSERT INTO public.star VALUES (5, 'Leo', 4400, 380000, 1);
INSERT INTO public.star VALUES (6, 'Taurus', 4200, 880000, 1);
INSERT INTO public.star VALUES (7, 'Capricon', 4600, 360000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 32, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

