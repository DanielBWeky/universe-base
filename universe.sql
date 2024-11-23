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
-- Name: asteroide; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroide (
    asteroide_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distancia_solar_mkm numeric(10,2),
    diametro_km numeric(8,2),
    composicion character varying(50),
    descripcion text
);


ALTER TABLE public.asteroide OWNER TO freecodecamp;

--
-- Name: asteroide_asteroide_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroide_asteroide_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroide_asteroide_id_seq OWNER TO freecodecamp;

--
-- Name: asteroide_asteroide_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroide_asteroide_id_seq OWNED BY public.asteroide.asteroide_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(50),
    distance_from_earth_km integer,
    age numeric(20,2),
    description text DEFAULT 'THIS IS A GALAXY'::text
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
    name character varying(30) NOT NULL,
    planet_id integer,
    type character varying(50),
    diametro_km numeric(10,2),
    distacia_planeta_km numeric(10,2),
    periodi_rotacion_horas numeric(8,2)
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
    name character varying(30) NOT NULL,
    star_id integer,
    anillo boolean DEFAULT false,
    number_moons integer,
    type character varying(50),
    diametro_km numeric(10,3),
    is_habitable boolean DEFAULT false
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type character varying(50),
    magnitud numeric(10,3),
    distance numeric(10,3),
    costelacion character varying(50)
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
-- Name: asteroide asteroide_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroide ALTER COLUMN asteroide_id SET DEFAULT nextval('public.asteroide_asteroide_id_seq'::regclass);


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
-- Data for Name: asteroide; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroide VALUES (1, 'Ceres', 413.00, 940.00, 'Hielo y roca', 'Ceres es el asteroide más grande del cinturón de asteroides y es clasificado como un planeta enano.');
INSERT INTO public.asteroide VALUES (2, 'Vesta', 353.00, 525.00, 'Roca y metal', 'Vesta es uno de los cuerpos más grandes del cinturón de asteroides y es conocido por su basaltos y minerales metálicos.');
INSERT INTO public.asteroide VALUES (3, 'Eros', 207.00, 16.80, 'Roca', 'Eros es un asteroide cercano a la Tierra y fue el primer asteroide que fue orbita por una sonda espacial (NEAR Shoemaker).');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 13.60, 'THIS IS A GALAXY');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 10.00, 'THIS IS A GALAXY');
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 'Spiral', 3000000, 5.00, 'THIS IS A GALAXY');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 28000000, 10.00, 'THIS IS A GALAXY');
INSERT INTO public.galaxy VALUES (5, 'Elíptica M87', 'Elíptica', 53000000, 13.20, 'THIS IS A GALAXY');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 23000000, 12.50, 'THIS IS A GALAXY');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 'rocoso', 3474.80, 384400.00, 27.32);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 'rocoso', 22.40, 6000.00, 0.30);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'rocoso', 12.40, 23460.00, 30.30);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'rocoso', 3642.60, 421700.00, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'hielo', 3121.60, 670900.00, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 5, 'rocoso', 5268.20, 1070400.00, 7.15);
INSERT INTO public.moon VALUES (7, 'Calisto', 5, 'rocoso', 4820.60, 1882700.00, 16.69);
INSERT INTO public.moon VALUES (8, 'Titán', 6, 'hielo', 5150.00, 1222000.00, 15.90);
INSERT INTO public.moon VALUES (9, 'Rea', 6, 'rocoso', 1528.60, 527400.00, 24.60);
INSERT INTO public.moon VALUES (10, 'Encélado', 6, 'hielo', 504.20, 238000.00, 33.50);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 'rocoso', 1469.00, 3568000.00, 79.30);
INSERT INTO public.moon VALUES (12, 'Oberón', 7, 'rocoso', 1523.60, 583520.00, 13.20);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 'rocoso', 1577.80, 436300.00, 8.70);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 'rocoso', 1169.00, 265300.00, 10.60);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 'rocoso', 1158.80, 191700.00, 4.15);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 'rocoso', 471.60, 129800.00, 1.41);
INSERT INTO public.moon VALUES (17, 'Tritón', 8, 'hielo', 2706.80, 355000.00, 5.88);
INSERT INTO public.moon VALUES (18, 'Nereida', 8, 'rocoso', 340.00, 580000.00, 11.00);
INSERT INTO public.moon VALUES (19, 'Charon', 9, 'rocoso', 1212.00, 19500.00, 6.39);
INSERT INTO public.moon VALUES (20, 'Betelgax I', 10, 'rocoso', 3000.00, 120000.00, 24.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, false, 0, 'rocoso', 4879.000, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 0, 'rocoso', 12104.000, false);
INSERT INTO public.planet VALUES (4, 'Marte', 1, false, 2, 'rocoso', 6792.000, false);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, true, 79, 'gaseoso', 139822.000, false);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, true, 83, 'gaseoso', 116464.000, false);
INSERT INTO public.planet VALUES (7, 'Urano', 1, true, 27, 'gaseoso', 50724.000, false);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, true, 14, 'gaseoso', 49244.000, false);
INSERT INTO public.planet VALUES (9, 'Plutón', 1, false, 5, 'diminuto', 2376.600, false);
INSERT INTO public.planet VALUES (10, 'Betelgax', 4, false, 1, 'rocoso', 8000.000, false);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, false, 0, 'diminuto', 940.000, false);
INSERT INTO public.planet VALUES (12, 'Haumea', 6, false, 2, 'diminuto', 1960.000, false);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, false, 1, 'rocoso', 12756.320, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G2V', -26.740, 0.000, '-');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A1V', -1.460, 8.600, 'Canis Major');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-M2', 0.580, 642.500, 'Orion');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'B8Ia', 0.180, 863.000, 'Orion');
INSERT INTO public.star VALUES (6, 'Polaris', 1, 'F7Ib-II', 1.970, 431.000, 'Ursa Minor');
INSERT INTO public.star VALUES (7, 'Vega', 1, 'A0V', 0.030, 25.300, 'Lyra');


--
-- Name: asteroide_asteroide_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroide_asteroide_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroide asteroide_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroide
    ADD CONSTRAINT asteroide_name_key UNIQUE (name);


--
-- Name: asteroide asteroide_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroide
    ADD CONSTRAINT asteroide_pkey PRIMARY KEY (asteroide_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon UNIQUE (name);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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

