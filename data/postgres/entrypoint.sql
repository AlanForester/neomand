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
    id integer NOT NULL,
    name character varying,
    code character varying
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: COLUMN currencies.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.currencies.name IS 'Название валюты';


--
-- Name: COLUMN currencies.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.currencies.code IS 'Код валюты для ПП';


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    parent_type character varying(255),
    parent_id integer,
    name character varying(255),
    size integer,
    extension character varying(255),
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
-- Name: COLUMN files.extension; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.files.extension IS 'Расширение файла';


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
    id integer NOT NULL,
    type character varying,
    "to" character varying,
    user_id integer,
    status smallint,
    error text,
    created_at date
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: TABLE notifications; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.notifications IS 'Уведомления';


--
-- Name: COLUMN notifications.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.notifications.type IS 'Тип отправляемого сообщения';


--
-- Name: COLUMN notifications."to"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.notifications."to" IS 'Адресат';


--
-- Name: COLUMN notifications.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.notifications.user_id IS 'ID пользователя';


--
-- Name: COLUMN notifications.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.notifications.status IS 'Статус отправки';


--
-- Name: COLUMN notifications.error; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.notifications.error IS 'Ошибка';


--
-- Name: COLUMN notifications.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.notifications.created_at IS 'Дата отправки';


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    document_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: COLUMN orders.document_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.orders.document_id IS 'Документ';


--
-- Name: payment_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_providers (
    id integer NOT NULL,
    name character varying,
    url text
);


ALTER TABLE public.payment_providers OWNER TO postgres;

--
-- Name: COLUMN payment_providers.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payment_providers.name IS 'Название провайдера';


--
-- Name: COLUMN payment_providers.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payment_providers.url IS 'URL для редиректа пользователя(С кредами)';


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    provider_id integer,
    currency_id integer,
    sum double precision,
    payment_token text,
    status smallint,
    error text,
    payed_at date,
    created_at date,
    user_id integer,
    document_id integer
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: COLUMN payments.provider_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.provider_id IS 'ID провайдера';


--
-- Name: COLUMN payments.currency_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.currency_id IS 'ID валюты';


--
-- Name: COLUMN payments.sum; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.sum IS 'Сумма';


--
-- Name: COLUMN payments.payment_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.payment_token IS 'Токен на оплату(Заранее сгенеренный если есть)';


--
-- Name: COLUMN payments.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.status IS 'Статус оплаты';


--
-- Name: COLUMN payments.error; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.error IS 'Ошибка(Если есть)';


--
-- Name: COLUMN payments.payed_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.payed_at IS 'Дата успешной оплаты';


--
-- Name: COLUMN payments.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.created_at IS 'Дата создания';


--
-- Name: COLUMN payments.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.user_id IS 'ID пользователя';


--
-- Name: COLUMN payments.document_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.payments.document_id IS 'ID документа';


--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolios (
    id integer NOT NULL,
    user_id integer,
    name character varying,
    description text,
    is_public boolean DEFAULT true NOT NULL,
    created_at date DEFAULT now(),
    updated_at date
);


ALTER TABLE public.portfolios OWNER TO postgres;

--
-- Name: COLUMN portfolios.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.portfolios.user_id IS 'ID пользователя';


--
-- Name: COLUMN portfolios.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.portfolios.name IS 'Название';


--
-- Name: COLUMN portfolios.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.portfolios.description IS 'Описание';


--
-- Name: COLUMN portfolios.is_public; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.portfolios.is_public IS 'Является публичным';


--
-- Name: COLUMN portfolios.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.portfolios.created_at IS 'Дата создания';


--
-- Name: COLUMN portfolios.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.portfolios.updated_at IS 'Дата обновления';


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

COPY public.currencies (id, name, code) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, parent_type, parent_id, name, size, extension, bucket, created_at, updated_at) FROM stdin;
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

COPY public.notifications (id, type, "to", user_id, status, error, created_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, document_id) FROM stdin;
\.


--
-- Data for Name: payment_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_providers (id, name, url) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, provider_id, currency_id, sum, payment_token, status, error, payed_at, created_at, user_id, document_id) FROM stdin;
\.


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolios (id, user_id, name, description, is_public, created_at, updated_at) FROM stdin;
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
-- Name: payments document_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT document_id FOREIGN KEY (document_id) REFERENCES public.files(id);


--
-- Name: CONSTRAINT document_id ON payments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT document_id ON public.payments IS 'Ссылка на документ';


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
-- Name: notifications notifications_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: CONSTRAINT notifications_users_id_fk ON notifications; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT notifications_users_id_fk ON public.notifications IS 'Ссылка на пользователя';


--
-- Name: orders orders_files_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_files_id_fk FOREIGN KEY (document_id) REFERENCES public.files(id);


--
-- Name: payments payments_currencies_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_currencies_id_fk FOREIGN KEY (currency_id) REFERENCES public.currencies(id);


--
-- Name: CONSTRAINT payments_currencies_id_fk ON payments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT payments_currencies_id_fk ON public.payments IS 'Ссылка на валюту';


--
-- Name: payments payments_payment_providers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_payment_providers_id_fk FOREIGN KEY (provider_id) REFERENCES public.payment_providers(id);


--
-- Name: CONSTRAINT payments_payment_providers_id_fk ON payments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT payments_payment_providers_id_fk ON public.payments IS 'Ссылка на  провайдера ПП';


--
-- Name: payments payments_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: CONSTRAINT payments_users_id_fk ON payments; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT payments_users_id_fk ON public.payments IS 'Ссылка на плательщика';


--
-- Name: portfolios portfolios_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: CONSTRAINT portfolios_users_id_fk ON portfolios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT portfolios_users_id_fk ON public.portfolios IS 'Ссылка на пользователя';


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

