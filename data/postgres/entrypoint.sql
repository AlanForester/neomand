--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id integer NOT NULL
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    parent_type character varying(255),
    parent_id integer,
    name character varying(255),
    size integer,
    extention character varying(255),
    bucket character varying(255),
    created_at date DEFAULT now(),
    updated_at date
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: COLUMN files.parent_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.files.parent_type IS 'Полиморфный тип связи с таблицей';


--
-- Name: COLUMN files.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.files.parent_id IS 'Полиморфная связь по ID';


--
-- Name: COLUMN files.size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.files.size IS 'Размер файла';


--
-- Name: COLUMN files.extention; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.files.extention IS 'Расширение файла';


--
-- Name: COLUMN files.bucket; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.files.bucket IS 'Корзина файла(Изображение, Документ...)';


--
-- Name: goods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goods (
    id integer NOT NULL
);


ALTER TABLE public.goods OWNER TO postgres;

--
-- Name: harmonization_goods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.harmonization_goods (
    id integer NOT NULL
);


ALTER TABLE public.harmonization_goods OWNER TO postgres;

--
-- Name: harmonizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.harmonizations (
    id integer NOT NULL
);


ALTER TABLE public.harmonizations OWNER TO postgres;

--
-- Name: language_currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language_currencies (
    language_id integer NOT NULL,
    currency_id integer NOT NULL
);


ALTER TABLE public.language_currencies OWNER TO postgres;

--
-- Name: language_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language_providers (
    language_id integer NOT NULL,
    provider_id integer NOT NULL
);


ALTER TABLE public.language_providers OWNER TO postgres;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id integer NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: TABLE notifications; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.notifications IS 'Уведомления';


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: payment_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_providers (
    id integer NOT NULL
);


ALTER TABLE public.payment_providers OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolios (
    id integer NOT NULL
);


ALTER TABLE public.portfolios OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: TABLE roles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.roles IS 'Роли пользователей';


--
-- Name: COLUMN roles.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.id IS 'ID';


--
-- Name: COLUMN roles.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.name IS 'Название роли';


--
-- Name: COLUMN roles.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.roles.code IS 'Код роли';


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: support; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.support (
    id integer NOT NULL
);


ALTER TABLE public.support OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password_hash character varying(255),
    access_token character varying(255),
    token_type character varying(255),
    expires_in integer,
    refresh_token character varying(255),
    auth_type character varying(255),
    name character varying(255),
    last_name character varying(255),
    restore_token character varying(255),
    phone character varying(255),
    role_id integer,
    last_pay date,
    language_id integer,
    bonuses integer,
    balance integer,
    currency_id integer,
    is_superadmin boolean DEFAULT false NOT NULL,
    created_at date DEFAULT now(),
    updated_at date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: TABLE users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.users IS 'Пользователи';


--
-- Name: COLUMN users.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.id IS 'ID';


--
-- Name: COLUMN users.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.email IS 'Email';


--
-- Name: COLUMN users.password_hash; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.password_hash IS 'Пароль хеш';


--
-- Name: COLUMN users.access_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.access_token IS 'Токен доступа JWT';


--
-- Name: COLUMN users.token_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.token_type IS 'Тип OAUTH токена';


--
-- Name: COLUMN users.expires_in; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.expires_in IS 'Время истечения OAUTH токена';


--
-- Name: COLUMN users.refresh_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.refresh_token IS 'Токен для обновления';


--
-- Name: COLUMN users.auth_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.auth_type IS 'Тип авторизации(Email,VK,GMail)';


--
-- Name: COLUMN users.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.name IS 'Имя пользователя';


--
-- Name: COLUMN users.last_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.last_name IS 'Фамилия пользователя';


--
-- Name: COLUMN users.restore_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.restore_token IS 'Токен для восстановления доступа';


--
-- Name: COLUMN users.phone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.phone IS 'Телефон пользователя';


--
-- Name: COLUMN users.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.role_id IS 'ID роли';


--
-- Name: COLUMN users.last_pay; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.last_pay IS 'Дата последней оплаты';


--
-- Name: COLUMN users.language_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.language_id IS 'ID языка';


--
-- Name: COLUMN users.bonuses; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.bonuses IS 'Бонусы';


--
-- Name: COLUMN users.balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.balance IS 'Баланс';


--
-- Name: COLUMN users.currency_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.currency_id IS 'ID валюты';


--
-- Name: COLUMN users.is_superadmin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.is_superadmin IS 'Флаг суперадмина';


--
-- Name: COLUMN users.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.created_at IS 'Дата создания';


--
-- Name: COLUMN users.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.updated_at IS 'Дата обновления';


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, parent_type, parent_id, name, size, extention, bucket, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: goods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goods (id) FROM stdin;
\.


--
-- Data for Name: harmonization_goods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.harmonization_goods (id) FROM stdin;
\.


--
-- Data for Name: harmonizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.harmonizations (id) FROM stdin;
\.


--
-- Data for Name: language_currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language_currencies (language_id, currency_id) FROM stdin;
\.


--
-- Data for Name: language_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language_providers (language_id, provider_id) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id) FROM stdin;
\.


--
-- Data for Name: payment_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_providers (id) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id) FROM stdin;
\.


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolios (id) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, code) FROM stdin;
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id) FROM stdin;
\.


--
-- Data for Name: support; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.support (id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password_hash, access_token, token_type, expires_in, refresh_token, auth_type, name, last_name, restore_token, phone, role_id, last_pay, language_id, bonuses, balance, currency_id, is_superadmin, created_at, updated_at) FROM stdin;
\.


--
-- Name: currencies currencies_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pk PRIMARY KEY (id);


--
-- Name: files files_parent_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_parent_pk2 UNIQUE (parent_id, parent_type);


--
-- Name: CONSTRAINT files_parent_pk2 ON files; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT files_parent_pk2 ON public.files IS 'Родительская связь';


--
-- Name: files files_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pk PRIMARY KEY (id);


--
-- Name: goods goods_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goods
    ADD CONSTRAINT goods_pk PRIMARY KEY (id);


--
-- Name: harmonization_goods harmonization_goods_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.harmonization_goods
    ADD CONSTRAINT harmonization_goods_pk PRIMARY KEY (id);


--
-- Name: harmonizations harmonizations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.harmonizations
    ADD CONSTRAINT harmonizations_pk PRIMARY KEY (id);


--
-- Name: language_currencies language_currencies_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language_currencies
    ADD CONSTRAINT language_currencies_pk PRIMARY KEY (currency_id, language_id);


--
-- Name: language_providers language_providers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language_providers
    ADD CONSTRAINT language_providers_pk PRIMARY KEY (language_id, provider_id);


--
-- Name: languages languages_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pk PRIMARY KEY (id);


--
-- Name: notifications notifications_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pk PRIMARY KEY (id);


--
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (id);


--
-- Name: payment_providers payment_providers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_providers
    ADD CONSTRAINT payment_providers_pk PRIMARY KEY (id);


--
-- Name: payments payments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pk PRIMARY KEY (id);


--
-- Name: portfolios portfolios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pk PRIMARY KEY (id);


--
-- Name: projects projects_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pk PRIMARY KEY (id);


--
-- Name: roles roles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id);


--
-- Name: services services_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pk PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pk PRIMARY KEY (id);


--
-- Name: support support_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.support
    ADD CONSTRAINT support_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: language_currencies language_currencies_currencies_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language_currencies
    ADD CONSTRAINT language_currencies_currencies_id_fk FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: language_currencies language_currencies_languages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language_currencies
    ADD CONSTRAINT language_currencies_languages_id_fk FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: language_providers language_providers_languages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language_providers
    ADD CONSTRAINT language_providers_languages_id_fk FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: language_providers language_providers_payment_providers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language_providers
    ADD CONSTRAINT language_providers_payment_providers_id_fk FOREIGN KEY (provider_id) REFERENCES public.payment_providers(id);


--
-- Name: users users_currencies_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_currencies_id_fk FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: CONSTRAINT users_currencies_id_fk ON users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT users_currencies_id_fk ON public.users IS 'Ссылка на валюту';


--
-- Name: users users_languages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_languages_id_fk FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: CONSTRAINT users_languages_id_fk ON users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT users_languages_id_fk ON public.users IS 'Ссылка на язык';


--
-- Name: users users_roles_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roles_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: CONSTRAINT users_roles_id_fk ON users; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT users_roles_id_fk ON public.users IS 'Ссылка на роль';


--
-- PostgreSQL database dump complete
--

