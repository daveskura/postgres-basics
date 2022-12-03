--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: _keydemo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA _keydemo;


ALTER SCHEMA _keydemo OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: _keydemo; Owner: dave
--

CREATE TABLE _keydemo.customer (
    customer_id integer NOT NULL,
    customer_name character varying(250)
);


ALTER TABLE _keydemo.customer OWNER TO dave;

--
-- Name: products; Type: TABLE; Schema: _keydemo; Owner: dave
--

CREATE TABLE _keydemo.products (
    product_id integer NOT NULL,
    product_name character varying(250)
);


ALTER TABLE _keydemo.products OWNER TO dave;

--
-- Name: sales; Type: TABLE; Schema: _keydemo; Owner: dave
--

CREATE TABLE _keydemo.sales (
    invoice_nbr integer,
    product_id integer,
    customer_id integer,
    saleamt numeric(8,3)
);


ALTER TABLE _keydemo.sales OWNER TO dave;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: _keydemo; Owner: dave
--

COPY _keydemo.customer (customer_id, customer_name) FROM stdin;
701	Larry
702	Curly
703	Moe
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: _keydemo; Owner: dave
--

COPY _keydemo.products (product_id, product_name) FROM stdin;
1001	hat
1002	gloves
1003	shoes
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: _keydemo; Owner: dave
--

COPY _keydemo.sales (invoice_nbr, product_id, customer_id, saleamt) FROM stdin;
20020212	1001	701	0.970
20020212	1002	701	2.990
20020212	1003	701	12.010
\.


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: _keydemo; Owner: dave
--

ALTER TABLE ONLY _keydemo.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: _keydemo; Owner: dave
--

ALTER TABLE ONLY _keydemo.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: _keydemo; Owner: dave
--

ALTER TABLE ONLY _keydemo.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES _keydemo.customer(customer_id);


--
-- Name: sales sales_product_id_fkey; Type: FK CONSTRAINT; Schema: _keydemo; Owner: dave
--

ALTER TABLE ONLY _keydemo.sales
    ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES _keydemo.products(product_id);


--
-- Name: SCHEMA _keydemo; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA _keydemo TO keydemo_users;


--
-- PostgreSQL database dump complete
--

