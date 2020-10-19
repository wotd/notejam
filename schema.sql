--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.19
-- Dumped by pg_dump version 9.6.19

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: note; Type: TABLE; Schema: public; Owner: notejam
--

CREATE TABLE public.note (
    id integer NOT NULL,
    name character varying(100),
    text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    pad_id integer
);


ALTER TABLE public.note OWNER TO notejam;

--
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: notejam
--

CREATE SEQUENCE public.note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_id_seq OWNER TO notejam;

--
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: notejam
--

ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;


--
-- Name: pad; Type: TABLE; Schema: public; Owner: notejam
--

CREATE TABLE public.pad (
    id integer NOT NULL,
    name character varying(100),
    user_id integer
);


ALTER TABLE public.pad OWNER TO notejam;

--
-- Name: pad_id_seq; Type: SEQUENCE; Schema: public; Owner: notejam
--

CREATE SEQUENCE public.pad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pad_id_seq OWNER TO notejam;

--
-- Name: pad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: notejam
--

ALTER SEQUENCE public.pad_id_seq OWNED BY public.pad.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: notejam
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(120),
    password character varying(100)
);


ALTER TABLE public."user" OWNER TO notejam;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: notejam
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO notejam;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: notejam
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: note id; Type: DEFAULT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);


--
-- Name: pad id; Type: DEFAULT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.pad ALTER COLUMN id SET DEFAULT nextval('public.pad_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: notejam
--

COPY public.note (id, name, text, created_at, updated_at, user_id, pad_id) FROM stdin;
\.


--
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: notejam
--

SELECT pg_catalog.setval('public.note_id_seq', 1, false);


--
-- Data for Name: pad; Type: TABLE DATA; Schema: public; Owner: notejam
--

COPY public.pad (id, name, user_id) FROM stdin;
\.


--
-- Name: pad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: notejam
--

SELECT pg_catalog.setval('public.pad_id_seq', 1, false);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: notejam
--

COPY public."user" (id, email, password) FROM stdin;
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: notejam
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: pad pad_pkey; Type: CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.pad
    ADD CONSTRAINT pad_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: note note_pad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pad_id_fkey FOREIGN KEY (pad_id) REFERENCES public.pad(id);


--
-- Name: note note_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: pad pad_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: notejam
--

ALTER TABLE ONLY public.pad
    ADD CONSTRAINT pad_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

