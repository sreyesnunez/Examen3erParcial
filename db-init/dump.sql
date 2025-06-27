--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.9

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
-- Name: dim_empleado; Type: TABLE; Schema: public; Owner: tiendita_user
--

CREATE TABLE public.dim_empleado (
    id integer NOT NULL,
    nombre character varying(100),
    rol character varying(50),
    turno character varying(20)
);


ALTER TABLE public.dim_empleado OWNER TO tiendita_user;

--
-- Name: dim_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: tiendita_user
--

CREATE SEQUENCE public.dim_empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_empleado_id_seq OWNER TO tiendita_user;

--
-- Name: dim_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiendita_user
--

ALTER SEQUENCE public.dim_empleado_id_seq OWNED BY public.dim_empleado.id;


--
-- Name: dim_producto; Type: TABLE; Schema: public; Owner: tiendita_user
--

CREATE TABLE public.dim_producto (
    id integer NOT NULL,
    nombre character varying(100),
    codigo character varying(50),
    categoria character varying(50),
    marca character varying(50),
    presentacion character varying(50),
    unidad_medida character varying(20)
);


ALTER TABLE public.dim_producto OWNER TO tiendita_user;

--
-- Name: dim_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: tiendita_user
--

CREATE SEQUENCE public.dim_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_producto_id_seq OWNER TO tiendita_user;

--
-- Name: dim_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiendita_user
--

ALTER SEQUENCE public.dim_producto_id_seq OWNED BY public.dim_producto.id;


--
-- Name: dim_proveedor; Type: TABLE; Schema: public; Owner: tiendita_user
--

CREATE TABLE public.dim_proveedor (
    id integer NOT NULL,
    nombre character varying(100),
    tipo character varying(50),
    telefono character varying(20),
    correo character varying(50)
);


ALTER TABLE public.dim_proveedor OWNER TO tiendita_user;

--
-- Name: dim_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: tiendita_user
--

CREATE SEQUENCE public.dim_proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_proveedor_id_seq OWNER TO tiendita_user;

--
-- Name: dim_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiendita_user
--

ALTER SEQUENCE public.dim_proveedor_id_seq OWNED BY public.dim_proveedor.id;


--
-- Name: dim_tiempo; Type: TABLE; Schema: public; Owner: tiendita_user
--

CREATE TABLE public.dim_tiempo (
    id integer NOT NULL,
    fecha date,
    dia_semana character varying(20),
    mes integer,
    anio integer,
    trimestre integer,
    semana integer,
    festivo boolean
);


ALTER TABLE public.dim_tiempo OWNER TO tiendita_user;

--
-- Name: dim_tiempo_id_seq; Type: SEQUENCE; Schema: public; Owner: tiendita_user
--

CREATE SEQUENCE public.dim_tiempo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tiempo_id_seq OWNER TO tiendita_user;

--
-- Name: dim_tiempo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiendita_user
--

ALTER SEQUENCE public.dim_tiempo_id_seq OWNED BY public.dim_tiempo.id;


--
-- Name: dim_tienda; Type: TABLE; Schema: public; Owner: tiendita_user
--

CREATE TABLE public.dim_tienda (
    id integer NOT NULL,
    nombre character varying(100),
    ubicacion character varying(100),
    superficie integer
);


ALTER TABLE public.dim_tienda OWNER TO tiendita_user;

--
-- Name: dim_tienda_id_seq; Type: SEQUENCE; Schema: public; Owner: tiendita_user
--

CREATE SEQUENCE public.dim_tienda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tienda_id_seq OWNER TO tiendita_user;

--
-- Name: dim_tienda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiendita_user
--

ALTER SEQUENCE public.dim_tienda_id_seq OWNED BY public.dim_tienda.id;


--
-- Name: hecho_transaccion_inventario; Type: TABLE; Schema: public; Owner: tiendita_user
--

CREATE TABLE public.hecho_transaccion_inventario (
    id integer NOT NULL,
    fecha_id integer,
    producto_id integer,
    proveedor_id integer,
    tienda_id integer,
    empleado_id integer,
    tipo_transaccion character varying(20),
    cantidad integer,
    valor_unitario numeric(10,2),
    valor_total numeric(12,2)
);


ALTER TABLE public.hecho_transaccion_inventario OWNER TO tiendita_user;

--
-- Name: hecho_transaccion_inventario_id_seq; Type: SEQUENCE; Schema: public; Owner: tiendita_user
--

CREATE SEQUENCE public.hecho_transaccion_inventario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hecho_transaccion_inventario_id_seq OWNER TO tiendita_user;

--
-- Name: hecho_transaccion_inventario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tiendita_user
--

ALTER SEQUENCE public.hecho_transaccion_inventario_id_seq OWNED BY public.hecho_transaccion_inventario.id;


--
-- Name: dim_empleado id; Type: DEFAULT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_empleado ALTER COLUMN id SET DEFAULT nextval('public.dim_empleado_id_seq'::regclass);


--
-- Name: dim_producto id; Type: DEFAULT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_producto ALTER COLUMN id SET DEFAULT nextval('public.dim_producto_id_seq'::regclass);


--
-- Name: dim_proveedor id; Type: DEFAULT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_proveedor ALTER COLUMN id SET DEFAULT nextval('public.dim_proveedor_id_seq'::regclass);


--
-- Name: dim_tiempo id; Type: DEFAULT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_tiempo ALTER COLUMN id SET DEFAULT nextval('public.dim_tiempo_id_seq'::regclass);


--
-- Name: dim_tienda id; Type: DEFAULT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_tienda ALTER COLUMN id SET DEFAULT nextval('public.dim_tienda_id_seq'::regclass);


--
-- Name: hecho_transaccion_inventario id; Type: DEFAULT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario ALTER COLUMN id SET DEFAULT nextval('public.hecho_transaccion_inventario_id_seq'::regclass);


--
-- Data for Name: dim_empleado; Type: TABLE DATA; Schema: public; Owner: tiendita_user
--

COPY public.dim_empleado (id, nombre, rol, turno) FROM stdin;
1	José Martínez	Cajero	Mañana
2	Ana López	Cajero	Tarde
3	Mario Ruiz	Encargado	Mañana
4	Sofía Vargas	Supervisor	Tarde
5	Pedro Torres	Auxiliar	Noche
\.


--
-- Data for Name: dim_producto; Type: TABLE DATA; Schema: public; Owner: tiendita_user
--

COPY public.dim_producto (id, nombre, codigo, categoria, marca, presentacion, unidad_medida) FROM stdin;
1	Producto_001	PRD001	Dulces	Gamesa	Paquete 100g	g
2	Producto_002	PRD002	Lácteos	Lala	Sobre 10g	kg
3	Producto_003	PRD003	Congelados	Nestlé	Lata 355ml	ml
4	Producto_004	PRD004	Panadería	Bimbo	Paquete 100g	g
5	Producto_005	PRD005	Lácteos	Lala	Paquete 100g	pz
6	Producto_006	PRD006	Abarrotes	La Moderna	Bolsa 50g	kg
7	Producto_007	PRD007	Congelados	Nestlé	Bolsa 50g	kg
8	Producto_008	PRD008	Bebidas	CocaCola	Botella 1L	ml
9	Producto_009	PRD009	Bebidas	CocaCola	Sobre 10g	g
10	Producto_010	PRD010	Snacks	Barcel	Paquete 100g	ml
11	Producto_011	PRD011	Cereales	Kelloggs	Paquete 500g	kg
12	Producto_012	PRD012	Dulces	Gamesa	Caja 250g	ml
13	Producto_013	PRD013	Congelados	Nestlé	Paquete 100g	kg
14	Producto_014	PRD014	Dulces	Gamesa	Paquete 100g	L
15	Producto_015	PRD015	Limpieza	Cloralex	Paquete 100g	pz
16	Producto_016	PRD016	Abarrotes	La Moderna	Sobre 10g	pz
17	Producto_017	PRD017	Cereales	Kelloggs	Botella 1L	ml
18	Producto_018	PRD018	Panadería	Bimbo	Envase 2L	L
19	Producto_019	PRD019	Bebidas	CocaCola	Paquete 100g	L
20	Producto_020	PRD020	Limpieza	Cloralex	Lata 355ml	ml
21	Producto_021	PRD021	Abarrotes	La Moderna	Lata 355ml	L
22	Producto_022	PRD022	Snacks	Barcel	Botella 1L	ml
23	Producto_023	PRD023	Congelados	Nestlé	Paquete 500g	L
24	Producto_024	PRD024	Bebidas	CocaCola	Paquete 500g	ml
25	Producto_025	PRD025	Snacks	Barcel	Envase 2L	L
26	Producto_026	PRD026	Dulces	Gamesa	Lata 355ml	L
27	Producto_027	PRD027	Bebidas	CocaCola	Botella 1L	pz
28	Producto_028	PRD028	Botanas	Sabritas	Lata 355ml	L
29	Producto_029	PRD029	Cereales	Kelloggs	Envase 2L	kg
30	Producto_030	PRD030	Bebidas	CocaCola	Caja 250g	L
31	Producto_031	PRD031	Snacks	Barcel	Paquete 100g	pz
32	Producto_032	PRD032	Abarrotes	La Moderna	Paquete 500g	L
33	Producto_033	PRD033	Congelados	Nestlé	Sobre 10g	L
34	Producto_034	PRD034	Panadería	Bimbo	Paquete 500g	g
35	Producto_035	PRD035	Lácteos	Lala	Lata 355ml	pz
36	Producto_036	PRD036	Snacks	Barcel	Envase 2L	ml
37	Producto_037	PRD037	Bebidas	CocaCola	Paquete 100g	ml
38	Producto_038	PRD038	Dulces	Gamesa	Paquete 500g	kg
39	Producto_039	PRD039	Dulces	Gamesa	Caja 250g	g
40	Producto_040	PRD040	Botanas	Sabritas	Bolsa 50g	g
41	Producto_041	PRD041	Congelados	Nestlé	Paquete 100g	kg
42	Producto_042	PRD042	Snacks	Barcel	Botella 1L	ml
43	Producto_043	PRD043	Botanas	Sabritas	Paquete 100g	g
44	Producto_044	PRD044	Congelados	Nestlé	Botella 1L	g
45	Producto_045	PRD045	Abarrotes	La Moderna	Paquete 100g	ml
46	Producto_046	PRD046	Lácteos	Lala	Envase 2L	L
47	Producto_047	PRD047	Snacks	Barcel	Envase 2L	kg
48	Producto_048	PRD048	Congelados	Nestlé	Sobre 10g	g
49	Producto_049	PRD049	Bebidas	CocaCola	Sobre 10g	L
50	Producto_050	PRD050	Panadería	Bimbo	Botella 1L	g
51	Producto_051	PRD051	Panadería	Bimbo	Bolsa 50g	L
52	Producto_052	PRD052	Bebidas	CocaCola	Envase 2L	g
53	Producto_053	PRD053	Panadería	Bimbo	Caja 250g	pz
54	Producto_054	PRD054	Botanas	Sabritas	Bolsa 50g	pz
55	Producto_055	PRD055	Abarrotes	La Moderna	Caja 250g	ml
56	Producto_056	PRD056	Abarrotes	La Moderna	Caja 250g	pz
57	Producto_057	PRD057	Cereales	Kelloggs	Lata 355ml	ml
58	Producto_058	PRD058	Botanas	Sabritas	Caja 250g	pz
59	Producto_059	PRD059	Bebidas	CocaCola	Caja 250g	kg
60	Producto_060	PRD060	Lácteos	Lala	Lata 355ml	g
61	Producto_061	PRD061	Dulces	Gamesa	Bolsa 50g	g
62	Producto_062	PRD062	Limpieza	Cloralex	Sobre 10g	g
63	Producto_063	PRD063	Bebidas	CocaCola	Envase 2L	L
64	Producto_064	PRD064	Botanas	Sabritas	Bolsa 50g	pz
65	Producto_065	PRD065	Panadería	Bimbo	Botella 1L	g
66	Producto_066	PRD066	Bebidas	CocaCola	Caja 250g	g
67	Producto_067	PRD067	Abarrotes	La Moderna	Paquete 100g	pz
68	Producto_068	PRD068	Cereales	Kelloggs	Caja 250g	g
69	Producto_069	PRD069	Cereales	Kelloggs	Lata 355ml	ml
70	Producto_070	PRD070	Lácteos	Lala	Sobre 10g	L
71	Producto_071	PRD071	Lácteos	Lala	Paquete 500g	ml
72	Producto_072	PRD072	Panadería	Bimbo	Paquete 100g	ml
73	Producto_073	PRD073	Botanas	Sabritas	Envase 2L	pz
74	Producto_074	PRD074	Congelados	Nestlé	Bolsa 50g	kg
75	Producto_075	PRD075	Bebidas	CocaCola	Paquete 100g	g
76	Producto_076	PRD076	Panadería	Bimbo	Sobre 10g	pz
77	Producto_077	PRD077	Botanas	Sabritas	Lata 355ml	pz
78	Producto_078	PRD078	Panadería	Bimbo	Envase 2L	kg
79	Producto_079	PRD079	Dulces	Gamesa	Bolsa 50g	kg
80	Producto_080	PRD080	Cereales	Kelloggs	Bolsa 50g	ml
81	Producto_081	PRD081	Lácteos	Lala	Paquete 100g	L
82	Producto_082	PRD082	Snacks	Barcel	Bolsa 50g	kg
83	Producto_083	PRD083	Abarrotes	La Moderna	Botella 1L	pz
84	Producto_084	PRD084	Botanas	Sabritas	Sobre 10g	g
85	Producto_085	PRD085	Limpieza	Cloralex	Paquete 100g	ml
86	Producto_086	PRD086	Snacks	Barcel	Paquete 100g	g
87	Producto_087	PRD087	Cereales	Kelloggs	Bolsa 50g	kg
88	Producto_088	PRD088	Bebidas	CocaCola	Lata 355ml	L
89	Producto_089	PRD089	Congelados	Nestlé	Envase 2L	g
90	Producto_090	PRD090	Limpieza	Cloralex	Lata 355ml	ml
91	Producto_091	PRD091	Congelados	Nestlé	Envase 2L	ml
92	Producto_092	PRD092	Congelados	Nestlé	Sobre 10g	pz
93	Producto_093	PRD093	Dulces	Gamesa	Caja 250g	g
94	Producto_094	PRD094	Botanas	Sabritas	Botella 1L	g
95	Producto_095	PRD095	Panadería	Bimbo	Envase 2L	kg
96	Producto_096	PRD096	Congelados	Nestlé	Paquete 500g	ml
97	Producto_097	PRD097	Lácteos	Lala	Envase 2L	L
98	Producto_098	PRD098	Congelados	Nestlé	Sobre 10g	pz
99	Producto_099	PRD099	Lácteos	Lala	Botella 1L	pz
100	Producto_100	PRD100	Botanas	Sabritas	Paquete 100g	g
\.


--
-- Data for Name: dim_proveedor; Type: TABLE DATA; Schema: public; Owner: tiendita_user
--

COPY public.dim_proveedor (id, nombre, tipo, telefono, correo) FROM stdin;
1	Proveedor_01	Congelados	5555749710	contacto01@proveedor.com
2	Proveedor_02	Snacks	5555163972	contacto02@proveedor.com
3	Proveedor_03	Lácteos	5559928907	contacto03@proveedor.com
4	Proveedor_04	Abarrotes	5557165655	contacto04@proveedor.com
5	Proveedor_05	Snacks	5555513616	contacto05@proveedor.com
6	Proveedor_06	Congelados	5557562076	contacto06@proveedor.com
7	Proveedor_07	Granos	5553075213	contacto07@proveedor.com
8	Proveedor_08	Lácteos	5557549883	contacto08@proveedor.com
9	Proveedor_09	Botanas	5554993361	contacto09@proveedor.com
10	Proveedor_10	Congelados	5552271638	contacto10@proveedor.com
11	Proveedor_11	Panadería	5555265770	contacto11@proveedor.com
12	Proveedor_12	Limpieza	5554790887	contacto12@proveedor.com
13	Proveedor_13	Limpieza	5552269976	contacto13@proveedor.com
14	Proveedor_14	Congelados	5553644538	contacto14@proveedor.com
15	Proveedor_15	Snacks	5558767973	contacto15@proveedor.com
16	Proveedor_16	Lácteos	5557457372	contacto16@proveedor.com
17	Proveedor_17	Congelados	5558076550	contacto17@proveedor.com
18	Proveedor_18	Lácteos	5551726715	contacto18@proveedor.com
19	Proveedor_19	Limpieza	5556974509	contacto19@proveedor.com
20	Proveedor_20	Botanas	5552621626	contacto20@proveedor.com
\.


--
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: public; Owner: tiendita_user
--

COPY public.dim_tiempo (id, fecha, dia_semana, mes, anio, trimestre, semana, festivo) FROM stdin;
1	2024-01-01	Lunes	1	2024	1	1	f
2	2024-01-02	Martes	1	2024	1	1	f
3	2024-01-03	Miércoles	1	2024	1	1	f
4	2024-01-04	Jueves	1	2024	1	1	f
5	2024-01-05	Viernes	1	2024	1	1	f
6	2024-01-06	Sábado	1	2024	1	1	f
7	2024-01-07	Domingo	1	2024	1	1	t
8	2024-01-08	Lunes	1	2024	1	2	f
9	2024-01-09	Martes	1	2024	1	2	f
10	2024-01-10	Miércoles	1	2024	1	2	f
11	2024-01-11	Jueves	1	2024	1	2	f
12	2024-01-12	Viernes	1	2024	1	2	f
13	2024-01-13	Sábado	1	2024	1	2	f
14	2024-01-14	Domingo	1	2024	1	2	t
15	2024-01-15	Lunes	1	2024	1	3	f
16	2024-01-16	Martes	1	2024	1	3	f
17	2024-01-17	Miércoles	1	2024	1	3	f
18	2024-01-18	Jueves	1	2024	1	3	f
19	2024-01-19	Viernes	1	2024	1	3	f
20	2024-01-20	Sábado	1	2024	1	3	f
21	2024-01-21	Domingo	1	2024	1	3	t
22	2024-01-22	Lunes	1	2024	1	4	f
23	2024-01-23	Martes	1	2024	1	4	f
24	2024-01-24	Miércoles	1	2024	1	4	f
25	2024-01-25	Jueves	1	2024	1	4	f
26	2024-01-26	Viernes	1	2024	1	4	f
27	2024-01-27	Sábado	1	2024	1	4	f
28	2024-01-28	Domingo	1	2024	1	4	t
29	2024-01-29	Lunes	1	2024	1	5	f
30	2024-01-30	Martes	1	2024	1	5	f
31	2024-01-31	Miércoles	1	2024	1	5	f
32	2024-02-01	Jueves	2	2024	1	5	f
33	2024-02-02	Viernes	2	2024	1	5	f
34	2024-02-03	Sábado	2	2024	1	5	f
35	2024-02-04	Domingo	2	2024	1	5	t
36	2024-02-05	Lunes	2	2024	1	6	f
37	2024-02-06	Martes	2	2024	1	6	f
38	2024-02-07	Miércoles	2	2024	1	6	f
39	2024-02-08	Jueves	2	2024	1	6	f
40	2024-02-09	Viernes	2	2024	1	6	f
41	2024-02-10	Sábado	2	2024	1	6	f
42	2024-02-11	Domingo	2	2024	1	6	t
43	2024-02-12	Lunes	2	2024	1	7	f
44	2024-02-13	Martes	2	2024	1	7	f
45	2024-02-14	Miércoles	2	2024	1	7	f
46	2024-02-15	Jueves	2	2024	1	7	f
47	2024-02-16	Viernes	2	2024	1	7	f
48	2024-02-17	Sábado	2	2024	1	7	f
49	2024-02-18	Domingo	2	2024	1	7	t
50	2024-02-19	Lunes	2	2024	1	8	f
51	2024-02-20	Martes	2	2024	1	8	f
52	2024-02-21	Miércoles	2	2024	1	8	f
53	2024-02-22	Jueves	2	2024	1	8	f
54	2024-02-23	Viernes	2	2024	1	8	f
55	2024-02-24	Sábado	2	2024	1	8	f
56	2024-02-25	Domingo	2	2024	1	8	t
57	2024-02-26	Lunes	2	2024	1	9	f
58	2024-02-27	Martes	2	2024	1	9	f
59	2024-02-28	Miércoles	2	2024	1	9	f
60	2024-02-29	Jueves	2	2024	1	9	f
61	2024-03-01	Viernes	3	2024	1	9	f
62	2024-03-02	Sábado	3	2024	1	9	f
63	2024-03-03	Domingo	3	2024	1	9	t
64	2024-03-04	Lunes	3	2024	1	10	f
65	2024-03-05	Martes	3	2024	1	10	f
66	2024-03-06	Miércoles	3	2024	1	10	f
67	2024-03-07	Jueves	3	2024	1	10	f
68	2024-03-08	Viernes	3	2024	1	10	f
69	2024-03-09	Sábado	3	2024	1	10	f
70	2024-03-10	Domingo	3	2024	1	10	t
71	2024-03-11	Lunes	3	2024	1	11	f
72	2024-03-12	Martes	3	2024	1	11	f
73	2024-03-13	Miércoles	3	2024	1	11	f
74	2024-03-14	Jueves	3	2024	1	11	f
75	2024-03-15	Viernes	3	2024	1	11	f
76	2024-03-16	Sábado	3	2024	1	11	f
77	2024-03-17	Domingo	3	2024	1	11	t
78	2024-03-18	Lunes	3	2024	1	12	f
79	2024-03-19	Martes	3	2024	1	12	f
80	2024-03-20	Miércoles	3	2024	1	12	f
81	2024-03-21	Jueves	3	2024	1	12	f
82	2024-03-22	Viernes	3	2024	1	12	f
83	2024-03-23	Sábado	3	2024	1	12	f
84	2024-03-24	Domingo	3	2024	1	12	t
85	2024-03-25	Lunes	3	2024	1	13	f
86	2024-03-26	Martes	3	2024	1	13	f
87	2024-03-27	Miércoles	3	2024	1	13	f
88	2024-03-28	Jueves	3	2024	1	13	f
89	2024-03-29	Viernes	3	2024	1	13	f
90	2024-03-30	Sábado	3	2024	1	13	f
91	2024-03-31	Domingo	3	2024	1	13	t
92	2024-04-01	Lunes	4	2024	2	14	f
93	2024-04-02	Martes	4	2024	2	14	f
94	2024-04-03	Miércoles	4	2024	2	14	f
95	2024-04-04	Jueves	4	2024	2	14	f
96	2024-04-05	Viernes	4	2024	2	14	f
97	2024-04-06	Sábado	4	2024	2	14	f
98	2024-04-07	Domingo	4	2024	2	14	t
99	2024-04-08	Lunes	4	2024	2	15	f
100	2024-04-09	Martes	4	2024	2	15	f
101	2024-04-10	Miércoles	4	2024	2	15	f
102	2024-04-11	Jueves	4	2024	2	15	f
103	2024-04-12	Viernes	4	2024	2	15	f
104	2024-04-13	Sábado	4	2024	2	15	f
105	2024-04-14	Domingo	4	2024	2	15	t
106	2024-04-15	Lunes	4	2024	2	16	f
107	2024-04-16	Martes	4	2024	2	16	f
108	2024-04-17	Miércoles	4	2024	2	16	f
109	2024-04-18	Jueves	4	2024	2	16	f
110	2024-04-19	Viernes	4	2024	2	16	f
111	2024-04-20	Sábado	4	2024	2	16	f
112	2024-04-21	Domingo	4	2024	2	16	t
113	2024-04-22	Lunes	4	2024	2	17	f
114	2024-04-23	Martes	4	2024	2	17	f
115	2024-04-24	Miércoles	4	2024	2	17	f
116	2024-04-25	Jueves	4	2024	2	17	f
117	2024-04-26	Viernes	4	2024	2	17	f
118	2024-04-27	Sábado	4	2024	2	17	f
119	2024-04-28	Domingo	4	2024	2	17	t
120	2024-04-29	Lunes	4	2024	2	18	f
121	2024-04-30	Martes	4	2024	2	18	f
122	2024-05-01	Miércoles	5	2024	2	18	f
123	2024-05-02	Jueves	5	2024	2	18	f
124	2024-05-03	Viernes	5	2024	2	18	f
125	2024-05-04	Sábado	5	2024	2	18	f
126	2024-05-05	Domingo	5	2024	2	18	t
127	2024-05-06	Lunes	5	2024	2	19	f
128	2024-05-07	Martes	5	2024	2	19	f
129	2024-05-08	Miércoles	5	2024	2	19	f
130	2024-05-09	Jueves	5	2024	2	19	f
131	2024-05-10	Viernes	5	2024	2	19	f
132	2024-05-11	Sábado	5	2024	2	19	f
133	2024-05-12	Domingo	5	2024	2	19	t
134	2024-05-13	Lunes	5	2024	2	20	f
135	2024-05-14	Martes	5	2024	2	20	f
136	2024-05-15	Miércoles	5	2024	2	20	f
137	2024-05-16	Jueves	5	2024	2	20	f
138	2024-05-17	Viernes	5	2024	2	20	f
139	2024-05-18	Sábado	5	2024	2	20	f
140	2024-05-19	Domingo	5	2024	2	20	t
141	2024-05-20	Lunes	5	2024	2	21	f
142	2024-05-21	Martes	5	2024	2	21	f
143	2024-05-22	Miércoles	5	2024	2	21	f
144	2024-05-23	Jueves	5	2024	2	21	f
145	2024-05-24	Viernes	5	2024	2	21	f
146	2024-05-25	Sábado	5	2024	2	21	f
147	2024-05-26	Domingo	5	2024	2	21	t
148	2024-05-27	Lunes	5	2024	2	22	f
149	2024-05-28	Martes	5	2024	2	22	f
150	2024-05-29	Miércoles	5	2024	2	22	f
151	2024-05-30	Jueves	5	2024	2	22	f
152	2024-05-31	Viernes	5	2024	2	22	f
153	2024-06-01	Sábado	6	2024	2	22	f
154	2024-06-02	Domingo	6	2024	2	22	t
155	2024-06-03	Lunes	6	2024	2	23	f
156	2024-06-04	Martes	6	2024	2	23	f
157	2024-06-05	Miércoles	6	2024	2	23	f
158	2024-06-06	Jueves	6	2024	2	23	f
159	2024-06-07	Viernes	6	2024	2	23	f
160	2024-06-08	Sábado	6	2024	2	23	f
161	2024-06-09	Domingo	6	2024	2	23	t
162	2024-06-10	Lunes	6	2024	2	24	f
163	2024-06-11	Martes	6	2024	2	24	f
164	2024-06-12	Miércoles	6	2024	2	24	f
165	2024-06-13	Jueves	6	2024	2	24	f
166	2024-06-14	Viernes	6	2024	2	24	f
167	2024-06-15	Sábado	6	2024	2	24	f
168	2024-06-16	Domingo	6	2024	2	24	t
169	2024-06-17	Lunes	6	2024	2	25	f
170	2024-06-18	Martes	6	2024	2	25	f
171	2024-06-19	Miércoles	6	2024	2	25	f
172	2024-06-20	Jueves	6	2024	2	25	f
173	2024-06-21	Viernes	6	2024	2	25	f
174	2024-06-22	Sábado	6	2024	2	25	f
175	2024-06-23	Domingo	6	2024	2	25	t
176	2024-06-24	Lunes	6	2024	2	26	f
177	2024-06-25	Martes	6	2024	2	26	f
178	2024-06-26	Miércoles	6	2024	2	26	f
179	2024-06-27	Jueves	6	2024	2	26	f
180	2024-06-28	Viernes	6	2024	2	26	f
181	2024-06-29	Sábado	6	2024	2	26	f
182	2024-06-30	Domingo	6	2024	2	26	t
183	2024-07-01	Lunes	7	2024	3	27	f
184	2024-07-02	Martes	7	2024	3	27	f
185	2024-07-03	Miércoles	7	2024	3	27	f
186	2024-07-04	Jueves	7	2024	3	27	f
187	2024-07-05	Viernes	7	2024	3	27	f
188	2024-07-06	Sábado	7	2024	3	27	f
189	2024-07-07	Domingo	7	2024	3	27	t
190	2024-07-08	Lunes	7	2024	3	28	f
191	2024-07-09	Martes	7	2024	3	28	f
192	2024-07-10	Miércoles	7	2024	3	28	f
193	2024-07-11	Jueves	7	2024	3	28	f
194	2024-07-12	Viernes	7	2024	3	28	f
195	2024-07-13	Sábado	7	2024	3	28	f
196	2024-07-14	Domingo	7	2024	3	28	t
197	2024-07-15	Lunes	7	2024	3	29	f
198	2024-07-16	Martes	7	2024	3	29	f
199	2024-07-17	Miércoles	7	2024	3	29	f
200	2024-07-18	Jueves	7	2024	3	29	f
201	2024-07-19	Viernes	7	2024	3	29	f
202	2024-07-20	Sábado	7	2024	3	29	f
203	2024-07-21	Domingo	7	2024	3	29	t
204	2024-07-22	Lunes	7	2024	3	30	f
205	2024-07-23	Martes	7	2024	3	30	f
206	2024-07-24	Miércoles	7	2024	3	30	f
207	2024-07-25	Jueves	7	2024	3	30	f
208	2024-07-26	Viernes	7	2024	3	30	f
209	2024-07-27	Sábado	7	2024	3	30	f
210	2024-07-28	Domingo	7	2024	3	30	t
211	2024-07-29	Lunes	7	2024	3	31	f
212	2024-07-30	Martes	7	2024	3	31	f
213	2024-07-31	Miércoles	7	2024	3	31	f
214	2024-08-01	Jueves	8	2024	3	31	f
215	2024-08-02	Viernes	8	2024	3	31	f
216	2024-08-03	Sábado	8	2024	3	31	f
217	2024-08-04	Domingo	8	2024	3	31	t
218	2024-08-05	Lunes	8	2024	3	32	f
219	2024-08-06	Martes	8	2024	3	32	f
220	2024-08-07	Miércoles	8	2024	3	32	f
221	2024-08-08	Jueves	8	2024	3	32	f
222	2024-08-09	Viernes	8	2024	3	32	f
223	2024-08-10	Sábado	8	2024	3	32	f
224	2024-08-11	Domingo	8	2024	3	32	t
225	2024-08-12	Lunes	8	2024	3	33	f
226	2024-08-13	Martes	8	2024	3	33	f
227	2024-08-14	Miércoles	8	2024	3	33	f
228	2024-08-15	Jueves	8	2024	3	33	f
229	2024-08-16	Viernes	8	2024	3	33	f
230	2024-08-17	Sábado	8	2024	3	33	f
231	2024-08-18	Domingo	8	2024	3	33	t
232	2024-08-19	Lunes	8	2024	3	34	f
233	2024-08-20	Martes	8	2024	3	34	f
234	2024-08-21	Miércoles	8	2024	3	34	f
235	2024-08-22	Jueves	8	2024	3	34	f
236	2024-08-23	Viernes	8	2024	3	34	f
237	2024-08-24	Sábado	8	2024	3	34	f
238	2024-08-25	Domingo	8	2024	3	34	t
239	2024-08-26	Lunes	8	2024	3	35	f
240	2024-08-27	Martes	8	2024	3	35	f
241	2024-08-28	Miércoles	8	2024	3	35	f
242	2024-08-29	Jueves	8	2024	3	35	f
243	2024-08-30	Viernes	8	2024	3	35	f
244	2024-08-31	Sábado	8	2024	3	35	f
245	2024-09-01	Domingo	9	2024	3	35	t
246	2024-09-02	Lunes	9	2024	3	36	f
247	2024-09-03	Martes	9	2024	3	36	f
248	2024-09-04	Miércoles	9	2024	3	36	f
249	2024-09-05	Jueves	9	2024	3	36	f
250	2024-09-06	Viernes	9	2024	3	36	f
251	2024-09-07	Sábado	9	2024	3	36	f
252	2024-09-08	Domingo	9	2024	3	36	t
253	2024-09-09	Lunes	9	2024	3	37	f
254	2024-09-10	Martes	9	2024	3	37	f
255	2024-09-11	Miércoles	9	2024	3	37	f
256	2024-09-12	Jueves	9	2024	3	37	f
257	2024-09-13	Viernes	9	2024	3	37	f
258	2024-09-14	Sábado	9	2024	3	37	f
259	2024-09-15	Domingo	9	2024	3	37	t
260	2024-09-16	Lunes	9	2024	3	38	f
261	2024-09-17	Martes	9	2024	3	38	f
262	2024-09-18	Miércoles	9	2024	3	38	f
263	2024-09-19	Jueves	9	2024	3	38	f
264	2024-09-20	Viernes	9	2024	3	38	f
265	2024-09-21	Sábado	9	2024	3	38	f
266	2024-09-22	Domingo	9	2024	3	38	t
267	2024-09-23	Lunes	9	2024	3	39	f
268	2024-09-24	Martes	9	2024	3	39	f
269	2024-09-25	Miércoles	9	2024	3	39	f
270	2024-09-26	Jueves	9	2024	3	39	f
271	2024-09-27	Viernes	9	2024	3	39	f
272	2024-09-28	Sábado	9	2024	3	39	f
273	2024-09-29	Domingo	9	2024	3	39	t
274	2024-09-30	Lunes	9	2024	3	40	f
275	2024-10-01	Martes	10	2024	4	40	f
276	2024-10-02	Miércoles	10	2024	4	40	f
277	2024-10-03	Jueves	10	2024	4	40	f
278	2024-10-04	Viernes	10	2024	4	40	f
279	2024-10-05	Sábado	10	2024	4	40	f
280	2024-10-06	Domingo	10	2024	4	40	t
281	2024-10-07	Lunes	10	2024	4	41	f
282	2024-10-08	Martes	10	2024	4	41	f
283	2024-10-09	Miércoles	10	2024	4	41	f
284	2024-10-10	Jueves	10	2024	4	41	f
285	2024-10-11	Viernes	10	2024	4	41	f
286	2024-10-12	Sábado	10	2024	4	41	f
287	2024-10-13	Domingo	10	2024	4	41	t
288	2024-10-14	Lunes	10	2024	4	42	f
289	2024-10-15	Martes	10	2024	4	42	f
290	2024-10-16	Miércoles	10	2024	4	42	f
291	2024-10-17	Jueves	10	2024	4	42	f
292	2024-10-18	Viernes	10	2024	4	42	f
293	2024-10-19	Sábado	10	2024	4	42	f
294	2024-10-20	Domingo	10	2024	4	42	t
295	2024-10-21	Lunes	10	2024	4	43	f
296	2024-10-22	Martes	10	2024	4	43	f
297	2024-10-23	Miércoles	10	2024	4	43	f
298	2024-10-24	Jueves	10	2024	4	43	f
299	2024-10-25	Viernes	10	2024	4	43	f
300	2024-10-26	Sábado	10	2024	4	43	f
301	2024-10-27	Domingo	10	2024	4	43	t
302	2024-10-28	Lunes	10	2024	4	44	f
303	2024-10-29	Martes	10	2024	4	44	f
304	2024-10-30	Miércoles	10	2024	4	44	f
305	2024-10-31	Jueves	10	2024	4	44	f
306	2024-11-01	Viernes	11	2024	4	44	f
307	2024-11-02	Sábado	11	2024	4	44	f
308	2024-11-03	Domingo	11	2024	4	44	t
309	2024-11-04	Lunes	11	2024	4	45	f
310	2024-11-05	Martes	11	2024	4	45	f
311	2024-11-06	Miércoles	11	2024	4	45	f
312	2024-11-07	Jueves	11	2024	4	45	f
313	2024-11-08	Viernes	11	2024	4	45	f
314	2024-11-09	Sábado	11	2024	4	45	f
315	2024-11-10	Domingo	11	2024	4	45	t
316	2024-11-11	Lunes	11	2024	4	46	f
317	2024-11-12	Martes	11	2024	4	46	f
318	2024-11-13	Miércoles	11	2024	4	46	f
319	2024-11-14	Jueves	11	2024	4	46	f
320	2024-11-15	Viernes	11	2024	4	46	f
321	2024-11-16	Sábado	11	2024	4	46	f
322	2024-11-17	Domingo	11	2024	4	46	t
323	2024-11-18	Lunes	11	2024	4	47	f
324	2024-11-19	Martes	11	2024	4	47	f
325	2024-11-20	Miércoles	11	2024	4	47	f
326	2024-11-21	Jueves	11	2024	4	47	f
327	2024-11-22	Viernes	11	2024	4	47	f
328	2024-11-23	Sábado	11	2024	4	47	f
329	2024-11-24	Domingo	11	2024	4	47	t
330	2024-11-25	Lunes	11	2024	4	48	f
331	2024-11-26	Martes	11	2024	4	48	f
332	2024-11-27	Miércoles	11	2024	4	48	f
333	2024-11-28	Jueves	11	2024	4	48	f
334	2024-11-29	Viernes	11	2024	4	48	f
335	2024-11-30	Sábado	11	2024	4	48	f
336	2024-12-01	Domingo	12	2024	4	48	t
337	2024-12-02	Lunes	12	2024	4	49	f
338	2024-12-03	Martes	12	2024	4	49	f
339	2024-12-04	Miércoles	12	2024	4	49	f
340	2024-12-05	Jueves	12	2024	4	49	f
341	2024-12-06	Viernes	12	2024	4	49	f
342	2024-12-07	Sábado	12	2024	4	49	f
343	2024-12-08	Domingo	12	2024	4	49	t
344	2024-12-09	Lunes	12	2024	4	50	f
345	2024-12-10	Martes	12	2024	4	50	f
346	2024-12-11	Miércoles	12	2024	4	50	f
347	2024-12-12	Jueves	12	2024	4	50	f
348	2024-12-13	Viernes	12	2024	4	50	f
349	2024-12-14	Sábado	12	2024	4	50	f
350	2024-12-15	Domingo	12	2024	4	50	t
351	2024-12-16	Lunes	12	2024	4	51	f
352	2024-12-17	Martes	12	2024	4	51	f
353	2024-12-18	Miércoles	12	2024	4	51	f
354	2024-12-19	Jueves	12	2024	4	51	f
355	2024-12-20	Viernes	12	2024	4	51	f
356	2024-12-21	Sábado	12	2024	4	51	f
357	2024-12-22	Domingo	12	2024	4	51	t
358	2024-12-23	Lunes	12	2024	4	52	f
359	2024-12-24	Martes	12	2024	4	52	f
360	2024-12-25	Miércoles	12	2024	4	52	f
361	2024-12-26	Jueves	12	2024	4	52	f
362	2024-12-27	Viernes	12	2024	4	52	f
363	2024-12-28	Sábado	12	2024	4	52	f
364	2024-12-29	Domingo	12	2024	4	52	t
365	2024-12-30	Lunes	12	2024	4	1	f
366	2024-12-31	Martes	12	2024	4	1	f
\.


--
-- Data for Name: dim_tienda; Type: TABLE DATA; Schema: public; Owner: tiendita_user
--

COPY public.dim_tienda (id, nombre, ubicacion, superficie) FROM stdin;
1	Tienda Don Pepe	Av. Insurgentes 123, CDMX	40
2	Abarrotes Lupita	Calle Flores 55, CDMX	30
3	Super Express	Avenida Revolución 200, CDMX	60
\.


--
-- Data for Name: hecho_transaccion_inventario; Type: TABLE DATA; Schema: public; Owner: tiendita_user
--

COPY public.hecho_transaccion_inventario (id, fecha_id, producto_id, proveedor_id, tienda_id, empleado_id, tipo_transaccion, cantidad, valor_unitario, valor_total) FROM stdin;
1	61	29	10	1	3	merma	14	21.31	298.34
2	260	24	13	2	1	merma	11	15.78	173.58
3	328	26	14	2	1	merma	4	25.53	102.12
4	253	71	11	3	2	merma	11	22.90	251.90
5	11	58	3	1	5	merma	9	15.10	135.90
6	312	75	14	3	5	compra	4	77.62	310.48
7	296	1	12	3	1	compra	29	98.73	2863.17
8	232	27	18	2	1	merma	7	38.34	268.38
9	93	50	18	1	3	venta	15	63.16	947.40
10	216	69	17	2	3	merma	14	37.40	523.60
11	252	42	8	2	3	venta	1	62.59	62.59
12	83	85	5	3	3	merma	2	12.84	25.68
13	261	90	7	2	2	merma	29	86.30	2502.70
14	88	61	10	3	5	compra	27	36.59	987.93
15	219	41	12	1	1	merma	5	71.26	356.30
16	191	58	2	2	5	compra	29	14.19	411.51
17	273	31	6	3	2	compra	24	98.64	2367.36
18	359	97	8	3	3	merma	7	86.48	605.36
19	7	6	4	2	2	merma	24	38.36	920.64
20	299	69	8	1	5	merma	16	42.20	675.20
21	4	24	1	3	1	merma	24	23.05	553.20
22	160	87	9	1	4	merma	26	26.27	683.02
23	70	2	1	2	1	merma	3	82.94	248.82
24	128	92	3	3	4	venta	23	93.61	2153.03
25	78	60	16	1	5	compra	29	14.29	414.41
26	146	81	4	3	3	compra	2	70.22	140.44
27	185	5	9	3	1	merma	30	78.33	2349.90
28	76	37	16	1	4	venta	1	53.96	53.96
29	134	25	14	3	4	compra	2	36.84	73.68
30	246	3	5	3	4	compra	7	45.31	317.17
31	59	6	20	3	1	merma	20	79.69	1593.80
32	350	5	2	3	4	compra	29	58.08	1684.32
33	326	80	8	1	1	merma	26	74.99	1949.74
34	85	1	18	3	2	venta	26	16.64	432.64
35	235	54	20	2	3	compra	21	88.67	1862.07
36	84	86	3	2	1	merma	16	38.20	611.20
37	43	82	10	1	1	merma	2	15.45	30.90
38	341	2	9	2	1	venta	9	11.46	103.14
39	237	66	5	2	3	merma	23	54.62	1256.26
40	70	57	14	2	5	merma	28	71.95	2014.60
41	186	87	7	3	4	merma	5	53.27	266.35
42	221	53	14	3	4	merma	16	9.71	155.36
43	326	71	17	3	3	compra	16	52.63	842.08
44	158	16	9	2	4	venta	14	45.23	633.22
45	169	28	11	1	3	venta	18	16.35	294.30
46	235	5	5	1	3	venta	13	85.48	1111.24
47	5	81	19	1	3	merma	27	44.80	1209.60
48	2	38	6	1	5	merma	19	25.65	487.35
49	99	57	1	1	2	compra	20	20.91	418.20
50	326	6	20	3	4	merma	18	64.91	1168.38
51	358	19	3	3	4	merma	12	43.19	518.28
52	112	2	20	1	3	venta	26	18.05	469.30
53	46	23	7	1	3	merma	24	67.90	1629.60
54	343	83	12	2	2	merma	12	70.12	841.44
55	168	6	5	2	5	merma	12	7.70	92.40
56	215	14	7	1	4	venta	5	89.81	449.05
57	3	77	17	2	5	compra	5	34.02	170.10
58	165	17	12	3	5	venta	30	17.45	523.50
59	216	94	7	2	5	merma	20	15.23	304.60
60	61	84	7	1	5	venta	28	7.38	206.64
61	347	26	13	1	4	compra	29	7.16	207.64
62	228	72	17	3	5	compra	7	41.03	287.21
63	248	61	15	3	2	merma	26	35.52	923.52
64	229	53	15	3	5	compra	28	32.64	913.92
65	214	52	1	2	3	compra	5	92.11	460.55
66	126	20	5	2	2	compra	30	21.84	655.20
67	256	7	14	3	5	compra	5	43.61	218.05
68	91	25	10	3	3	compra	16	31.26	500.16
69	352	13	6	3	5	merma	29	5.97	173.13
70	187	35	20	2	2	merma	9	38.62	347.58
71	178	79	8	3	3	merma	2	10.89	21.78
72	38	38	4	3	3	venta	4	76.91	307.64
73	115	21	16	2	3	merma	14	83.68	1171.52
74	2	75	13	3	1	venta	2	76.38	152.76
75	169	30	18	3	3	merma	29	19.47	564.63
76	263	13	15	3	2	merma	8	43.38	347.04
77	350	18	2	3	3	venta	1	67.92	67.92
78	124	74	13	3	4	compra	25	61.95	1548.75
79	337	1	20	2	5	venta	8	49.17	393.36
80	39	45	1	1	4	merma	28	97.09	2718.52
81	135	47	15	1	4	merma	17	38.70	657.90
82	44	3	10	2	2	compra	18	31.43	565.74
83	209	99	16	1	2	merma	13	36.23	470.99
84	148	36	11	3	1	venta	18	95.93	1726.74
85	255	73	13	3	4	venta	4	29.51	118.04
86	278	83	19	1	1	merma	5	10.67	53.35
87	357	95	17	2	1	venta	16	72.37	1157.92
88	156	79	20	1	4	compra	11	79.06	869.66
89	1	14	7	1	5	merma	18	31.31	563.58
90	246	60	10	3	2	merma	1	96.97	96.97
91	205	60	18	2	1	venta	24	31.46	755.04
92	254	5	10	3	5	venta	14	13.93	195.02
93	328	86	7	1	4	venta	1	58.72	58.72
94	90	71	19	1	4	merma	4	64.81	259.24
95	254	85	16	1	5	merma	12	96.40	1156.80
96	93	31	3	3	5	venta	23	46.28	1064.44
97	267	57	3	2	5	compra	7	43.98	307.86
98	33	24	7	2	1	merma	14	31.53	441.42
99	324	63	15	1	3	compra	2	81.79	163.58
100	221	78	16	2	4	merma	12	75.45	905.40
101	185	38	2	2	3	compra	10	5.49	54.90
102	128	54	10	1	2	venta	14	87.94	1231.16
103	39	46	5	3	3	compra	9	65.19	586.71
104	5	16	5	2	2	compra	25	72.58	1814.50
105	98	57	20	1	4	merma	10	85.79	857.90
106	182	20	20	2	2	merma	19	20.20	383.80
107	184	90	16	2	1	venta	5	42.21	211.05
108	205	3	4	1	2	merma	22	40.25	885.50
109	214	92	19	3	2	merma	26	63.31	1646.06
110	204	30	17	2	3	merma	3	61.62	184.86
111	169	6	16	1	4	compra	10	11.89	118.90
112	216	45	17	3	2	compra	8	35.00	280.00
113	161	70	7	2	1	merma	15	86.77	1301.55
114	27	87	4	1	3	merma	3	46.05	138.15
115	168	52	9	1	4	merma	10	7.92	79.20
116	23	32	7	1	4	merma	1	7.00	7.00
117	21	82	6	1	1	compra	15	79.44	1191.60
118	15	7	6	1	2	venta	6	42.17	253.02
119	235	93	15	2	5	compra	19	73.04	1387.76
120	225	100	19	1	3	venta	18	79.65	1433.70
121	7	11	17	1	5	compra	19	60.40	1147.60
122	49	66	11	3	1	venta	1	23.50	23.50
123	73	5	3	3	2	compra	6	91.49	548.94
124	235	51	14	3	3	merma	18	80.64	1451.52
125	12	57	19	3	1	compra	7	62.94	440.58
126	290	9	17	3	3	venta	21	89.07	1870.47
127	341	94	9	3	5	compra	5	26.06	130.30
128	29	13	1	2	1	merma	8	11.06	88.48
129	191	82	15	1	1	venta	25	8.31	207.75
130	303	67	20	1	2	venta	17	18.18	309.06
131	297	21	14	2	2	compra	17	14.44	245.48
132	309	19	20	2	1	compra	29	5.75	166.75
133	270	51	18	2	1	merma	13	85.38	1109.94
134	206	9	5	2	1	venta	26	92.91	2415.66
135	25	100	13	1	3	compra	29	28.58	828.82
136	157	21	1	1	1	venta	9	8.93	80.37
137	203	18	8	2	5	merma	19	54.04	1026.76
138	181	73	11	3	1	venta	27	16.06	433.62
139	359	94	20	3	5	compra	28	33.08	926.24
140	338	10	6	1	3	venta	14	23.16	324.24
141	254	3	4	3	3	merma	7	86.15	603.05
142	108	61	14	3	5	venta	29	32.59	945.11
143	317	68	7	2	1	venta	3	34.68	104.04
144	309	75	7	2	1	venta	1	17.64	17.64
145	108	9	19	3	1	compra	26	49.79	1294.54
146	104	56	18	1	3	compra	24	10.77	258.48
147	182	37	4	2	3	merma	29	91.96	2666.84
148	122	66	2	2	5	venta	8	93.27	746.16
149	244	18	20	1	4	venta	27	69.28	1870.56
150	183	83	1	2	3	compra	25	98.41	2460.25
151	166	9	8	3	4	compra	25	66.94	1673.50
152	106	6	3	1	1	venta	15	28.18	422.70
153	195	95	7	3	1	venta	8	16.07	128.56
154	195	85	10	1	2	venta	11	72.50	797.50
155	275	42	18	2	4	compra	20	9.25	185.00
156	8	99	20	1	2	compra	13	16.04	208.52
157	2	14	11	2	4	compra	28	10.15	284.20
158	274	6	5	1	2	venta	28	34.14	955.92
159	345	93	4	1	5	merma	27	73.43	1982.61
160	194	12	19	3	1	compra	26	72.72	1890.72
161	45	8	1	2	3	merma	18	24.38	438.84
162	262	24	14	3	5	merma	27	48.79	1317.33
163	251	10	11	1	1	venta	6	77.91	467.46
164	46	30	17	3	5	venta	16	88.25	1412.00
165	192	65	9	3	2	merma	6	85.32	511.92
166	215	31	19	3	5	merma	25	80.94	2023.50
167	35	31	1	2	3	venta	4	7.65	30.60
168	227	87	13	1	2	venta	23	92.88	2136.24
169	292	5	12	1	3	merma	15	26.33	394.95
170	7	21	11	2	3	compra	1	9.51	9.51
171	289	87	8	2	2	venta	15	33.96	509.40
172	91	21	12	3	4	venta	28	74.69	2091.32
173	177	30	9	3	3	merma	9	85.94	773.46
174	190	13	1	2	1	compra	19	81.40	1546.60
175	73	31	19	2	5	merma	19	34.32	652.08
176	97	76	17	2	2	compra	24	97.09	2330.16
177	208	72	6	1	5	compra	6	31.67	190.02
178	152	69	6	3	3	compra	16	8.66	138.56
179	312	50	4	2	2	compra	7	43.85	306.95
180	127	56	14	2	5	compra	22	8.17	179.74
181	228	21	4	2	5	merma	13	38.40	499.20
182	334	40	15	2	3	venta	1	69.92	69.92
183	319	24	3	3	3	compra	16	77.04	1232.64
184	330	14	3	3	3	compra	29	38.18	1107.22
185	224	16	18	2	5	venta	19	39.79	756.01
186	269	98	2	1	3	venta	19	55.30	1050.70
187	316	51	11	1	5	venta	6	20.82	124.92
188	69	56	8	3	2	compra	4	60.66	242.64
189	320	26	13	3	3	merma	5	75.65	378.25
190	33	90	4	3	1	merma	27	37.41	1010.07
191	9	51	12	3	5	merma	1	54.93	54.93
192	242	15	16	2	2	merma	24	48.31	1159.44
193	251	29	9	2	4	compra	29	78.03	2262.87
194	159	52	16	2	2	compra	27	39.10	1055.70
195	349	77	6	1	5	merma	26	37.54	976.04
196	79	91	3	2	5	venta	13	24.97	324.61
197	185	96	12	3	1	venta	6	14.05	84.30
198	82	40	12	3	4	merma	5	60.74	303.70
199	290	59	4	3	1	merma	25	87.37	2184.25
200	214	41	1	1	3	merma	10	97.24	972.40
201	250	47	11	3	1	compra	9	53.30	479.70
202	191	61	8	1	4	merma	27	55.76	1505.52
203	32	100	11	1	3	merma	1	21.22	21.22
204	289	19	17	2	2	merma	8	71.45	571.60
205	120	6	9	1	2	compra	11	28.69	315.59
206	51	72	11	1	2	compra	22	8.29	182.38
207	229	52	4	2	5	venta	3	65.61	196.83
208	10	13	10	2	2	compra	27	39.21	1058.67
209	68	83	16	2	1	merma	14	57.99	811.86
210	322	75	10	1	1	merma	17	93.74	1593.58
211	67	9	6	2	5	compra	2	51.06	102.12
212	80	66	7	1	1	venta	20	97.89	1957.80
213	95	10	10	3	2	compra	22	41.78	919.16
214	40	86	8	2	1	venta	6	84.21	505.26
215	361	87	15	3	3	compra	19	8.11	154.09
216	18	37	13	3	4	compra	13	63.26	822.38
217	351	57	15	3	1	merma	5	77.22	386.10
218	253	69	14	3	4	venta	22	70.84	1558.48
219	33	98	11	2	4	compra	25	24.16	604.00
220	254	73	2	3	3	compra	17	86.45	1469.65
221	97	30	11	3	3	merma	27	64.31	1736.37
222	126	45	6	1	2	merma	29	64.15	1860.35
223	101	98	19	1	1	merma	12	31.00	372.00
224	294	55	11	3	2	merma	16	64.41	1030.56
225	123	22	19	2	2	compra	28	6.52	182.56
226	168	71	16	2	2	compra	18	21.57	388.26
227	153	42	8	2	3	compra	8	86.10	688.80
228	39	100	7	3	3	merma	16	60.58	969.28
229	188	63	12	1	5	merma	25	45.66	1141.50
230	175	42	4	1	3	venta	10	29.83	298.30
231	217	63	8	3	5	venta	5	57.51	287.55
232	343	95	2	2	1	merma	27	40.29	1087.83
233	25	2	11	3	4	compra	8	92.13	737.04
234	322	1	10	2	3	venta	1	12.75	12.75
235	207	79	9	1	2	merma	26	14.18	368.68
236	25	43	12	1	4	compra	9	84.50	760.50
237	80	51	19	1	3	venta	3	94.90	284.70
238	118	12	6	1	4	compra	4	70.99	283.96
239	86	72	13	1	1	merma	27	37.80	1020.60
240	315	63	15	3	4	venta	9	40.26	362.34
241	188	76	16	2	3	compra	26	86.42	2246.92
242	113	20	9	1	5	merma	20	66.93	1338.60
243	350	41	9	2	2	merma	10	95.42	954.20
244	119	38	9	2	2	venta	29	24.74	717.46
245	318	94	19	1	2	venta	17	99.65	1694.05
246	330	40	10	2	2	compra	21	62.41	1310.61
247	15	94	12	3	4	venta	11	41.27	453.97
248	288	74	7	1	2	compra	28	58.04	1625.12
249	123	17	15	1	3	compra	4	41.89	167.56
250	85	2	14	1	4	merma	30	86.50	2595.00
251	43	78	11	3	1	merma	2	13.42	26.84
252	153	83	7	3	1	compra	4	92.76	371.04
253	168	37	19	1	3	compra	3	38.64	115.92
254	29	78	3	2	5	venta	29	43.13	1250.77
255	80	21	1	3	4	merma	2	7.99	15.98
256	257	9	3	2	2	merma	23	61.14	1406.22
257	174	61	5	1	2	merma	13	87.64	1139.32
258	87	32	15	2	4	compra	22	39.68	872.96
259	122	24	19	3	5	compra	8	71.89	575.12
260	325	79	2	3	2	merma	4	77.71	310.84
261	9	67	8	3	4	venta	29	86.92	2520.68
262	291	82	15	2	4	compra	14	82.55	1155.70
263	329	30	14	2	3	merma	26	56.38	1465.88
264	221	94	3	1	3	merma	19	83.82	1592.58
265	191	70	19	1	3	merma	8	26.96	215.68
266	220	78	15	2	2	merma	11	77.82	856.02
267	14	44	10	3	3	merma	23	48.61	1118.03
268	285	24	1	1	5	compra	28	32.50	910.00
269	230	6	1	1	4	venta	23	78.21	1798.83
270	178	83	13	2	5	merma	1	35.04	35.04
271	206	91	8	1	5	merma	2	77.47	154.94
272	68	90	17	2	4	merma	9	97.50	877.50
273	299	60	17	2	2	venta	18	69.70	1254.60
274	75	71	13	1	4	compra	28	7.27	203.56
275	81	29	12	2	5	merma	16	34.61	553.76
276	245	54	15	2	4	compra	9	16.40	147.60
277	20	58	11	2	4	compra	13	5.17	67.21
278	345	28	6	2	4	compra	4	13.45	53.80
279	289	32	1	1	3	venta	7	76.25	533.75
280	209	95	5	2	1	compra	9	25.14	226.26
281	122	41	12	2	3	merma	30	25.87	776.10
282	82	96	10	2	5	merma	4	86.91	347.64
283	258	58	8	2	1	merma	8	25.54	204.32
284	304	42	1	2	5	venta	10	68.66	686.60
285	168	34	12	3	5	merma	15	14.09	211.35
286	288	75	6	3	4	venta	14	66.29	928.06
287	331	44	4	1	5	merma	30	20.44	613.20
288	197	31	2	3	5	venta	7	27.45	192.15
289	220	87	7	1	5	venta	22	28.97	637.34
290	42	61	12	2	5	venta	29	96.02	2784.58
291	132	96	11	3	4	merma	15	73.05	1095.75
292	212	86	9	1	5	merma	27	19.54	527.58
293	150	34	2	3	2	merma	28	30.62	857.36
294	140	18	6	2	4	compra	25	28.71	717.75
295	110	95	12	1	5	venta	22	69.51	1529.22
296	8	97	4	1	2	venta	9	68.75	618.75
297	257	99	15	2	1	compra	2	37.68	75.36
298	126	3	8	1	1	compra	9	11.36	102.24
299	167	31	11	3	2	venta	20	52.64	1052.80
300	258	51	16	1	5	merma	19	45.29	860.51
301	42	28	9	3	1	compra	23	27.05	622.15
302	41	14	1	1	3	compra	28	14.51	406.28
303	56	34	17	2	1	venta	20	89.71	1794.20
304	44	67	1	2	4	venta	7	53.85	376.95
305	181	30	6	3	2	compra	24	44.70	1072.80
306	55	65	1	2	2	venta	9	5.65	50.85
307	350	87	7	2	1	venta	27	45.88	1238.76
308	193	83	18	2	4	compra	23	66.02	1518.46
309	94	59	4	3	5	venta	22	57.18	1257.96
310	235	59	16	2	3	compra	6	29.09	174.54
311	56	8	1	1	2	venta	9	68.50	616.50
312	42	26	3	2	5	venta	2	88.78	177.56
313	262	29	19	3	5	merma	14	19.77	276.78
314	317	44	6	2	3	compra	22	68.91	1516.02
315	252	51	2	3	4	merma	17	76.18	1295.06
316	179	70	19	2	3	compra	17	42.44	721.48
317	3	52	4	3	4	merma	18	95.91	1726.38
318	234	72	13	1	5	compra	3	88.01	264.03
319	169	13	6	3	4	compra	7	82.80	579.60
320	40	77	15	1	1	venta	9	9.34	84.06
321	342	13	13	1	4	compra	5	35.78	178.90
322	142	96	13	2	3	venta	14	92.09	1289.26
323	314	24	15	2	4	venta	30	22.18	665.40
324	20	8	8	1	3	venta	11	14.65	161.15
325	191	81	12	1	5	merma	12	28.65	343.80
326	339	54	11	2	1	merma	26	17.93	466.18
327	40	80	17	3	3	venta	3	58.42	175.26
328	10	36	7	2	4	merma	15	51.48	772.20
329	190	83	8	1	4	compra	29	34.47	999.63
330	211	7	20	2	5	merma	24	51.42	1234.08
331	187	43	6	3	2	compra	28	78.06	2185.68
332	55	32	18	2	2	merma	17	5.39	91.63
333	91	98	8	3	4	compra	23	94.40	2171.20
334	56	29	18	2	5	compra	28	68.86	1928.08
335	235	73	13	2	1	venta	30	64.97	1949.10
336	306	98	16	2	5	venta	11	47.36	520.96
337	148	63	11	2	2	venta	17	61.60	1047.20
338	278	20	17	2	4	merma	24	53.41	1281.84
339	149	33	1	2	2	compra	24	70.27	1686.48
340	125	6	9	2	3	venta	5	24.65	123.25
341	88	38	4	1	4	compra	29	54.00	1566.00
342	287	56	6	2	4	compra	27	18.80	507.60
343	2	99	3	1	2	compra	16	91.15	1458.40
344	169	7	11	2	4	compra	13	50.95	662.35
345	151	92	19	1	5	compra	23	36.39	836.97
346	283	25	2	3	3	merma	30	51.45	1543.50
347	258	36	20	3	2	merma	6	50.71	304.26
348	160	86	7	2	1	venta	29	40.46	1173.34
349	112	75	13	1	3	merma	16	72.74	1163.84
350	255	24	8	3	3	compra	19	91.09	1730.71
351	82	93	5	3	2	compra	3	16.76	50.28
352	310	27	19	2	4	compra	27	19.54	527.58
353	338	17	8	1	1	compra	9	92.02	828.18
354	75	54	1	2	2	venta	12	72.53	870.36
355	157	36	16	2	2	compra	1	9.70	9.70
356	244	12	20	3	3	merma	23	79.53	1829.19
357	78	44	8	2	3	venta	26	83.12	2161.12
358	362	72	17	2	3	merma	24	22.48	539.52
359	324	52	8	2	2	compra	3	67.36	202.08
360	91	24	14	1	5	compra	20	95.69	1913.80
361	278	4	1	1	2	merma	11	6.91	76.01
362	355	25	20	1	5	merma	30	63.85	1915.50
363	109	58	20	2	5	venta	7	91.77	642.39
364	229	89	13	3	4	compra	22	86.54	1903.88
365	18	65	17	2	3	merma	26	83.66	2175.16
366	236	84	14	1	4	merma	7	54.55	381.85
367	128	46	20	2	3	compra	19	91.98	1747.62
368	124	39	18	3	2	compra	6	23.27	139.62
369	243	11	16	3	4	merma	14	23.47	328.58
370	216	9	7	3	1	venta	15	64.69	970.35
371	130	45	6	1	2	compra	28	55.60	1556.80
372	76	1	11	2	5	merma	24	88.56	2125.44
373	132	99	11	2	3	venta	28	84.49	2365.72
374	74	71	11	3	3	compra	11	52.61	578.71
375	120	94	18	1	3	compra	28	39.43	1104.04
376	347	70	18	1	3	venta	21	40.92	859.32
377	298	65	18	1	3	venta	12	73.23	878.76
378	44	80	6	1	5	merma	27	20.74	559.98
379	159	44	12	2	4	compra	27	20.17	544.59
380	146	29	10	3	1	compra	16	90.05	1440.80
381	36	19	12	2	1	merma	4	38.27	153.08
382	100	9	13	2	5	venta	18	42.13	758.34
383	348	94	10	1	5	merma	9	46.29	416.61
384	296	48	14	2	4	merma	27	13.26	358.02
385	159	56	19	2	5	merma	29	61.09	1771.61
386	191	62	17	3	5	merma	7	31.45	220.15
387	9	2	14	3	1	compra	11	57.08	627.88
388	275	34	20	1	5	compra	29	50.40	1461.60
389	32	27	14	3	5	venta	29	52.51	1522.79
390	225	94	9	3	1	merma	4	59.36	237.44
391	122	38	2	3	1	venta	26	73.31	1906.06
392	303	37	14	1	4	venta	25	99.69	2492.25
393	113	79	11	3	3	venta	28	20.88	584.64
394	283	40	2	1	1	merma	10	52.27	522.70
395	136	37	12	1	3	compra	23	85.19	1959.37
396	23	77	6	2	1	compra	13	56.28	731.64
397	199	85	13	3	1	compra	3	40.81	122.43
398	93	58	20	3	4	venta	10	12.83	128.30
399	359	70	20	3	3	venta	3	78.65	235.95
400	5	23	5	3	4	venta	19	89.95	1709.05
401	197	23	9	2	2	venta	10	48.18	481.80
402	167	100	17	1	1	compra	23	82.99	1908.77
403	206	92	6	3	4	compra	23	35.34	812.82
404	269	1	14	2	2	merma	7	48.94	342.58
405	175	95	17	2	4	compra	26	60.30	1567.80
406	311	76	3	2	5	merma	6	12.45	74.70
407	269	74	13	1	2	venta	2	48.13	96.26
408	33	100	16	3	5	merma	20	20.20	404.00
409	100	69	3	3	2	merma	12	53.47	641.64
410	29	63	18	2	4	venta	22	79.86	1756.92
411	296	19	12	1	1	venta	6	7.54	45.24
412	363	33	3	2	1	compra	7	14.90	104.30
413	134	9	15	2	5	merma	25	37.86	946.50
414	129	25	19	1	2	merma	20	75.97	1519.40
415	317	46	2	1	5	venta	15	27.85	417.75
416	5	14	17	1	2	compra	5	74.29	371.45
417	218	62	19	3	2	compra	10	38.94	389.40
418	36	93	11	3	4	compra	10	66.95	669.50
419	156	62	20	3	3	venta	25	22.09	552.25
420	175	93	13	1	1	merma	6	88.44	530.64
421	300	55	5	1	3	compra	8	83.03	664.24
422	186	38	3	1	2	merma	12	75.13	901.56
423	259	11	1	3	5	compra	24	91.32	2191.68
424	232	89	12	1	1	merma	15	23.21	348.15
425	216	75	5	3	2	venta	13	38.78	504.14
426	163	75	8	2	1	merma	16	91.23	1459.68
427	30	28	18	3	5	merma	2	76.31	152.62
428	72	46	13	3	1	venta	22	10.53	231.66
429	322	17	19	1	1	merma	29	55.44	1607.76
430	128	72	2	2	1	compra	16	36.37	581.92
431	138	54	8	2	3	venta	15	35.57	533.55
432	259	23	20	1	2	venta	2	9.85	19.70
433	136	58	3	3	2	compra	9	24.44	219.96
434	362	72	4	2	2	compra	7	79.44	556.08
435	112	47	12	1	3	venta	12	28.56	342.72
436	251	15	5	1	3	merma	15	31.02	465.30
437	226	81	14	1	1	venta	27	20.81	561.87
438	184	97	1	1	4	compra	20	63.91	1278.20
439	34	7	4	3	2	merma	24	53.05	1273.20
440	55	38	15	1	1	compra	16	75.99	1215.84
441	284	21	9	3	1	venta	10	18.74	187.40
442	200	89	9	3	5	venta	7	61.21	428.47
443	266	36	20	1	4	venta	1	5.12	5.12
444	14	4	13	3	1	venta	1	67.07	67.07
445	294	11	17	1	4	merma	6	78.10	468.60
446	155	17	6	2	2	venta	23	20.30	466.90
447	58	24	9	3	5	merma	29	87.87	2548.23
448	305	96	16	1	2	merma	22	12.19	268.18
449	59	98	6	2	4	compra	5	90.34	451.70
450	7	31	1	3	1	compra	4	33.46	133.84
451	210	62	18	2	3	compra	11	34.73	382.03
452	330	81	20	3	2	venta	4	65.27	261.08
453	8	57	8	1	4	venta	20	69.69	1393.80
454	230	9	11	2	2	compra	22	50.52	1111.44
455	9	33	7	1	1	compra	17	43.17	733.89
456	158	78	10	3	3	merma	24	22.12	530.88
457	4	63	7	3	1	venta	1	63.15	63.15
458	325	44	16	1	4	merma	21	53.94	1132.74
459	246	12	11	1	5	merma	21	16.72	351.12
460	288	26	18	2	5	merma	27	76.57	2067.39
461	241	35	12	3	5	compra	20	76.80	1536.00
462	123	5	20	3	4	merma	17	41.17	699.89
463	296	32	13	1	5	merma	15	50.13	751.95
464	202	65	1	1	4	venta	18	12.03	216.54
465	200	54	20	3	2	merma	17	37.58	638.86
466	219	31	4	3	2	compra	1	53.02	53.02
467	322	87	18	2	1	merma	12	64.44	773.28
468	127	53	17	2	4	merma	29	41.97	1217.13
469	313	47	4	3	5	venta	1	32.10	32.10
470	44	37	13	3	3	venta	11	47.29	520.19
471	149	31	19	1	1	venta	11	77.21	849.31
472	170	1	15	2	3	venta	10	29.39	293.90
473	139	9	14	3	2	compra	6	98.26	589.56
474	276	26	1	3	5	merma	7	75.80	530.60
475	232	23	6	2	1	venta	27	35.86	968.22
476	12	62	4	1	5	venta	3	59.81	179.43
477	28	86	3	1	2	compra	13	23.24	302.12
478	174	25	16	1	5	merma	5	58.65	293.25
479	167	68	15	2	1	venta	20	42.50	850.00
480	79	85	18	3	5	venta	16	56.14	898.24
481	50	9	14	2	4	venta	14	22.30	312.20
482	188	63	8	3	4	compra	8	87.76	702.08
483	202	52	14	1	5	compra	29	10.76	312.04
484	84	3	16	2	3	compra	21	51.37	1078.77
485	86	81	14	1	5	compra	5	64.04	320.20
486	102	100	6	1	5	merma	25	38.19	954.75
487	186	23	11	1	2	compra	7	32.17	225.19
488	177	64	19	1	1	compra	7	61.11	427.77
489	144	46	6	1	4	compra	2	14.32	28.64
490	17	66	8	3	4	venta	13	25.45	330.85
491	324	81	12	3	4	compra	19	26.04	494.76
492	321	72	14	3	1	compra	18	76.60	1378.80
493	275	6	2	1	5	venta	2	72.44	144.88
494	185	46	15	1	1	venta	23	6.66	153.18
495	206	29	9	2	2	merma	4	61.43	245.72
496	178	11	13	1	3	venta	10	14.89	148.90
497	118	75	4	3	4	merma	3	35.24	105.72
498	245	93	14	3	4	compra	29	55.48	1608.92
499	295	52	20	3	1	merma	10	38.22	382.20
500	282	78	5	1	5	venta	19	88.28	1677.32
501	234	32	11	2	3	venta	3	33.38	100.14
502	267	46	6	2	4	compra	21	52.78	1108.38
503	240	100	14	1	1	compra	3	93.47	280.41
504	176	7	7	3	4	compra	15	29.29	439.35
505	51	3	11	2	4	venta	18	68.21	1227.78
506	84	96	6	2	5	venta	8	98.01	784.08
507	265	24	7	1	1	merma	29	75.00	2175.00
508	219	97	3	3	3	venta	26	90.63	2356.38
509	266	12	7	2	3	venta	17	76.16	1294.72
510	91	40	16	3	5	compra	8	26.50	212.00
511	167	90	12	3	2	venta	27	10.05	271.35
512	120	57	17	1	2	compra	18	38.27	688.86
513	119	4	15	3	1	compra	4	23.56	94.24
514	32	15	17	3	1	compra	7	40.49	283.43
515	261	50	4	2	5	merma	29	88.44	2564.76
516	127	48	6	2	2	merma	17	70.98	1206.66
517	170	9	1	2	3	venta	20	20.47	409.40
518	234	8	20	2	2	merma	30	20.62	618.60
519	340	20	16	1	1	venta	21	92.28	1937.88
520	240	78	19	1	2	compra	4	52.83	211.32
521	287	6	20	2	5	merma	15	71.76	1076.40
522	35	80	5	1	2	venta	20	48.25	965.00
523	87	63	16	1	4	compra	13	27.39	356.07
524	10	1	13	1	2	compra	1	93.96	93.96
525	156	100	18	1	5	compra	17	26.87	456.79
526	129	98	4	2	5	venta	6	71.09	426.54
527	321	33	9	3	1	venta	1	41.67	41.67
528	291	18	5	1	1	merma	9	96.92	872.28
529	140	18	5	3	5	compra	22	78.64	1730.08
530	60	59	10	2	5	venta	11	71.85	790.35
531	16	11	5	2	5	merma	18	99.71	1794.78
532	324	85	11	2	1	merma	13	19.99	259.87
533	154	64	12	3	1	venta	28	87.03	2436.84
534	303	83	8	3	1	merma	12	22.99	275.88
535	162	93	16	2	2	merma	9	30.70	276.30
536	327	11	15	1	1	merma	2	62.07	124.14
537	17	38	17	1	1	compra	18	47.57	856.26
538	78	31	17	3	3	venta	2	41.52	83.04
539	344	19	2	3	4	compra	24	78.90	1893.60
540	112	69	8	1	4	venta	23	70.56	1622.88
541	93	46	10	3	4	venta	3	49.10	147.30
542	171	16	16	2	5	venta	20	52.69	1053.80
543	125	34	20	3	3	venta	28	43.75	1225.00
544	337	10	12	1	3	compra	28	72.04	2017.12
545	354	32	9	3	2	venta	12	62.28	747.36
546	325	44	7	3	5	merma	5	69.19	345.95
547	224	86	20	2	4	compra	23	94.24	2167.52
548	246	3	11	1	2	merma	22	81.54	1793.88
549	174	67	15	1	1	venta	17	39.45	670.65
550	62	91	5	3	1	venta	18	9.97	179.46
551	152	84	9	3	3	compra	25	23.19	579.75
552	40	38	5	3	2	merma	22	67.02	1474.44
553	45	28	16	1	1	merma	9	75.59	680.31
554	143	44	3	1	5	venta	3	87.24	261.72
555	343	19	18	1	3	compra	2	73.91	147.82
556	93	5	14	3	5	venta	23	67.27	1547.21
557	56	15	9	1	1	merma	17	35.96	611.32
558	219	65	7	2	2	compra	9	93.82	844.38
559	85	1	11	3	2	compra	6	27.55	165.30
560	210	60	11	1	3	compra	14	6.21	86.94
561	304	62	16	1	4	venta	19	23.98	455.62
562	264	88	17	3	3	compra	1	10.77	10.77
563	235	4	10	2	5	merma	30	74.20	2226.00
564	4	19	11	3	2	merma	25	10.72	268.00
565	35	77	17	2	2	compra	6	39.00	234.00
566	189	90	7	2	2	venta	8	35.86	286.88
567	154	11	19	3	3	venta	23	80.75	1857.25
568	231	35	9	2	1	venta	15	19.12	286.80
569	278	8	4	1	3	merma	6	14.51	87.06
570	319	69	15	2	5	venta	28	22.68	635.04
571	178	88	12	2	5	venta	8	18.30	146.40
572	17	93	4	2	3	venta	17	51.30	872.10
573	251	65	2	3	3	merma	8	9.97	79.76
574	255	6	14	2	3	compra	13	26.85	349.05
575	219	37	11	1	1	venta	2	5.96	11.92
576	157	64	5	3	5	venta	17	45.01	765.17
577	187	54	4	3	3	compra	27	37.41	1010.07
578	24	81	11	2	1	compra	6	47.41	284.46
579	337	48	4	2	4	merma	28	53.61	1501.08
580	33	86	3	1	3	merma	3	17.48	52.44
581	111	2	17	3	2	compra	10	88.92	889.20
582	110	33	9	3	1	merma	22	82.93	1824.46
583	332	90	4	2	2	venta	20	67.76	1355.20
584	127	14	8	1	1	venta	24	79.25	1902.00
585	140	98	2	2	1	compra	26	75.14	1953.64
586	78	23	3	2	2	venta	13	96.41	1253.33
587	50	42	12	3	2	compra	8	39.14	313.12
588	294	77	3	2	1	venta	26	25.17	654.42
589	111	17	16	2	1	venta	21	10.06	211.26
590	220	57	1	2	3	venta	24	67.19	1612.56
591	128	7	12	3	4	compra	7	49.96	349.72
592	136	76	9	3	3	compra	12	73.42	881.04
593	144	100	14	2	3	merma	28	70.36	1970.08
594	189	25	17	1	3	merma	15	90.30	1354.50
595	350	68	7	3	3	merma	21	83.58	1755.18
596	235	22	14	3	3	merma	16	20.40	326.40
597	351	31	18	3	1	venta	10	69.11	691.10
598	366	27	16	1	5	venta	24	12.06	289.44
599	282	44	6	3	1	compra	25	51.59	1289.75
600	210	26	4	2	2	venta	2	75.05	150.10
601	341	95	3	3	4	merma	18	75.48	1358.64
602	365	43	9	2	1	merma	18	47.41	853.38
603	8	80	4	1	4	venta	28	74.54	2087.12
604	183	13	6	1	2	compra	9	77.07	693.63
605	279	49	16	3	4	compra	21	35.00	735.00
606	363	21	5	2	2	venta	8	44.39	355.12
607	73	34	3	1	4	merma	26	39.26	1020.76
608	290	73	15	1	1	merma	26	22.92	595.92
609	160	91	10	2	3	compra	13	43.10	560.30
610	156	26	7	3	3	merma	30	60.77	1823.10
611	251	24	7	1	5	compra	24	33.79	810.96
612	319	41	10	1	5	compra	29	74.83	2170.07
613	193	5	19	2	5	merma	4	95.71	382.84
614	91	52	19	3	5	merma	14	46.73	654.22
615	16	86	7	2	4	venta	30	67.58	2027.40
616	348	73	19	3	3	merma	28	26.15	732.20
617	302	63	5	3	3	merma	21	78.68	1652.28
618	313	88	10	2	2	venta	23	34.91	802.93
619	47	87	1	2	4	merma	1	19.03	19.03
620	276	13	18	1	5	merma	25	49.10	1227.50
621	152	76	3	1	3	venta	13	37.29	484.77
622	148	58	11	1	4	merma	8	68.16	545.28
623	59	92	14	1	3	venta	14	94.02	1316.28
624	81	26	4	1	1	compra	24	65.49	1571.76
625	180	24	7	2	2	compra	26	91.98	2391.48
626	27	19	6	2	1	compra	14	98.26	1375.64
627	304	36	1	1	2	compra	3	39.61	118.83
628	247	62	18	3	5	merma	10	70.41	704.10
629	8	57	13	2	1	merma	1	43.71	43.71
630	104	51	19	2	5	venta	21	88.38	1855.98
631	145	83	1	1	2	compra	28	76.24	2134.72
632	68	23	13	1	2	compra	15	20.73	310.95
633	292	78	2	2	1	compra	21	87.43	1836.03
634	216	96	14	1	1	compra	19	97.46	1851.74
635	8	95	18	1	2	compra	23	50.90	1170.70
636	230	33	2	3	3	venta	22	47.36	1041.92
637	42	8	9	2	2	venta	10	38.32	383.20
638	251	49	13	1	2	compra	9	78.73	708.57
639	156	79	14	1	1	merma	7	51.33	359.31
640	79	53	10	1	2	venta	20	18.26	365.20
641	135	69	4	3	4	venta	22	68.43	1505.46
642	281	65	19	2	2	compra	23	64.42	1481.66
643	131	7	16	1	3	venta	8	96.93	775.44
644	231	20	15	1	4	compra	1	93.15	93.15
645	243	57	8	3	3	venta	25	33.32	833.00
646	74	83	1	2	2	merma	11	39.25	431.75
647	357	88	13	3	4	compra	18	24.80	446.40
648	64	24	13	2	5	venta	20	39.41	788.20
649	310	6	17	1	1	venta	14	68.68	961.52
650	84	7	8	1	3	merma	17	15.32	260.44
651	29	97	5	1	3	merma	19	70.13	1332.47
652	95	45	3	1	4	venta	27	89.68	2421.36
653	114	24	14	2	4	venta	30	9.39	281.70
654	139	71	7	2	5	merma	7	7.65	53.55
655	99	64	7	2	3	venta	27	24.57	663.39
656	76	82	4	2	5	venta	27	66.92	1806.84
657	294	50	19	1	5	compra	16	44.79	716.64
658	70	25	14	1	3	merma	15	24.44	366.60
659	195	78	1	1	4	merma	11	5.58	61.38
660	271	62	5	2	5	merma	16	14.62	233.92
661	74	47	14	3	2	venta	27	95.34	2574.18
662	146	62	17	2	5	merma	15	18.32	274.80
663	233	29	12	3	2	compra	15	42.37	635.55
664	196	38	8	1	5	compra	17	44.42	755.14
665	209	84	3	1	3	venta	26	63.92	1661.92
666	64	75	17	2	3	merma	13	34.80	452.40
667	345	29	3	1	4	venta	3	29.61	88.83
668	58	93	16	2	4	merma	30	52.59	1577.70
669	218	42	20	1	1	venta	19	92.30	1753.70
670	363	99	16	3	3	merma	14	14.62	204.68
671	171	80	13	1	1	venta	11	5.36	58.96
672	151	10	14	3	1	venta	5	47.71	238.55
673	327	15	19	1	5	merma	2	27.89	55.78
674	305	81	5	2	2	compra	17	50.50	858.50
675	108	14	14	1	2	venta	29	63.42	1839.18
676	280	54	13	2	2	venta	30	76.35	2290.50
677	75	18	11	1	3	venta	25	79.97	1999.25
678	359	6	2	2	4	merma	18	95.85	1725.30
679	4	20	14	3	1	merma	7	38.35	268.45
680	55	45	6	1	4	merma	2	94.80	189.60
681	337	40	15	3	2	compra	2	95.13	190.26
682	193	85	19	3	5	merma	17	81.11	1378.87
683	333	93	4	2	3	venta	27	22.76	614.52
684	47	74	19	2	3	venta	16	85.93	1374.88
685	273	90	17	1	2	merma	6	37.60	225.60
686	341	32	16	2	4	merma	24	41.33	991.92
687	93	88	4	1	3	venta	23	13.89	319.47
688	33	37	10	2	5	merma	7	90.95	636.65
689	21	88	15	2	1	venta	4	84.16	336.64
690	278	55	17	2	5	venta	27	41.46	1119.42
691	58	81	3	1	5	venta	10	88.37	883.70
692	348	45	19	3	5	compra	13	58.77	764.01
693	259	49	2	2	1	merma	5	47.52	237.60
694	251	90	19	3	1	venta	16	23.78	380.48
695	335	89	13	1	5	compra	27	89.65	2420.55
696	78	84	20	3	5	venta	29	80.47	2333.63
697	232	42	8	3	2	venta	28	95.51	2674.28
698	20	44	4	1	2	venta	7	95.92	671.44
699	22	26	15	1	5	merma	29	85.13	2468.77
700	69	31	9	1	1	compra	30	56.44	1693.20
701	311	6	11	3	1	venta	10	99.02	990.20
702	255	28	14	2	4	venta	2	76.17	152.34
703	254	53	10	1	3	venta	4	35.15	140.60
704	265	76	10	3	2	merma	4	63.06	252.24
705	198	68	14	2	1	venta	14	71.25	997.50
706	232	64	6	1	3	compra	25	35.19	879.75
707	287	1	10	1	2	venta	26	83.74	2177.24
708	62	63	9	2	4	compra	9	90.66	815.94
709	210	50	14	1	4	merma	23	41.14	946.22
710	103	58	9	2	2	venta	15	17.05	255.75
711	226	39	4	3	5	compra	6	13.27	79.62
712	207	95	4	3	1	merma	1	21.30	21.30
713	164	67	7	3	1	venta	13	88.25	1147.25
714	355	56	11	1	1	compra	25	84.31	2107.75
715	273	24	14	3	1	venta	5	24.04	120.20
716	166	23	3	1	2	compra	25	96.66	2416.50
717	133	69	12	3	3	compra	4	35.02	140.08
718	262	32	9	3	3	merma	17	62.96	1070.32
719	276	63	17	2	3	merma	11	53.79	591.69
720	171	12	20	1	1	venta	15	85.83	1287.45
721	261	40	6	1	1	merma	11	65.64	722.04
722	29	6	8	3	4	compra	25	64.04	1601.00
723	285	65	3	2	5	merma	28	20.32	568.96
724	170	87	10	2	4	merma	18	84.19	1515.42
725	55	30	14	2	1	merma	30	94.09	2822.70
726	8	90	12	1	1	venta	30	90.03	2700.90
727	96	69	4	1	4	venta	14	13.33	186.62
728	104	24	4	3	2	venta	6	65.35	392.10
729	130	19	18	2	5	merma	26	97.41	2532.66
730	135	64	20	3	3	compra	18	94.03	1692.54
731	256	63	20	3	3	venta	12	46.69	560.28
732	17	5	16	3	1	merma	27	97.31	2627.37
733	37	78	16	1	4	compra	3	22.29	66.87
734	254	35	3	3	5	merma	19	51.90	986.10
735	345	45	10	2	2	venta	3	53.31	159.93
736	229	70	7	1	3	compra	24	11.49	275.76
737	268	65	4	1	5	compra	20	47.12	942.40
738	70	18	19	2	1	merma	2	60.08	120.16
739	110	20	16	1	3	merma	30	6.01	180.30
740	188	94	9	3	2	venta	15	40.69	610.35
741	21	33	20	2	1	merma	28	78.14	2187.92
742	88	59	10	1	4	venta	8	80.20	641.60
743	130	69	8	3	1	merma	10	59.22	592.20
744	73	69	5	1	2	merma	5	97.80	489.00
745	23	81	13	2	3	merma	19	66.03	1254.57
746	31	36	14	3	1	merma	20	96.16	1923.20
747	311	90	17	2	5	venta	13	82.69	1074.97
748	131	14	4	1	3	merma	8	21.81	174.48
749	32	55	11	2	4	merma	26	23.44	609.44
750	143	70	3	1	3	venta	6	47.18	283.08
751	51	91	8	2	4	venta	25	63.68	1592.00
752	308	50	8	2	5	compra	18	10.11	181.98
753	235	41	6	3	1	compra	28	98.46	2756.88
754	13	71	20	1	2	merma	28	38.20	1069.60
755	358	97	8	2	2	venta	16	17.44	279.04
756	293	91	4	2	2	compra	13	9.69	125.97
757	310	20	6	2	3	venta	23	9.29	213.67
758	75	81	16	1	2	venta	28	37.51	1050.28
759	341	58	13	2	2	compra	24	18.42	442.08
760	322	84	3	3	5	compra	15	9.28	139.20
761	141	91	4	1	2	venta	20	28.65	573.00
762	287	50	13	1	4	merma	9	57.93	521.37
763	9	17	2	1	4	compra	21	19.10	401.10
764	78	73	13	1	3	merma	12	86.59	1039.08
765	294	26	19	3	2	compra	5	53.45	267.25
766	12	60	15	1	3	compra	1	59.88	59.88
767	234	100	1	3	5	compra	25	98.29	2457.25
768	177	13	1	2	4	merma	26	99.96	2598.96
769	25	65	4	1	2	merma	18	32.07	577.26
770	343	44	13	2	3	compra	23	10.57	243.11
771	346	44	6	1	4	venta	5	85.64	428.20
772	355	35	20	3	4	venta	28	72.42	2027.76
773	351	94	11	2	2	merma	8	67.47	539.76
774	33	46	18	1	5	compra	20	7.99	159.80
775	250	35	8	2	3	venta	11	65.08	715.88
776	336	59	17	1	3	venta	5	93.05	465.25
777	257	35	16	1	5	venta	29	73.75	2138.75
778	57	16	7	1	1	merma	29	58.46	1695.34
779	203	29	4	2	5	compra	1	62.99	62.99
780	136	34	3	1	5	venta	20	92.90	1858.00
781	30	61	9	3	1	merma	27	32.09	866.43
782	15	52	3	1	4	merma	27	84.34	2277.18
783	174	12	14	2	2	venta	12	61.77	741.24
784	71	75	6	1	2	merma	28	53.60	1500.80
785	102	82	1	3	1	compra	1	51.47	51.47
786	307	67	7	3	4	merma	18	10.68	192.24
787	42	25	5	2	5	merma	13	77.45	1006.85
788	41	58	9	1	5	venta	26	41.47	1078.22
789	290	99	20	2	4	merma	13	52.25	679.25
790	173	41	4	3	2	merma	3	67.40	202.20
791	284	38	19	1	1	compra	10	72.76	727.60
792	71	41	13	1	4	venta	21	64.96	1364.16
793	288	52	2	1	5	compra	23	99.87	2297.01
794	179	45	4	1	2	compra	4	23.76	95.04
795	98	95	11	3	2	compra	8	97.32	778.56
796	216	38	9	2	3	merma	13	41.03	533.39
797	22	83	10	3	1	venta	1	7.76	7.76
798	281	40	6	1	5	compra	11	54.91	604.01
799	297	7	16	2	3	venta	11	77.41	851.51
800	100	61	4	2	4	venta	12	18.80	225.60
801	220	92	3	2	2	compra	10	53.88	538.80
802	168	31	20	2	2	venta	3	38.64	115.92
803	28	29	17	1	1	venta	17	37.31	634.27
804	35	86	13	1	2	venta	29	8.49	246.21
805	245	82	2	2	5	merma	18	96.90	1744.20
806	168	2	1	2	5	venta	5	84.06	420.30
807	349	21	2	1	4	venta	2	73.07	146.14
808	110	71	13	1	3	merma	5	61.36	306.80
809	244	74	18	1	5	compra	9	26.32	236.88
810	199	74	18	3	3	compra	22	68.58	1508.76
811	134	46	16	3	2	merma	17	76.95	1308.15
812	345	78	6	2	2	merma	17	9.53	162.01
813	250	50	12	3	5	compra	30	70.30	2109.00
814	133	92	5	2	3	compra	24	66.38	1593.12
815	348	54	15	3	5	compra	29	12.68	367.72
816	29	30	1	2	1	venta	13	5.35	69.55
817	144	70	9	1	5	venta	13	63.93	831.09
818	135	11	14	2	1	merma	21	13.52	283.92
819	347	66	17	1	2	merma	12	95.82	1149.84
820	309	62	19	1	2	compra	8	41.58	332.64
821	40	57	2	3	2	compra	15	5.04	75.60
822	7	28	15	1	5	compra	28	71.23	1994.44
823	124	4	18	3	2	compra	27	22.43	605.61
824	120	63	12	2	1	venta	28	6.04	169.12
825	200	3	12	2	3	compra	19	50.45	958.55
826	77	54	15	3	5	merma	7	79.02	553.14
827	81	100	11	1	5	compra	6	41.94	251.64
828	4	91	14	1	1	venta	18	49.30	887.40
829	357	83	19	3	3	merma	7	59.79	418.53
830	199	44	14	2	4	merma	3	88.01	264.03
831	167	18	13	1	5	compra	11	93.77	1031.47
832	272	98	17	2	1	venta	26	65.16	1694.16
833	173	50	18	2	2	merma	24	86.24	2069.76
834	173	70	18	3	1	merma	28	56.24	1574.72
835	117	47	18	1	3	venta	14	50.96	713.44
836	16	19	2	2	2	venta	3	46.84	140.52
837	287	6	12	2	2	compra	25	7.00	175.00
838	357	39	3	3	5	venta	5	76.02	380.10
839	210	71	6	3	3	merma	30	90.03	2700.90
840	139	75	13	3	5	merma	21	64.56	1355.76
841	84	8	15	2	2	venta	25	68.31	1707.75
842	127	47	4	3	3	compra	26	93.41	2428.66
843	83	56	18	2	4	compra	24	84.68	2032.32
844	146	92	11	2	4	venta	5	90.00	450.00
845	217	96	17	2	4	compra	23	97.96	2253.08
846	2	96	17	3	4	venta	3	21.62	64.86
847	274	69	14	2	3	venta	27	41.57	1122.39
848	62	55	2	3	5	merma	16	67.70	1083.20
849	344	65	10	1	3	merma	7	42.05	294.35
850	302	13	17	2	1	merma	28	38.15	1068.20
851	258	48	20	1	3	merma	18	82.46	1484.28
852	282	8	3	1	1	venta	18	9.33	167.94
853	87	43	13	1	3	merma	23	89.94	2068.62
854	247	95	8	3	4	venta	17	71.94	1222.98
855	300	43	6	2	5	compra	20	73.40	1468.00
856	159	70	16	2	2	compra	24	90.52	2172.48
857	209	52	11	3	2	compra	6	20.03	120.18
858	78	91	7	3	4	venta	17	71.79	1220.43
859	358	55	11	2	4	compra	9	82.94	746.46
860	306	55	8	2	5	merma	21	93.02	1953.42
861	76	9	2	2	4	merma	28	77.78	2177.84
862	201	8	16	3	4	compra	17	71.21	1210.57
863	296	70	12	2	3	venta	3	83.35	250.05
864	347	65	11	2	1	merma	11	36.06	396.66
865	203	86	12	3	4	venta	15	84.11	1261.65
866	177	77	14	2	1	merma	23	24.44	562.12
867	1	6	20	1	2	compra	30	74.38	2231.40
868	163	66	11	2	2	venta	14	19.97	279.58
869	284	67	20	1	2	compra	19	45.03	855.57
870	132	66	20	1	1	venta	25	79.09	1977.25
871	238	49	19	2	2	venta	15	91.01	1365.15
872	244	25	10	2	2	merma	19	88.64	1684.16
873	182	14	7	1	2	venta	30	90.92	2727.60
874	111	21	16	2	5	venta	7	25.75	180.25
875	38	47	19	3	5	merma	25	52.02	1300.50
876	187	76	2	3	2	compra	2	35.38	70.76
877	283	34	6	2	1	venta	2	21.33	42.66
878	191	36	5	3	4	merma	3	19.69	59.07
879	94	49	19	2	3	merma	1	86.14	86.14
880	287	83	10	2	1	compra	9	6.93	62.37
881	229	82	7	2	1	merma	18	64.65	1163.70
882	201	100	12	3	3	merma	8	42.87	342.96
883	69	67	10	1	1	merma	7	54.80	383.60
884	61	10	20	2	5	venta	5	87.49	437.45
885	289	9	12	3	4	merma	2	19.49	38.98
886	365	70	10	3	1	venta	14	77.64	1086.96
887	171	100	20	1	2	compra	12	32.41	388.92
888	6	6	11	3	1	venta	5	12.27	61.35
889	49	9	9	3	4	compra	23	80.47	1850.81
890	96	44	6	3	2	compra	29	61.27	1776.83
891	177	61	16	2	2	venta	18	19.93	358.74
892	158	58	14	2	5	venta	15	83.89	1258.35
893	60	63	2	2	2	compra	16	38.14	610.24
894	85	63	1	2	2	merma	2	35.47	70.94
895	185	47	12	3	1	compra	18	66.44	1195.92
896	96	62	1	2	3	compra	14	61.73	864.22
897	100	77	15	2	2	compra	8	65.85	526.80
898	256	94	11	3	4	merma	28	15.08	422.24
899	74	81	3	3	4	merma	22	8.18	179.96
900	100	21	17	1	1	venta	5	54.39	271.95
901	354	56	10	3	1	merma	5	11.32	56.60
902	200	94	16	2	4	compra	14	27.95	391.30
903	152	9	14	3	4	venta	14	80.88	1132.32
904	270	6	2	3	5	compra	12	19.77	237.24
905	322	98	2	1	2	venta	4	15.68	62.72
906	292	51	4	1	5	compra	17	34.50	586.50
907	243	36	4	3	1	venta	8	15.27	122.16
908	110	60	18	3	2	merma	3	9.15	27.45
909	116	3	20	1	1	compra	20	65.21	1304.20
910	241	11	11	3	5	compra	18	58.90	1060.20
911	235	64	7	1	1	venta	5	69.92	349.60
912	137	2	8	1	1	venta	6	86.98	521.88
913	263	93	15	3	3	compra	15	94.68	1420.20
914	225	82	5	3	3	venta	7	50.77	355.39
915	220	17	20	1	3	venta	24	80.74	1937.76
916	214	55	9	3	2	venta	21	12.49	262.29
917	273	61	14	1	4	compra	30	14.70	441.00
918	81	47	3	1	1	compra	29	35.83	1039.07
919	309	35	16	2	5	compra	6	36.33	217.98
920	241	78	18	3	1	venta	28	38.41	1075.48
921	207	90	19	1	5	compra	24	90.11	2162.64
922	142	3	14	1	3	merma	29	27.58	799.82
923	42	31	2	3	5	compra	28	97.14	2719.92
924	38	84	18	2	5	venta	11	52.40	576.40
925	247	13	3	2	2	venta	9	18.78	169.02
926	215	81	12	2	5	compra	8	59.44	475.52
927	248	71	7	2	2	compra	25	82.49	2062.25
928	3	92	15	3	5	compra	24	20.87	500.88
929	321	43	16	2	1	compra	21	7.09	148.89
930	53	62	16	2	4	merma	10	77.10	771.00
931	249	85	16	3	4	compra	26	41.40	1076.40
932	342	74	10	1	4	venta	30	80.27	2408.10
933	231	64	20	1	1	compra	23	92.61	2130.03
934	91	88	4	1	4	venta	29	69.38	2012.02
935	336	65	5	2	3	merma	3	85.68	257.04
936	277	23	18	2	4	venta	17	82.46	1401.82
937	233	94	19	1	3	merma	28	56.13	1571.64
938	204	63	20	1	1	merma	25	84.83	2120.75
939	111	51	18	3	3	venta	10	83.22	832.20
940	203	3	12	2	1	merma	11	49.51	544.61
941	239	25	1	1	1	merma	29	21.23	615.67
942	312	84	14	3	2	venta	23	17.33	398.59
943	171	56	3	1	1	venta	7	19.75	138.25
944	142	35	14	2	2	venta	23	5.68	130.64
945	167	33	12	2	4	merma	23	63.82	1467.86
946	119	12	7	1	1	venta	6	61.77	370.62
947	53	77	2	2	1	venta	13	56.30	731.90
948	75	71	20	2	1	venta	16	15.54	248.64
949	143	32	12	3	4	venta	21	33.80	709.80
950	70	11	3	1	3	venta	15	58.50	877.50
951	60	96	9	3	1	compra	15	39.51	592.65
952	204	97	15	1	3	merma	12	66.87	802.44
953	127	86	5	1	2	venta	28	89.05	2493.40
954	276	69	9	1	5	compra	10	18.69	186.90
955	211	60	2	1	2	compra	9	96.26	866.34
956	36	16	15	2	5	venta	18	87.77	1579.86
957	54	75	18	1	3	merma	8	18.63	149.04
958	329	58	13	2	2	venta	19	89.48	1700.12
959	214	70	12	3	5	merma	15	27.93	418.95
960	204	38	6	3	2	venta	18	92.99	1673.82
961	22	74	16	3	1	merma	1	20.55	20.55
962	216	42	19	2	2	venta	12	68.04	816.48
963	83	14	13	3	2	venta	18	75.80	1364.40
964	77	87	3	1	2	compra	24	90.57	2173.68
965	273	68	8	2	2	compra	9	37.87	340.83
966	353	38	9	2	5	compra	15	31.79	476.85
967	110	32	9	3	5	merma	26	93.77	2438.02
968	154	84	7	3	2	venta	24	19.60	470.40
969	17	31	4	2	5	compra	1	27.10	27.10
970	144	96	7	2	4	venta	20	73.14	1462.80
971	240	19	12	3	5	merma	6	9.85	59.10
972	34	33	15	3	3	merma	18	57.23	1030.14
973	204	87	2	1	1	venta	11	58.25	640.75
974	258	1	3	3	5	merma	9	94.49	850.41
975	360	92	14	2	1	merma	13	72.05	936.65
976	60	33	8	2	1	merma	29	44.82	1299.78
977	99	57	3	1	5	venta	20	33.29	665.80
978	215	85	18	1	4	merma	27	22.53	608.31
979	179	29	6	2	4	compra	13	76.54	995.02
980	262	58	18	1	4	compra	24	43.27	1038.48
981	318	34	10	1	5	venta	8	69.79	558.32
982	331	58	18	1	2	merma	19	28.36	538.84
983	168	24	14	2	4	compra	21	68.23	1432.83
984	354	24	5	2	2	venta	3	67.47	202.41
985	81	66	14	1	4	venta	10	19.84	198.40
986	291	31	8	1	4	merma	10	86.58	865.80
987	335	62	8	3	1	venta	11	66.95	736.45
988	39	49	8	2	1	merma	19	66.64	1266.16
989	294	67	12	2	2	compra	4	13.03	52.12
990	120	87	17	2	3	compra	22	54.53	1199.66
991	333	63	16	1	1	compra	29	60.49	1754.21
992	363	7	10	3	5	merma	11	56.35	619.85
993	112	48	12	3	4	venta	2	96.50	193.00
994	8	90	5	2	3	merma	17	75.31	1280.27
995	330	64	16	1	5	merma	1	47.31	47.31
996	231	19	8	1	1	compra	9	10.74	96.66
997	103	47	13	3	1	venta	10	37.08	370.80
998	235	76	18	3	1	compra	18	78.41	1411.38
999	363	24	13	2	4	compra	1	51.69	51.69
1000	79	47	20	2	2	compra	15	76.25	1143.75
1001	23	53	13	1	2	merma	23	10.50	241.50
1002	36	8	7	3	1	merma	2	29.24	58.48
1003	301	22	3	1	5	compra	14	85.34	1194.76
1004	173	2	6	3	3	merma	22	39.18	861.96
1005	354	28	15	1	2	compra	18	91.77	1651.86
1006	45	90	9	1	2	venta	19	18.70	355.30
1007	346	93	4	2	4	compra	29	21.50	623.50
1008	8	24	16	2	2	merma	16	62.69	1003.04
1009	47	11	15	3	1	venta	13	14.41	187.33
1010	298	59	7	3	1	venta	13	56.19	730.47
1011	321	13	12	2	4	compra	16	83.64	1338.24
1012	273	54	14	3	4	venta	24	87.66	2103.84
1013	254	35	10	3	3	venta	30	79.41	2382.30
1014	278	60	13	1	5	compra	13	11.38	147.94
1015	40	43	20	1	4	compra	3	66.12	198.36
1016	187	65	12	3	3	merma	24	84.08	2017.92
1017	296	50	8	3	1	merma	9	35.72	321.48
1018	266	50	3	3	2	compra	28	19.44	544.32
1019	172	87	19	2	1	venta	1	25.95	25.95
1020	283	8	20	3	5	compra	8	98.36	786.88
1021	220	10	12	3	3	compra	9	57.53	517.77
1022	364	34	11	1	2	merma	23	12.81	294.63
1023	104	25	5	1	5	venta	27	78.99	2132.73
1024	177	71	20	1	2	merma	28	67.28	1883.84
1025	252	44	3	3	1	venta	21	38.33	804.93
1026	174	49	19	2	1	merma	26	89.39	2324.14
1027	220	77	8	3	2	venta	3	47.37	142.11
1028	32	15	4	2	5	compra	24	73.66	1767.84
1029	45	40	9	3	4	merma	5	62.59	312.95
1030	103	15	8	3	3	venta	23	68.28	1570.44
1031	146	66	14	2	1	merma	19	78.50	1491.50
1032	101	95	12	2	5	merma	10	80.79	807.90
1033	124	60	17	1	5	merma	7	67.27	470.89
1034	119	23	13	2	3	compra	1	50.37	50.37
1035	167	63	2	1	1	merma	24	22.46	539.04
1036	209	24	4	3	4	compra	30	84.33	2529.90
1037	135	58	2	2	1	merma	23	6.38	146.74
1038	291	68	10	2	5	compra	22	45.86	1008.92
1039	282	45	16	2	4	compra	11	97.18	1068.98
1040	288	20	2	3	3	merma	4	88.39	353.56
1041	296	63	7	1	1	compra	21	47.55	998.55
1042	200	94	15	3	2	merma	1	96.15	96.15
1043	82	82	1	3	1	merma	8	86.49	691.92
1044	231	94	16	2	2	venta	23	85.64	1969.72
1045	67	10	9	1	5	venta	22	58.36	1283.92
1046	336	4	5	1	2	merma	10	20.48	204.80
1047	103	56	1	2	4	venta	7	37.27	260.89
1048	104	59	10	1	2	merma	27	75.40	2035.80
1049	108	82	20	1	1	venta	21	10.04	210.84
1050	353	44	16	1	2	merma	11	9.44	103.84
1051	233	22	10	1	4	venta	15	14.50	217.50
1052	194	47	7	2	3	merma	6	93.78	562.68
1053	182	88	7	2	3	venta	16	20.48	327.68
1054	39	17	1	1	3	compra	27	14.15	382.05
1055	136	5	14	2	5	merma	28	68.87	1928.36
1056	287	70	10	2	5	merma	11	40.63	446.93
1057	75	70	6	2	2	compra	21	8.64	181.44
1058	99	53	1	1	3	venta	17	88.34	1501.78
1059	325	62	2	3	3	venta	26	42.19	1096.94
1060	339	82	8	2	1	venta	27	59.55	1607.85
1061	135	97	5	1	1	merma	3	28.92	86.76
1062	185	33	6	1	2	compra	14	42.74	598.36
1063	273	36	5	2	5	compra	10	71.78	717.80
1064	45	7	6	1	4	compra	19	32.80	623.20
1065	297	71	1	3	3	compra	2	44.10	88.20
1066	41	75	12	1	3	merma	3	76.65	229.95
1067	87	20	14	3	2	venta	2	36.20	72.40
1068	19	63	14	2	2	compra	30	66.61	1998.30
1069	61	6	20	2	1	merma	5	43.53	217.65
1070	284	81	17	1	1	compra	7	96.37	674.59
1071	166	65	6	1	5	compra	1	40.10	40.10
1072	133	21	12	2	1	venta	2	16.35	32.70
1073	85	32	13	3	3	compra	2	43.88	87.76
1074	103	5	2	1	3	venta	2	37.78	75.56
1075	115	8	12	3	1	compra	7	60.70	424.90
1076	44	99	3	2	5	venta	12	27.01	324.12
1077	85	7	1	1	1	compra	23	14.18	326.14
1078	271	60	13	2	2	compra	27	28.53	770.31
1079	33	43	3	3	5	venta	22	75.61	1663.42
1080	197	31	15	1	3	compra	14	62.07	868.98
1081	128	72	7	1	1	merma	20	12.60	252.00
1082	26	25	8	2	2	merma	4	7.23	28.92
1083	23	59	12	2	4	compra	5	55.02	275.10
1084	24	9	17	1	3	venta	6	53.70	322.20
1085	204	11	7	1	5	compra	18	51.07	919.26
1086	237	43	13	1	1	venta	2	18.89	37.78
1087	43	3	1	1	5	compra	30	90.18	2705.40
1088	90	93	3	2	4	merma	7	73.63	515.41
1089	256	19	11	3	3	venta	6	19.69	118.14
1090	347	71	4	3	2	venta	21	56.07	1177.47
1091	359	38	3	2	2	compra	7	46.47	325.29
1092	277	41	10	1	5	compra	22	14.75	324.50
1093	281	45	9	1	4	venta	26	48.59	1263.34
1094	282	43	1	2	2	compra	19	96.06	1825.14
1095	142	64	18	3	5	merma	5	18.24	91.20
1096	340	56	17	1	4	merma	5	44.65	223.25
1097	274	76	16	2	5	merma	22	14.48	318.56
1098	240	24	13	1	2	venta	30	11.38	341.40
1099	13	82	5	2	1	venta	8	93.75	750.00
1100	191	16	17	2	2	merma	4	53.87	215.48
1101	131	42	18	1	3	merma	1	95.77	95.77
1102	189	23	17	3	1	compra	13	15.97	207.61
1103	122	87	4	3	4	venta	23	80.61	1854.03
1104	235	46	7	3	3	compra	18	97.42	1753.56
1105	129	22	6	3	3	merma	12	49.90	598.80
1106	332	55	15	3	5	compra	21	12.42	260.82
1107	294	42	6	3	1	venta	30	63.05	1891.50
1108	248	78	7	3	3	venta	18	81.22	1461.96
1109	9	75	2	1	3	merma	2	35.19	70.38
1110	156	89	2	1	4	merma	7	75.72	530.04
1111	203	12	3	3	5	merma	20	61.70	1234.00
1112	242	55	7	3	2	venta	26	66.95	1740.70
1113	156	85	1	2	3	compra	2	21.46	42.92
1114	103	45	7	2	3	merma	27	50.70	1368.90
1115	233	26	5	2	2	venta	13	43.22	561.86
1116	274	24	7	1	1	venta	3	18.29	54.87
1117	128	35	20	2	3	merma	24	35.78	858.72
1118	97	93	1	3	2	merma	18	49.07	883.26
1119	153	93	5	2	3	compra	12	90.94	1091.28
1120	341	33	19	1	1	venta	3	82.72	248.16
1121	24	6	4	3	1	compra	29	87.10	2525.90
1122	176	8	12	2	4	compra	24	79.35	1904.40
1123	357	10	12	3	1	merma	21	92.00	1932.00
1124	195	30	6	2	4	compra	15	84.04	1260.60
1125	195	63	12	2	2	merma	16	76.42	1222.72
1126	80	89	18	3	1	merma	25	24.04	601.00
1127	282	70	10	3	2	venta	29	20.00	580.00
1128	66	36	7	2	3	merma	13	99.85	1298.05
1129	198	35	19	1	1	merma	3	79.27	237.81
1130	28	81	9	2	2	compra	17	41.21	700.57
1131	3	64	9	3	4	merma	6	33.53	201.18
1132	30	26	7	2	1	compra	8	75.69	605.52
1133	338	53	8	3	2	compra	29	57.40	1664.60
1134	125	6	16	1	2	venta	13	12.08	157.04
1135	191	36	18	2	4	compra	20	33.70	674.00
1136	216	19	19	1	2	venta	10	20.30	203.00
1137	87	71	3	2	2	compra	30	63.08	1892.40
1138	43	48	17	1	5	compra	25	94.06	2351.50
1139	48	71	20	3	5	venta	3	54.07	162.21
1140	84	1	3	2	2	merma	28	80.12	2243.36
1141	143	89	17	2	4	venta	27	45.81	1236.87
1142	129	11	11	2	4	compra	27	30.27	817.29
1143	65	82	6	3	3	venta	12	73.09	877.08
1144	40	95	19	1	1	merma	23	59.91	1377.93
1145	211	48	13	1	1	compra	8	30.04	240.32
1146	165	63	17	2	3	compra	30	96.66	2899.80
1147	54	69	6	1	1	merma	5	63.96	319.80
1148	292	93	9	3	4	venta	18	24.13	434.34
1149	320	67	17	1	5	venta	27	39.26	1060.02
1150	184	79	3	3	3	compra	28	62.78	1757.84
1151	153	69	16	1	1	compra	4	28.67	114.68
1152	60	69	3	2	3	compra	22	94.31	2074.82
1153	89	20	17	1	1	merma	19	44.63	847.97
1154	77	59	7	1	3	merma	11	32.37	356.07
1155	304	16	4	1	4	merma	17	93.86	1595.62
1156	360	1	19	1	4	compra	28	93.09	2606.52
1157	163	26	19	1	1	compra	2	85.52	171.04
1158	39	67	15	3	1	venta	14	7.48	104.72
1159	125	78	12	3	1	compra	13	93.75	1218.75
1160	282	21	13	2	4	venta	28	74.27	2079.56
1161	28	34	10	1	2	compra	21	73.56	1544.76
1162	243	67	18	3	4	compra	13	58.09	755.17
1163	234	34	18	1	2	compra	19	17.32	329.08
1164	47	91	19	1	3	compra	9	87.19	784.71
1165	100	55	3	1	2	venta	29	82.35	2388.15
1166	84	73	18	2	1	merma	5	15.76	78.80
1167	28	1	16	3	3	merma	26	6.15	159.90
1168	362	95	18	2	4	venta	3	26.75	80.25
1169	196	35	4	2	3	venta	25	33.20	830.00
1170	289	3	2	2	2	merma	9	57.18	514.62
1171	43	26	15	2	4	venta	20	54.05	1081.00
1172	218	49	2	1	4	venta	6	66.72	400.32
1173	21	10	6	2	4	merma	25	35.83	895.75
1174	15	45	7	3	4	venta	5	70.17	350.85
1175	249	23	1	2	3	venta	24	30.67	736.08
1176	356	7	18	3	3	merma	13	79.51	1033.63
1177	116	64	16	1	4	merma	26	77.25	2008.50
1178	261	54	16	1	5	venta	19	84.38	1603.22
1179	352	93	19	1	4	compra	6	32.19	193.14
1180	167	77	12	1	4	merma	4	98.71	394.84
1181	233	20	7	2	4	compra	2	60.69	121.38
1182	36	94	2	2	1	venta	1	86.85	86.85
1183	346	75	7	1	4	compra	8	62.82	502.56
1184	193	66	18	2	4	merma	17	45.89	780.13
1185	155	72	17	3	5	compra	29	42.34	1227.86
1186	210	23	5	3	2	venta	29	66.57	1930.53
1187	34	50	16	3	4	venta	15	21.04	315.60
1188	104	89	11	2	1	venta	24	41.87	1004.88
1189	240	60	17	3	4	merma	17	74.67	1269.39
1190	176	66	4	1	2	venta	20	81.18	1623.60
1191	202	60	7	3	3	compra	8	58.27	466.16
1192	156	86	14	2	4	compra	6	61.84	371.04
1193	166	3	12	2	4	compra	19	58.25	1106.75
1194	124	80	20	3	5	venta	1	14.69	14.69
1195	121	46	12	3	2	merma	20	69.59	1391.80
1196	68	91	2	2	3	merma	10	96.44	964.40
1197	194	58	9	2	3	merma	16	71.65	1146.40
1198	184	26	19	2	3	merma	5	38.45	192.25
1199	271	23	1	1	1	merma	15	91.32	1369.80
1200	166	75	8	3	5	compra	20	48.55	971.00
1201	25	93	19	3	4	merma	28	87.21	2441.88
1202	358	76	17	3	2	venta	11	82.89	911.79
1203	100	19	16	3	1	merma	19	80.21	1523.99
1204	199	61	14	2	1	merma	15	99.99	1499.85
1205	162	33	6	3	2	venta	18	16.50	297.00
1206	129	45	18	2	1	compra	29	29.34	850.86
1207	302	22	17	2	1	compra	26	32.69	849.94
1208	300	51	9	1	3	venta	20	5.12	102.40
1209	303	77	11	2	3	compra	7	97.87	685.09
1210	9	17	14	1	4	merma	30	59.47	1784.10
1211	148	46	2	2	3	merma	30	15.32	459.60
1212	120	89	10	1	5	venta	1	29.38	29.38
1213	291	20	3	3	2	merma	30	70.87	2126.10
1214	128	34	5	1	4	venta	19	72.80	1383.20
1215	20	69	11	1	3	merma	13	29.50	383.50
1216	109	41	11	1	3	compra	15	8.56	128.40
1217	194	41	16	1	4	venta	1	36.43	36.43
1218	39	53	15	2	3	merma	13	96.81	1258.53
1219	39	41	16	1	5	venta	12	85.60	1027.20
1220	85	69	10	3	5	venta	7	65.81	460.67
1221	301	46	10	3	4	venta	1	55.39	55.39
1222	314	97	14	3	2	venta	27	68.24	1842.48
1223	234	26	15	1	4	compra	24	56.14	1347.36
1224	122	19	12	2	3	venta	17	35.72	607.24
1225	104	78	20	3	4	merma	5	68.76	343.80
1226	41	70	2	3	3	compra	10	10.87	108.70
1227	22	23	9	2	4	venta	23	63.26	1454.98
1228	338	45	18	3	5	venta	30	89.33	2679.90
1229	212	35	17	1	4	merma	26	31.73	824.98
1230	242	74	14	2	3	venta	12	36.45	437.40
1231	308	85	5	3	1	merma	1	21.84	21.84
1232	169	40	17	3	2	merma	16	12.47	199.52
1233	138	59	4	1	5	compra	10	22.93	229.30
1234	149	47	10	3	2	venta	11	80.19	882.09
1235	345	52	6	3	4	compra	30	78.71	2361.30
1236	147	79	2	3	1	merma	5	92.78	463.90
1237	212	84	11	3	2	compra	5	88.69	443.45
1238	207	93	9	1	2	compra	12	18.10	217.20
1239	139	96	5	1	4	compra	12	50.60	607.20
1240	206	27	3	1	5	compra	18	48.27	868.86
1241	190	3	8	1	5	compra	19	61.36	1165.84
1242	343	84	13	1	3	merma	16	33.15	530.40
1243	181	55	14	1	4	venta	3	35.53	106.59
1244	220	37	16	3	1	venta	17	49.83	847.11
1245	351	13	14	1	3	merma	2	60.64	121.28
1246	236	39	11	1	3	venta	7	84.96	594.72
1247	135	27	13	1	3	merma	25	37.40	935.00
1248	29	35	2	2	3	merma	27	61.55	1661.85
1249	115	83	19	1	3	compra	1	81.16	81.16
1250	5	86	7	1	1	venta	6	21.91	131.46
1251	298	91	3	2	5	venta	25	40.45	1011.25
1252	115	51	20	2	4	merma	1	26.07	26.07
1253	223	35	14	1	4	merma	21	10.00	210.00
1254	16	42	15	1	1	merma	2	36.80	73.60
1255	25	99	18	2	1	venta	16	63.78	1020.48
1256	129	44	10	1	1	merma	12	43.93	527.16
1257	270	96	12	1	4	compra	18	29.19	525.42
1258	256	85	8	1	3	venta	17	35.44	602.48
1259	321	70	11	3	1	compra	24	74.00	1776.00
1260	243	85	2	2	3	merma	14	38.67	541.38
1261	335	13	11	3	4	compra	29	97.40	2824.60
1262	105	14	13	3	1	merma	21	96.81	2033.01
1263	171	17	10	1	5	compra	19	65.23	1239.37
1264	194	10	14	1	5	venta	28	93.98	2631.44
1265	252	71	12	2	4	compra	9	76.22	685.98
1266	324	45	12	3	2	compra	17	89.36	1519.12
1267	342	74	13	1	4	venta	28	44.86	1256.08
1268	213	69	18	3	2	merma	2	23.25	46.50
1269	211	87	5	2	1	venta	10	89.86	898.60
1270	174	62	10	1	2	merma	24	82.72	1985.28
1271	311	18	4	3	2	merma	4	88.46	353.84
1272	98	15	7	2	5	compra	8	45.28	362.24
1273	250	40	19	3	1	compra	1	17.37	17.37
1274	308	50	14	2	5	compra	12	38.83	465.96
1275	51	65	7	3	4	venta	16	66.41	1062.56
1276	352	52	9	1	4	venta	14	5.42	75.88
1277	101	54	9	3	1	venta	10	46.17	461.70
1278	90	23	15	3	4	compra	16	43.65	698.40
1279	147	59	16	1	5	compra	19	5.27	100.13
1280	70	22	2	2	2	merma	6	59.58	357.48
1281	206	57	18	3	4	merma	30	89.41	2682.30
1282	45	87	20	2	5	venta	28	64.73	1812.44
1283	4	97	16	1	4	venta	28	95.06	2661.68
1284	273	41	17	1	5	merma	14	8.16	114.24
1285	176	41	8	3	2	merma	5	59.36	296.80
1286	284	2	20	1	4	merma	17	45.49	773.33
1287	227	41	2	2	1	compra	20	30.22	604.40
1288	216	87	1	3	3	merma	20	73.39	1467.80
1289	360	70	8	2	4	compra	9	94.51	850.59
1290	325	36	4	1	5	venta	4	84.02	336.08
1291	102	33	15	3	1	compra	2	14.72	29.44
1292	86	54	9	3	4	venta	9	60.80	547.20
1293	296	2	11	3	2	compra	15	51.75	776.25
1294	190	21	15	3	3	merma	4	49.56	198.24
1295	363	19	3	2	4	merma	10	41.47	414.70
1296	223	52	20	3	4	compra	22	6.22	136.84
1297	256	58	7	2	1	venta	10	94.76	947.60
1298	239	89	20	1	5	compra	3	42.74	128.22
1299	97	53	20	1	4	venta	5	94.69	473.45
1300	242	93	8	2	4	compra	25	52.01	1300.25
1301	343	44	15	3	5	compra	4	84.33	337.32
1302	167	26	6	3	1	compra	19	83.26	1581.94
1303	91	1	15	2	3	merma	20	65.47	1309.40
1304	208	83	20	2	2	compra	9	29.49	265.41
1305	32	73	5	1	5	compra	13	83.05	1079.65
1306	14	66	12	1	4	venta	1	31.71	31.71
1307	225	98	16	1	2	merma	30	53.09	1592.70
1308	245	41	4	1	3	merma	8	85.78	686.24
1309	113	62	18	3	4	merma	16	57.42	918.72
1310	286	47	12	3	5	merma	13	25.61	332.93
1311	1	48	13	2	4	venta	20	68.16	1363.20
1312	350	39	7	2	1	compra	18	6.39	115.02
1313	314	46	5	1	2	venta	10	29.39	293.90
1314	322	34	10	1	3	venta	26	23.79	618.54
1315	202	15	14	3	4	venta	24	49.07	1177.68
1316	283	54	2	1	2	venta	26	26.20	681.20
1317	309	74	20	2	5	venta	27	13.56	366.12
1318	282	8	1	1	5	compra	16	45.00	720.00
1319	339	84	8	3	5	compra	13	22.66	294.58
1320	222	18	8	1	5	compra	30	9.95	298.50
1321	83	24	2	2	1	venta	25	7.27	181.75
1322	363	78	2	2	5	merma	29	65.35	1895.15
1323	210	31	15	1	5	venta	5	28.22	141.10
1324	294	85	1	3	1	venta	21	91.68	1925.28
1325	149	57	1	3	3	compra	9	32.62	293.58
1326	205	10	7	2	3	venta	5	88.83	444.15
1327	98	13	10	2	3	venta	15	31.00	465.00
1328	342	64	14	3	5	compra	6	93.37	560.22
1329	332	54	13	1	1	merma	24	89.40	2145.60
1330	49	37	18	3	5	venta	28	50.16	1404.48
1331	99	76	1	2	5	merma	7	13.71	95.97
1332	95	34	11	1	5	compra	1	8.55	8.55
1333	188	59	19	3	4	venta	3	51.64	154.92
1334	184	60	17	2	2	compra	11	26.11	287.21
1335	213	27	16	1	2	merma	12	8.78	105.36
1336	193	17	19	2	5	venta	11	61.56	677.16
1337	78	36	6	1	1	compra	21	74.94	1573.74
1338	226	96	18	2	4	merma	9	53.16	478.44
1339	289	63	9	2	4	merma	23	7.83	180.09
1340	149	82	18	3	5	merma	17	39.82	676.94
1341	150	76	11	1	2	merma	22	46.87	1031.14
1342	65	2	10	2	2	venta	27	50.91	1374.57
1343	253	38	20	3	3	venta	28	74.77	2093.56
1344	138	67	9	3	2	venta	20	49.35	987.00
1345	36	74	12	3	1	merma	30	76.76	2302.80
1346	247	39	9	3	4	compra	24	93.21	2237.04
1347	348	71	3	1	3	merma	12	22.33	267.96
1348	253	50	5	1	4	venta	18	10.87	195.66
1349	21	13	8	1	1	venta	20	68.81	1376.20
1350	241	2	5	3	4	compra	10	81.06	810.60
1351	291	72	7	2	4	venta	8	60.62	484.96
1352	282	10	14	3	3	merma	1	90.35	90.35
1353	340	32	19	1	2	venta	2	90.16	180.32
1354	214	44	1	2	2	venta	1	91.95	91.95
1355	319	50	18	1	5	venta	6	69.83	418.98
1356	171	61	11	3	4	compra	24	53.53	1284.72
1357	113	100	17	3	1	compra	3	96.09	288.27
1358	257	36	17	2	5	venta	6	76.67	460.02
1359	244	5	19	2	4	venta	12	58.76	705.12
1360	341	63	16	3	2	merma	14	18.76	262.64
1361	254	61	19	1	5	merma	5	95.17	475.85
1362	68	58	8	1	1	merma	23	63.50	1460.50
1363	1	69	13	1	4	compra	8	50.24	401.92
1364	65	39	6	2	1	merma	19	53.32	1013.08
1365	43	69	2	2	4	venta	27	37.14	1002.78
1366	149	42	12	2	3	venta	16	85.94	1375.04
1367	311	45	4	3	5	venta	30	37.81	1134.30
1368	289	53	8	3	1	merma	13	92.75	1205.75
1369	195	53	14	1	4	venta	6	33.58	201.48
1370	163	38	16	3	4	venta	10	53.63	536.30
1371	91	43	3	2	5	compra	13	68.92	895.96
1372	88	70	14	3	1	venta	7	49.69	347.83
1373	194	23	13	2	3	venta	13	85.33	1109.29
1374	86	71	8	3	3	merma	28	95.06	2661.68
1375	96	76	12	1	5	venta	29	67.07	1945.03
1376	77	50	19	3	1	venta	1	74.30	74.30
1377	71	7	20	3	3	compra	11	75.18	826.98
1378	66	48	2	1	4	compra	14	42.79	599.06
1379	236	14	18	2	4	venta	29	6.25	181.25
1380	124	1	14	1	3	merma	1	54.14	54.14
1381	185	43	5	3	3	compra	2	34.08	68.16
1382	151	88	8	2	2	venta	4	75.12	300.48
1383	259	95	3	3	2	merma	14	40.17	562.38
1384	193	52	5	3	5	venta	15	6.30	94.50
1385	136	42	10	1	2	merma	30	22.60	678.00
1386	86	1	11	2	1	venta	11	44.94	494.34
1387	194	92	2	1	1	venta	16	9.37	149.92
1388	233	77	16	1	4	merma	17	30.91	525.47
1389	139	5	17	1	2	compra	26	79.26	2060.76
1390	226	90	15	2	3	merma	24	90.57	2173.68
1391	128	53	8	3	3	venta	29	57.01	1653.29
1392	31	23	13	1	3	merma	30	40.38	1211.40
1393	248	35	16	2	5	merma	17	70.96	1206.32
1394	270	31	20	1	3	compra	23	7.07	162.61
1395	365	3	20	3	4	venta	14	21.06	294.84
1396	266	77	17	1	4	compra	26	91.73	2384.98
1397	91	1	5	2	2	compra	25	64.28	1607.00
1398	318	42	18	2	5	merma	22	14.02	308.44
1399	272	20	20	3	3	venta	18	69.89	1258.02
1400	60	41	3	3	1	venta	14	23.23	325.22
1401	249	71	20	3	4	venta	28	91.73	2568.44
1402	183	33	10	2	5	compra	29	82.86	2402.94
1403	287	50	4	1	3	merma	4	64.18	256.72
1404	136	52	1	2	1	venta	24	80.70	1936.80
1405	148	28	12	3	4	venta	5	9.53	47.65
1406	319	11	5	2	4	merma	27	90.73	2449.71
1407	94	48	9	3	1	merma	21	93.60	1965.60
1408	130	69	5	3	2	merma	19	93.45	1775.55
1409	204	42	15	1	5	compra	7	81.67	571.69
1410	162	99	11	3	3	merma	28	8.68	243.04
1411	128	17	9	2	3	merma	8	94.94	759.52
1412	296	28	15	3	5	venta	25	40.40	1010.00
1413	358	37	12	3	4	compra	13	85.52	1111.76
1414	230	77	18	3	3	compra	14	38.84	543.76
1415	289	17	15	1	3	compra	9	60.90	548.10
1416	39	32	9	3	3	venta	1	68.86	68.86
1417	227	76	14	1	1	venta	23	49.74	1144.02
1418	225	80	19	1	2	merma	17	63.37	1077.29
1419	69	82	3	3	4	venta	23	24.54	564.42
1420	116	18	16	2	2	compra	13	81.63	1061.19
1421	323	44	15	1	3	compra	17	73.04	1241.68
1422	179	28	3	3	2	compra	22	39.14	861.08
1423	35	48	7	3	2	merma	30	23.90	717.00
1424	295	27	9	2	3	compra	28	71.75	2009.00
1425	131	34	5	1	2	merma	3	85.16	255.48
1426	313	42	11	2	3	venta	6	82.09	492.54
1427	61	77	1	1	3	merma	24	37.12	890.88
1428	45	41	17	1	1	compra	29	77.07	2235.03
1429	61	70	15	2	2	compra	14	13.59	190.26
1430	127	95	10	2	5	merma	30	19.02	570.60
1431	151	56	20	3	1	compra	3	89.46	268.38
1432	278	48	19	1	5	merma	26	57.85	1504.10
1433	257	75	3	3	4	venta	12	51.25	615.00
1434	209	87	3	1	2	merma	20	56.64	1132.80
1435	179	72	8	2	5	merma	3	49.32	147.96
1436	59	40	19	2	4	merma	18	29.75	535.50
1437	343	59	11	2	4	merma	6	23.85	143.10
1438	30	25	2	1	1	venta	29	87.96	2550.84
1439	226	93	3	1	5	merma	7	89.94	629.58
1440	167	63	17	3	1	compra	16	94.75	1516.00
1441	73	62	4	2	2	merma	9	48.81	439.29
1442	360	47	2	2	4	merma	27	50.99	1376.73
1443	152	97	5	2	4	merma	7	65.53	458.71
1444	14	24	18	1	3	merma	17	35.60	605.20
1445	216	10	19	2	4	merma	20	64.98	1299.60
1446	299	71	2	3	1	venta	25	97.76	2444.00
1447	147	29	19	1	3	venta	6	79.68	478.08
1448	128	63	10	2	4	merma	27	43.87	1184.49
1449	300	22	12	3	2	venta	2	10.11	20.22
1450	283	87	7	2	3	compra	15	18.92	283.80
1451	268	72	20	1	1	compra	5	79.86	399.30
1452	9	16	19	2	1	merma	6	96.73	580.38
1453	5	53	12	1	5	merma	7	55.01	385.07
1454	208	38	3	1	5	compra	18	83.69	1506.42
1455	51	40	18	1	3	compra	14	16.33	228.62
1456	340	84	13	1	3	merma	9	87.61	788.49
1457	131	50	8	3	5	venta	2	91.43	182.86
1458	29	30	10	3	4	merma	30	84.55	2536.50
1459	183	80	7	1	1	compra	18	30.04	540.72
1460	305	73	10	3	2	merma	16	98.07	1569.12
1461	164	43	14	1	4	compra	16	9.91	158.56
1462	179	71	5	3	1	merma	12	29.83	357.96
1463	214	74	4	2	5	merma	29	74.08	2148.32
1464	156	97	9	3	2	venta	22	83.00	1826.00
1465	315	86	19	2	3	merma	13	11.00	143.00
1466	6	26	18	1	4	venta	29	91.16	2643.64
1467	49	84	20	2	5	merma	28	75.01	2100.28
1468	32	66	10	2	4	merma	13	80.81	1050.53
1469	117	28	1	2	2	compra	17	47.77	812.09
1470	343	47	7	2	3	venta	30	46.89	1406.70
1471	36	69	9	2	2	merma	21	89.45	1878.45
1472	191	45	17	3	2	venta	15	31.87	478.05
1473	160	57	20	2	2	venta	11	22.95	252.45
1474	147	83	7	2	4	venta	15	24.69	370.35
1475	307	89	19	3	1	compra	9	5.47	49.23
1476	149	45	7	2	2	venta	12	55.99	671.88
1477	57	44	1	2	5	merma	27	60.85	1642.95
1478	281	42	5	3	1	merma	20	69.33	1386.60
1479	309	49	10	2	4	venta	10	11.94	119.40
1480	347	84	1	2	5	compra	6	77.84	467.04
1481	97	5	17	3	3	compra	3	95.80	287.40
1482	302	84	20	2	3	compra	19	10.69	203.11
1483	247	27	5	3	1	compra	26	94.02	2444.52
1484	25	30	1	1	3	compra	13	25.89	336.57
1485	148	53	13	3	5	compra	25	31.20	780.00
1486	306	30	2	1	2	venta	17	83.54	1420.18
1487	224	4	18	3	1	merma	17	40.02	680.34
1488	115	35	4	2	1	merma	24	77.24	1853.76
1489	104	41	9	1	4	merma	19	21.77	413.63
1490	164	87	6	2	2	compra	20	32.55	651.00
1491	259	82	16	1	4	compra	2	48.25	96.50
1492	91	32	14	2	5	compra	2	99.63	199.26
1493	293	28	17	1	3	merma	11	19.72	216.92
1494	156	99	3	2	5	venta	17	42.85	728.45
1495	277	29	19	3	2	compra	3	33.32	99.96
1496	78	97	15	2	3	compra	19	52.86	1004.34
1497	167	57	18	2	1	merma	12	72.60	871.20
1498	13	26	17	3	4	compra	22	79.23	1743.06
1499	324	4	2	1	2	venta	3	10.05	30.15
1500	205	4	13	2	1	merma	27	79.21	2138.67
1501	17	76	11	2	5	venta	16	63.79	1020.64
1502	177	12	8	1	3	merma	13	25.63	333.19
1503	15	44	6	1	3	compra	16	24.97	399.52
1504	91	96	12	1	5	compra	25	17.70	442.50
1505	210	78	11	2	2	merma	23	68.57	1577.11
1506	322	95	12	3	5	venta	23	13.22	304.06
1507	281	73	2	2	2	merma	27	74.59	2013.93
1508	246	50	8	2	5	compra	6	60.74	364.44
1509	213	30	5	3	2	merma	5	79.11	395.55
1510	68	33	12	3	4	compra	29	25.11	728.19
1511	136	51	9	3	3	merma	22	96.73	2128.06
1512	180	97	19	2	1	merma	6	30.69	184.14
1513	4	72	12	1	2	merma	17	94.02	1598.34
1514	220	56	9	3	1	venta	10	62.87	628.70
1515	96	81	14	1	4	compra	25	26.01	650.25
1516	143	23	6	2	4	merma	26	32.61	847.86
1517	79	12	20	1	3	compra	20	94.20	1884.00
1518	60	49	10	3	5	compra	25	30.60	765.00
1519	350	5	12	1	1	compra	17	36.45	619.65
1520	165	28	4	2	5	merma	16	92.61	1481.76
1521	129	31	8	2	1	venta	29	20.40	591.60
1522	107	83	5	2	3	compra	30	95.64	2869.20
1523	251	47	11	3	4	compra	17	15.42	262.14
1524	22	65	11	3	3	merma	29	80.26	2327.54
1525	78	44	13	2	5	merma	13	30.70	399.10
1526	304	63	6	3	1	venta	4	27.58	110.32
1527	236	48	13	1	1	venta	27	12.81	345.87
1528	109	39	13	1	1	merma	6	39.55	237.30
1529	84	20	13	3	4	venta	25	95.84	2396.00
1530	14	54	15	3	3	merma	27	81.06	2188.62
1531	317	51	9	2	3	compra	28	65.25	1827.00
1532	297	66	15	3	3	venta	8	66.66	533.28
1533	207	38	9	3	3	compra	20	68.43	1368.60
1534	330	82	13	2	3	compra	12	75.77	909.24
1535	20	61	2	2	2	merma	6	63.91	383.46
1536	96	98	5	1	4	venta	10	34.51	345.10
1537	198	89	4	3	1	merma	22	55.45	1219.90
1538	366	61	14	2	4	merma	15	70.79	1061.85
1539	78	14	12	1	1	merma	12	32.73	392.76
1540	143	27	16	3	1	compra	3	88.76	266.28
1541	130	64	14	1	5	venta	23	18.54	426.42
1542	348	48	17	1	1	merma	9	29.12	262.08
1543	82	6	18	3	4	merma	29	52.80	1531.20
1544	322	67	9	2	3	venta	15	82.64	1239.60
1545	220	25	2	2	3	merma	24	76.41	1833.84
1546	113	58	19	2	5	merma	14	62.84	879.76
1547	245	91	2	1	2	venta	21	63.54	1334.34
1548	247	91	1	1	3	compra	16	99.43	1590.88
1549	121	86	11	1	5	merma	25	11.63	290.75
1550	289	56	15	1	4	venta	16	58.04	928.64
1551	38	89	13	1	2	venta	8	8.55	68.40
1552	1	49	8	1	5	compra	11	41.01	451.11
1553	59	94	7	3	4	compra	25	96.34	2408.50
1554	239	86	7	2	2	merma	27	23.44	632.88
1555	242	100	17	3	2	compra	18	72.31	1301.58
1556	186	81	16	3	1	compra	8	32.96	263.68
1557	138	44	11	3	1	merma	8	67.47	539.76
1558	144	74	4	3	3	merma	11	81.42	895.62
1559	57	48	9	1	5	venta	6	25.74	154.44
1560	120	25	18	1	1	venta	29	23.28	675.12
1561	76	99	18	1	4	venta	5	29.72	148.60
1562	168	78	1	2	1	compra	14	91.98	1287.72
1563	28	21	10	3	4	merma	22	18.06	397.32
1564	310	38	5	3	3	merma	6	23.53	141.18
1565	106	19	10	3	1	compra	9	10.43	93.87
1566	293	82	15	3	5	venta	19	24.30	461.70
1567	146	18	18	3	5	venta	8	80.74	645.92
1568	141	80	8	2	4	merma	28	67.54	1891.12
1569	231	42	4	1	3	merma	28	11.55	323.40
1570	32	94	17	1	2	merma	29	60.64	1758.56
1571	56	38	8	2	1	compra	22	26.47	582.34
1572	324	62	6	1	5	merma	2	20.90	41.80
1573	343	40	7	1	1	merma	5	24.43	122.15
1574	15	16	19	1	1	compra	19	23.49	446.31
1575	303	55	19	3	1	merma	7	64.52	451.64
1576	259	51	6	3	2	venta	27	70.56	1905.12
1577	321	33	2	3	1	venta	18	56.11	1009.98
1578	119	72	2	2	4	compra	15	26.90	403.50
1579	48	72	14	2	4	compra	16	69.21	1107.36
1580	147	13	14	2	2	compra	12	86.09	1033.08
1581	93	66	7	1	5	venta	24	86.72	2081.28
1582	143	70	13	1	5	compra	26	18.30	475.80
1583	129	48	19	2	5	merma	14	72.25	1011.50
1584	88	60	14	3	2	compra	4	43.41	173.64
1585	142	26	8	1	2	compra	21	71.72	1506.12
1586	43	55	13	1	1	venta	21	34.38	721.98
1587	272	55	8	2	2	venta	19	75.02	1425.38
1588	304	81	8	2	3	venta	24	34.82	835.68
1589	324	47	20	1	5	merma	4	84.29	337.16
1590	239	90	12	2	4	venta	21	45.11	947.31
1591	190	73	19	2	5	merma	20	41.85	837.00
1592	204	57	19	3	3	merma	4	67.13	268.52
1593	42	49	15	2	5	venta	27	32.78	885.06
1594	207	22	18	3	5	venta	17	78.04	1326.68
1595	69	77	14	2	4	compra	7	58.08	406.56
1596	271	67	18	3	3	venta	21	25.73	540.33
1597	167	44	18	3	4	compra	22	46.36	1019.92
1598	105	11	19	2	5	compra	26	63.02	1638.52
1599	22	84	10	1	2	compra	8	76.05	608.40
1600	182	6	10	2	2	compra	27	82.48	2226.96
1601	231	3	16	1	3	compra	15	53.59	803.85
1602	202	46	12	2	2	merma	11	97.82	1076.02
1603	224	75	2	3	3	merma	14	71.97	1007.58
1604	125	16	1	2	3	merma	9	89.93	809.37
1605	345	7	12	1	5	venta	8	75.93	607.44
1606	82	42	6	1	3	venta	20	6.55	131.00
1607	271	15	7	3	2	merma	14	44.63	624.82
1608	113	28	13	2	1	merma	29	87.68	2542.72
1609	223	80	3	2	4	merma	5	86.26	431.30
1610	353	69	12	1	2	merma	12	42.53	510.36
1611	291	80	10	3	3	merma	5	53.56	267.80
1612	255	76	12	3	2	compra	9	62.79	565.11
1613	239	85	1	1	1	compra	11	77.04	847.44
1614	288	28	17	1	5	merma	14	5.85	81.90
1615	205	91	10	2	3	merma	1	92.73	92.73
1616	153	9	18	2	2	compra	23	86.94	1999.62
1617	339	2	11	1	2	venta	25	11.08	277.00
1618	206	44	16	2	5	merma	3	86.52	259.56
1619	104	27	16	2	1	merma	21	80.08	1681.68
1620	194	33	9	1	1	venta	7	79.31	555.17
1621	151	35	1	1	4	venta	21	43.75	918.75
1622	224	38	14	2	1	merma	18	93.94	1690.92
1623	234	95	3	1	2	venta	16	71.93	1150.88
1624	120	5	20	3	4	venta	13	22.92	297.96
1625	143	84	16	2	4	compra	8	27.43	219.44
1626	116	60	16	2	3	venta	23	5.63	129.49
1627	9	81	13	2	1	venta	16	6.08	97.28
1628	154	28	17	3	3	merma	24	61.39	1473.36
1629	300	66	16	2	3	merma	5	53.95	269.75
1630	167	65	2	3	4	compra	24	21.23	509.52
1631	350	58	3	1	2	venta	6	45.96	275.76
1632	242	5	4	3	2	merma	15	20.90	313.50
1633	340	30	5	1	2	merma	17	55.22	938.74
1634	191	8	1	3	1	merma	27	7.66	206.82
1635	169	69	10	1	1	merma	2	12.90	25.80
1636	128	95	9	2	3	venta	8	73.16	585.28
1637	33	65	19	3	4	venta	8	34.83	278.64
1638	216	47	11	3	4	merma	22	34.50	759.00
1639	143	86	18	1	3	compra	3	5.40	16.20
1640	239	6	12	2	5	compra	5	5.23	26.15
1641	8	39	2	2	3	venta	8	12.64	101.12
1642	33	10	15	1	1	merma	28	99.55	2787.40
1643	262	85	15	1	3	merma	18	24.30	437.40
1644	93	73	14	1	5	venta	20	15.64	312.80
1645	360	74	4	1	2	venta	20	98.83	1976.60
1646	206	69	9	1	5	merma	1	66.40	66.40
1647	364	74	17	2	1	compra	14	63.59	890.26
1648	312	33	2	2	1	merma	5	6.29	31.45
1649	289	24	13	1	4	merma	23	56.05	1289.15
1650	27	48	20	2	4	compra	21	71.88	1509.48
1651	135	77	11	3	5	merma	22	14.58	320.76
1652	197	8	4	2	2	merma	20	52.16	1043.20
1653	329	25	18	3	5	compra	18	8.46	152.28
1654	261	58	2	2	5	venta	4	20.82	83.28
1655	26	38	5	3	2	merma	11	81.25	893.75
1656	82	75	16	1	5	merma	27	40.15	1084.05
1657	236	3	14	1	2	venta	8	59.78	478.24
1658	86	78	10	2	1	venta	28	27.26	763.28
1659	70	64	8	1	2	compra	7	24.12	168.84
1660	88	42	4	2	3	compra	29	41.37	1199.73
1661	27	51	14	1	2	venta	11	15.89	174.79
1662	85	15	8	2	2	venta	21	25.86	543.06
1663	304	39	7	3	1	compra	6	67.33	403.98
1664	298	50	6	3	5	compra	27	33.15	895.05
1665	198	48	12	2	1	venta	8	73.28	586.24
1666	28	18	10	3	3	venta	10	94.42	944.20
1667	280	38	1	3	4	venta	17	70.77	1203.09
1668	196	18	17	1	4	merma	2	49.93	99.86
1669	69	2	17	2	2	merma	6	99.65	597.90
1670	41	90	7	1	1	venta	1	16.87	16.87
1671	45	36	8	1	2	merma	21	68.03	1428.63
1672	361	90	10	2	3	compra	7	54.41	380.87
1673	268	49	15	1	4	compra	27	68.99	1862.73
1674	175	86	12	1	5	compra	27	5.77	155.79
1675	40	39	2	2	1	merma	11	89.75	987.25
1676	116	94	4	3	5	merma	20	61.39	1227.80
1677	126	94	20	2	1	merma	28	9.44	264.32
1678	304	81	14	3	4	merma	6	90.73	544.38
1679	181	32	15	1	3	merma	26	10.36	269.36
1680	251	38	9	2	4	compra	26	12.09	314.34
1681	216	77	15	3	4	merma	12	18.45	221.40
1682	50	43	20	1	4	compra	11	72.17	793.87
1683	78	98	3	2	1	venta	15	43.85	657.75
1684	21	70	17	2	2	compra	7	23.00	161.00
1685	238	95	19	2	1	merma	22	86.84	1910.48
1686	351	3	5	2	5	merma	30	8.33	249.90
1687	49	66	11	3	1	compra	28	26.71	747.88
1688	204	75	11	1	4	venta	2	82.71	165.42
1689	363	47	19	3	5	venta	9	34.41	309.69
1690	20	61	6	2	3	compra	8	51.42	411.36
1691	155	33	7	1	4	merma	27	14.26	385.02
1692	63	47	16	1	4	compra	16	73.86	1181.76
1693	81	74	13	1	5	compra	9	62.73	564.57
1694	87	47	20	1	1	merma	10	90.28	902.80
1695	40	46	20	2	3	compra	16	56.91	910.56
1696	289	61	11	2	1	merma	29	5.65	163.85
1697	129	35	16	3	4	compra	13	75.57	982.41
1698	35	35	8	2	5	compra	4	23.84	95.36
1699	95	14	5	2	4	venta	9	67.35	606.15
1700	255	32	3	1	4	venta	29	93.30	2705.70
1701	355	14	8	1	3	venta	7	18.19	127.33
1702	315	99	10	2	1	merma	8	70.21	561.68
1703	13	55	16	3	5	venta	27	34.99	944.73
1704	251	50	3	2	4	venta	17	86.35	1467.95
1705	301	39	11	1	2	venta	11	92.89	1021.79
1706	193	83	9	3	2	merma	3	52.22	156.66
1707	246	12	13	2	2	venta	5	19.23	96.15
1708	345	29	3	3	3	merma	4	65.09	260.36
1709	219	58	4	3	2	merma	27	60.76	1640.52
1710	102	43	1	2	5	compra	18	56.13	1010.34
1711	191	15	11	3	4	merma	10	18.35	183.50
1712	36	34	7	1	4	venta	29	60.72	1760.88
1713	181	57	7	1	2	compra	12	20.43	245.16
1714	173	88	19	1	4	venta	11	38.13	419.43
1715	231	55	4	1	1	compra	16	5.13	82.08
1716	19	32	6	1	1	merma	12	77.97	935.64
1717	344	74	14	2	2	compra	13	96.83	1258.79
1718	347	21	13	2	1	venta	20	39.73	794.60
1719	288	8	10	1	1	merma	30	70.12	2103.60
1720	319	21	16	3	1	merma	24	25.03	600.72
1721	261	79	11	1	1	merma	5	77.28	386.40
1722	200	65	7	1	2	merma	15	71.94	1079.10
1723	321	63	14	3	1	merma	20	60.06	1201.20
1724	143	15	2	2	1	merma	30	40.47	1214.10
1725	3	62	18	1	2	venta	17	40.19	683.23
1726	69	100	7	3	3	compra	2	35.17	70.34
1727	106	72	17	2	5	merma	5	34.99	174.95
1728	2	27	16	3	2	compra	16	75.68	1210.88
1729	354	24	7	1	5	merma	15	32.98	494.70
1730	78	3	2	2	1	venta	6	93.79	562.74
1731	211	10	14	3	1	venta	11	66.43	730.73
1732	341	94	8	3	5	venta	17	10.51	178.67
1733	59	61	4	1	1	venta	12	43.12	517.44
1734	121	99	9	1	4	venta	8	19.35	154.80
1735	18	64	6	3	1	venta	17	81.98	1393.66
1736	185	66	2	3	1	venta	4	27.14	108.56
1737	146	34	8	1	2	compra	14	58.95	825.30
1738	98	55	13	2	5	merma	13	89.57	1164.41
1739	156	61	16	2	3	venta	29	76.04	2205.16
1740	304	87	17	2	4	merma	14	63.34	886.76
1741	212	76	12	3	5	venta	29	92.53	2683.37
1742	361	90	3	2	3	compra	30	47.23	1416.90
1743	28	39	6	2	3	merma	21	78.64	1651.44
1744	365	17	7	1	2	merma	2	92.02	184.04
1745	27	3	18	1	5	venta	10	30.46	304.60
1746	347	68	13	2	5	compra	29	72.20	2093.80
1747	313	65	1	1	2	venta	8	5.44	43.52
1748	13	18	12	2	1	compra	20	50.53	1010.60
1749	55	6	17	3	3	merma	14	87.43	1224.02
1750	41	4	10	3	2	venta	7	24.28	169.96
1751	91	62	15	1	1	venta	14	54.11	757.54
1752	144	32	18	1	1	venta	15	7.32	109.80
1753	248	15	16	2	1	merma	11	81.27	893.97
1754	148	52	9	3	3	compra	10	65.08	650.80
1755	92	40	5	1	2	merma	1	45.13	45.13
1756	312	70	2	2	1	venta	28	14.06	393.68
1757	149	69	20	1	3	compra	14	8.59	120.26
1758	108	94	5	3	3	venta	8	18.68	149.44
1759	314	90	17	1	5	merma	1	30.37	30.37
1760	308	51	12	2	5	venta	4	48.69	194.76
1761	357	26	7	1	3	venta	12	8.94	107.28
1762	292	49	19	1	1	merma	21	40.48	850.08
1763	221	17	12	2	1	compra	10	69.22	692.20
1764	86	64	5	2	3	merma	18	13.39	241.02
1765	365	56	3	3	3	merma	6	54.59	327.54
1766	56	92	1	3	1	venta	17	52.54	893.18
1767	157	96	19	2	3	merma	16	62.22	995.52
1768	317	32	6	3	3	merma	12	49.65	595.80
1769	168	77	6	3	2	venta	24	17.65	423.60
1770	219	52	19	2	5	merma	26	53.73	1396.98
1771	318	88	16	2	5	venta	14	23.80	333.20
1772	87	51	15	2	4	merma	10	42.49	424.90
1773	44	50	18	1	5	compra	24	20.45	490.80
1774	257	60	2	3	3	venta	6	47.50	285.00
1775	332	95	11	1	5	merma	20	12.37	247.40
1776	49	67	9	1	1	venta	17	55.06	936.02
1777	110	65	12	2	2	compra	15	88.02	1320.30
1778	269	67	11	2	1	compra	15	27.78	416.70
1779	363	69	9	2	5	venta	14	79.36	1111.04
1780	312	63	12	2	5	compra	7	99.36	695.52
1781	167	41	9	2	2	compra	1	40.11	40.11
1782	165	49	2	2	4	merma	1	57.89	57.89
1783	21	25	7	1	3	merma	25	67.10	1677.50
1784	215	31	7	3	2	merma	28	53.37	1494.36
1785	238	85	4	3	5	venta	25	69.72	1743.00
1786	262	78	20	3	5	venta	14	21.16	296.24
1787	342	31	5	3	3	compra	3	84.23	252.69
1788	188	23	20	3	1	compra	20	96.93	1938.60
1789	22	4	8	2	2	compra	2	8.38	16.76
1790	246	27	13	1	1	merma	9	80.67	726.03
1791	297	31	15	2	1	compra	3	69.10	207.30
1792	259	65	11	3	4	merma	9	31.50	283.50
1793	181	39	12	1	3	compra	9	86.54	778.86
1794	222	88	6	1	1	compra	19	62.37	1185.03
1795	214	72	1	1	1	venta	6	98.23	589.38
1796	156	85	10	3	5	compra	8	45.22	361.76
1797	97	21	15	1	2	compra	2	28.66	57.32
1798	183	63	9	2	1	venta	7	61.36	429.52
1799	243	43	19	2	1	compra	19	30.53	580.07
1800	15	16	16	1	2	merma	17	33.62	571.54
1801	88	14	16	2	2	merma	3	22.96	68.88
1802	240	43	14	2	5	merma	20	74.29	1485.80
1803	172	34	14	2	2	compra	25	66.71	1667.75
1804	331	3	17	2	4	venta	4	77.22	308.88
1805	189	15	17	3	3	compra	19	75.38	1432.22
1806	256	73	20	1	2	venta	16	88.37	1413.92
1807	210	43	19	3	3	venta	5	27.77	138.85
1808	168	81	8	1	5	compra	6	85.53	513.18
1809	16	49	17	3	5	venta	12	73.15	877.80
1810	186	80	12	3	1	compra	20	89.09	1781.80
1811	301	58	4	1	1	venta	13	67.87	882.31
1812	192	53	8	3	3	compra	19	66.12	1256.28
1813	93	23	4	1	3	merma	6	63.87	383.22
1814	316	84	1	2	1	merma	2	95.76	191.52
1815	89	66	18	3	4	merma	19	99.41	1888.79
1816	127	73	10	2	2	venta	23	55.74	1282.02
1817	215	46	3	2	4	merma	26	39.53	1027.78
1818	228	11	14	1	4	compra	4	66.48	265.92
1819	291	47	12	2	3	compra	12	27.24	326.88
1820	111	23	13	1	2	venta	9	49.38	444.42
1821	221	88	3	2	4	compra	27	49.22	1328.94
1822	176	11	13	3	5	merma	14	41.52	581.28
1823	210	77	15	3	3	venta	27	8.93	241.11
1824	118	83	6	3	1	merma	2	70.89	141.78
1825	363	39	8	3	1	venta	29	50.50	1464.50
1826	113	86	6	3	4	compra	8	36.46	291.68
1827	331	33	5	2	1	merma	22	99.37	2186.14
1828	162	46	1	1	1	compra	9	30.39	273.51
1829	330	41	7	2	4	venta	22	63.94	1406.68
1830	276	29	5	2	2	compra	2	27.71	55.42
1831	352	38	3	2	5	compra	11	67.09	737.99
1832	199	47	13	2	5	merma	13	60.26	783.38
1833	245	56	15	2	5	merma	6	87.79	526.74
1834	91	20	4	1	2	compra	11	5.36	58.96
1835	284	17	13	1	2	compra	11	54.71	601.81
1836	33	39	14	3	1	merma	6	55.43	332.58
1837	365	78	18	3	3	venta	11	11.76	129.36
1838	76	61	20	3	1	compra	11	46.17	507.87
1839	254	35	15	2	5	merma	21	31.55	662.55
1840	148	93	15	3	2	venta	17	25.51	433.67
1841	200	86	14	3	5	merma	26	47.92	1245.92
1842	68	49	13	2	5	merma	2	22.92	45.84
1843	199	26	6	1	4	merma	21	82.91	1741.11
1844	293	82	10	3	2	merma	1	53.90	53.90
1845	352	48	17	1	2	compra	1	89.63	89.63
1846	331	22	16	2	1	venta	12	6.27	75.24
1847	233	90	6	2	2	merma	11	84.99	934.89
1848	246	13	7	3	3	merma	7	95.12	665.84
1849	144	4	20	2	3	compra	12	43.74	524.88
1850	290	35	6	2	5	venta	19	28.29	537.51
1851	85	13	18	2	5	compra	1	11.90	11.90
1852	162	59	3	3	4	merma	5	44.22	221.10
1853	54	24	8	2	5	venta	11	31.24	343.64
1854	99	16	9	2	5	venta	4	74.81	299.24
1855	338	76	5	1	1	venta	15	39.22	588.30
1856	181	93	19	1	3	compra	29	29.27	848.83
1857	111	90	14	2	3	compra	18	27.44	493.92
1858	345	54	2	3	1	merma	23	95.99	2207.77
1859	247	86	9	1	2	venta	21	6.79	142.59
1860	330	81	10	1	1	merma	14	49.72	696.08
1861	224	91	20	1	1	compra	25	45.75	1143.75
1862	110	98	18	1	3	merma	4	14.58	58.32
1863	286	50	8	1	5	venta	14	42.55	595.70
1864	14	92	19	3	5	merma	5	55.08	275.40
1865	141	90	8	3	3	venta	8	17.89	143.12
1866	309	64	2	3	2	merma	11	93.82	1032.02
1867	175	13	12	2	1	merma	4	17.15	68.60
1868	18	13	3	1	4	compra	16	84.20	1347.20
1869	4	54	4	3	5	merma	10	37.46	374.60
1870	85	70	16	1	2	merma	28	34.48	965.44
1871	141	4	19	2	2	merma	9	43.26	389.34
1872	356	77	16	2	4	venta	11	69.03	759.33
1873	358	69	7	2	1	compra	4	43.84	175.36
1874	96	73	7	3	3	venta	2	98.85	197.70
1875	61	28	4	3	1	compra	4	52.33	209.32
1876	232	83	9	2	5	compra	5	68.90	344.50
1877	325	20	9	3	2	venta	4	7.32	29.28
1878	17	81	5	1	5	compra	18	60.49	1088.82
1879	92	55	13	1	1	compra	12	17.53	210.36
1880	248	2	10	3	2	venta	2	76.71	153.42
1881	183	63	17	3	5	merma	23	15.44	355.12
1882	330	20	9	1	5	venta	7	7.56	52.92
1883	77	50	6	1	2	venta	13	77.66	1009.58
1884	195	89	7	3	5	compra	23	6.09	140.07
1885	187	91	20	1	4	venta	7	70.33	492.31
1886	141	42	17	1	1	venta	5	69.57	347.85
1887	229	4	18	1	1	compra	15	54.41	816.15
1888	271	81	3	3	2	compra	5	39.64	198.20
1889	218	22	1	3	2	venta	11	59.21	651.31
1890	35	21	2	3	3	merma	19	50.26	954.94
1891	179	22	10	1	4	compra	4	61.48	245.92
1892	81	75	8	3	5	merma	19	28.83	547.77
1893	221	60	4	1	1	merma	12	90.68	1088.16
1894	121	16	2	1	5	venta	1	57.85	57.85
1895	291	6	16	2	2	venta	25	48.91	1222.75
1896	330	93	7	3	1	compra	8	85.54	684.32
1897	112	94	6	2	1	venta	8	6.57	52.56
1898	32	39	12	3	4	compra	30	65.06	1951.80
1899	147	41	9	3	2	compra	22	98.06	2157.32
1900	303	52	17	2	4	compra	7	48.97	342.79
1901	271	2	14	1	2	merma	1	88.09	88.09
1902	139	21	2	3	2	compra	4	36.58	146.32
1903	123	85	1	1	1	compra	3	96.18	288.54
1904	7	88	13	1	3	venta	25	99.52	2488.00
1905	204	13	15	2	5	merma	28	74.08	2074.24
1906	18	64	6	3	3	merma	22	63.42	1395.24
1907	81	69	9	1	5	compra	3	10.49	31.47
1908	83	38	16	1	1	venta	25	32.09	802.25
1909	271	25	3	1	4	merma	24	31.36	752.64
1910	159	65	11	3	4	merma	17	48.20	819.40
1911	52	41	19	1	2	venta	2	33.42	66.84
1912	84	96	16	2	3	compra	21	29.06	610.26
1913	119	37	15	1	3	compra	16	6.55	104.80
1914	197	15	16	1	2	venta	27	94.89	2562.03
1915	8	36	14	3	4	merma	18	30.44	547.92
1916	333	18	11	2	2	merma	26	53.44	1389.44
1917	72	57	16	1	1	compra	12	37.85	454.20
1918	277	84	20	1	5	merma	28	12.12	339.36
1919	246	14	2	1	1	compra	14	23.14	323.96
1920	19	66	16	3	5	venta	6	71.84	431.04
1921	334	40	9	3	1	venta	30	19.39	581.70
1922	350	23	13	2	5	compra	11	93.31	1026.41
1923	158	58	9	3	1	merma	4	38.47	153.88
1924	323	96	10	1	4	merma	16	16.83	269.28
1925	48	87	2	2	2	compra	30	80.48	2414.40
1926	163	19	18	1	4	merma	2	90.45	180.90
1927	262	66	18	3	1	merma	18	39.63	713.34
1928	12	64	2	2	5	compra	7	93.19	652.33
1929	228	87	6	1	1	merma	6	92.85	557.10
1930	336	93	8	2	1	venta	11	90.25	992.75
1931	224	77	8	2	2	merma	8	67.34	538.72
1932	355	80	12	3	5	venta	13	41.48	539.24
1933	230	28	10	3	1	merma	9	85.02	765.18
1934	91	37	17	2	5	compra	27	99.32	2681.64
1935	29	83	14	3	5	compra	3	51.90	155.70
1936	29	63	7	3	1	merma	21	35.11	737.31
1937	85	43	11	3	2	compra	3	31.36	94.08
1938	205	73	12	2	2	merma	11	18.20	200.20
1939	78	63	8	1	5	compra	21	39.99	839.79
1940	283	18	14	2	5	compra	19	69.80	1326.20
1941	149	92	17	3	5	merma	27	90.04	2431.08
1942	299	12	3	3	2	venta	13	85.39	1110.07
1943	89	71	13	2	4	compra	3	96.64	289.92
1944	117	88	9	1	3	merma	14	70.82	991.48
1945	143	9	2	2	5	merma	11	41.75	459.25
1946	172	26	1	1	2	venta	26	69.44	1805.44
1947	253	37	16	3	1	compra	9	90.61	815.49
1948	334	12	7	2	4	venta	1	23.86	23.86
1949	85	85	11	3	1	venta	10	95.24	952.40
1950	359	76	15	1	3	compra	10	89.87	898.70
1951	185	68	4	3	2	venta	4	22.21	88.84
1952	159	44	20	2	5	compra	1	8.33	8.33
1953	309	60	8	2	2	merma	29	6.00	174.00
1954	105	53	16	2	2	merma	21	63.46	1332.66
1955	264	44	4	1	3	compra	20	35.51	710.20
1956	292	98	16	3	3	merma	20	84.92	1698.40
1957	36	97	14	2	2	merma	12	6.33	75.96
1958	322	23	12	2	4	venta	3	8.69	26.07
1959	207	82	4	3	2	compra	5	65.36	326.80
1960	172	72	5	1	5	venta	16	34.33	549.28
1961	38	62	2	3	4	compra	12	86.59	1039.08
1962	150	17	2	3	3	compra	5	19.12	95.60
1963	291	44	20	1	1	venta	29	65.96	1912.84
1964	17	58	2	1	3	compra	9	40.05	360.45
1965	227	44	15	3	3	compra	22	34.81	765.82
1966	254	69	7	2	1	compra	6	66.35	398.10
1967	218	57	15	2	4	compra	29	11.30	327.70
1968	218	68	8	2	4	compra	9	29.90	269.10
1969	308	37	9	1	3	compra	20	40.18	803.60
1970	236	43	5	3	1	compra	21	22.33	468.93
1971	358	87	19	3	3	venta	26	43.76	1137.76
1972	85	54	6	2	3	merma	29	13.34	386.86
1973	151	96	8	2	3	merma	12	83.97	1007.64
1974	223	20	18	2	5	venta	18	85.19	1533.42
1975	178	35	5	2	4	compra	30	52.70	1581.00
1976	87	25	20	2	1	merma	24	5.11	122.64
1977	230	52	17	2	3	compra	26	23.05	599.30
1978	61	32	2	2	4	venta	18	46.20	831.60
1979	278	84	11	2	3	venta	3	22.11	66.33
1980	114	52	12	2	2	compra	18	51.15	920.70
1981	145	64	18	1	1	merma	22	86.31	1898.82
1982	312	30	19	1	5	merma	28	67.57	1891.96
1983	77	84	1	1	4	merma	30	27.20	816.00
1984	5	82	7	1	4	venta	15	16.98	254.70
1985	144	92	3	3	1	merma	29	95.71	2775.59
1986	214	73	6	3	5	compra	1	59.82	59.82
1987	309	15	16	3	1	merma	17	50.25	854.25
1988	64	28	17	3	2	compra	15	7.47	112.05
1989	40	53	13	3	4	compra	6	21.42	128.52
1990	364	24	12	3	3	venta	13	35.62	463.06
1991	55	17	10	3	4	compra	14	55.89	782.46
1992	159	6	5	1	1	venta	9	86.93	782.37
1993	204	82	20	1	3	venta	6	34.94	209.64
1994	120	64	5	3	3	compra	23	85.47	1965.81
1995	195	45	16	3	5	venta	30	84.93	2547.90
1996	213	81	16	2	5	compra	1	46.40	46.40
1997	98	26	18	1	3	compra	28	89.99	2519.72
1998	275	52	11	1	5	merma	17	47.86	813.62
1999	170	42	4	3	3	compra	2	7.94	15.88
2000	132	53	9	1	5	venta	25	53.47	1336.75
2001	37	88	5	1	5	compra	4	14.28	57.12
2002	163	5	3	2	3	merma	19	5.36	101.84
2003	216	82	9	1	5	merma	24	70.71	1697.04
2004	271	91	10	3	5	merma	16	21.44	343.04
2005	63	89	3	3	1	compra	9	44.97	404.73
2006	254	6	18	1	1	venta	23	7.72	177.56
2007	268	100	14	3	2	merma	12	92.19	1106.28
2008	131	15	17	2	4	merma	27	30.59	825.93
2009	121	31	7	3	1	merma	6	20.64	123.84
2010	185	93	15	2	1	compra	12	42.06	504.72
2011	226	75	2	2	3	venta	13	7.54	98.02
2012	44	67	1	1	5	merma	20	62.97	1259.40
2013	220	100	16	2	3	compra	4	20.17	80.68
2014	281	7	14	3	3	compra	5	34.97	174.85
2015	316	5	20	3	4	merma	11	59.43	653.73
2016	230	29	8	3	2	compra	18	97.94	1762.92
2017	290	16	9	2	1	compra	4	35.86	143.44
2018	38	40	1	3	1	merma	25	32.78	819.50
2019	310	79	10	3	3	compra	4	41.35	165.40
2020	78	6	19	3	5	venta	27	58.62	1582.74
2021	218	24	17	1	1	venta	10	81.32	813.20
2022	248	68	13	1	4	venta	26	65.62	1706.12
2023	359	30	13	3	1	compra	16	14.54	232.64
2024	278	24	16	2	4	compra	17	18.98	322.66
2025	48	60	3	2	2	compra	29	29.26	848.54
2026	312	3	17	3	4	merma	20	78.81	1576.20
2027	354	66	10	3	3	merma	23	31.23	718.29
2028	148	40	16	2	4	compra	13	89.18	1159.34
2029	343	25	7	3	5	compra	18	65.53	1179.54
2030	317	8	7	3	2	compra	7	26.59	186.13
2031	192	33	5	2	3	venta	27	15.71	424.17
2032	59	27	14	2	4	venta	13	87.77	1141.01
2033	8	55	17	2	5	compra	21	55.81	1172.01
2034	202	65	4	3	4	merma	6	23.01	138.06
2035	75	22	1	2	4	venta	27	70.44	1901.88
2036	345	29	1	3	5	venta	25	50.56	1264.00
2037	167	32	13	2	5	venta	2	7.68	15.36
2038	253	34	2	1	4	venta	30	62.44	1873.20
2039	338	67	15	2	5	venta	3	35.69	107.07
2040	96	31	9	1	5	compra	28	11.67	326.76
2041	71	89	17	3	1	merma	23	26.79	616.17
2042	247	6	10	1	1	compra	28	58.00	1624.00
2043	109	47	1	1	3	merma	23	84.06	1933.38
2044	199	26	14	3	5	merma	8	85.68	685.44
2045	74	12	2	3	3	venta	15	66.74	1001.10
2046	240	87	3	2	5	merma	6	21.97	131.82
2047	306	48	8	2	1	venta	25	98.40	2460.00
2048	210	13	2	1	2	merma	22	18.54	407.88
2049	65	37	8	1	5	compra	25	73.92	1848.00
2050	43	30	13	2	3	venta	1	49.21	49.21
2051	27	50	20	1	1	merma	16	70.52	1128.32
2052	147	20	17	1	5	merma	21	47.68	1001.28
2053	141	7	15	3	1	merma	22	41.03	902.66
2054	193	14	3	3	1	venta	14	79.59	1114.26
2055	287	40	4	2	4	merma	11	53.35	586.85
2056	91	24	19	2	3	venta	5	34.50	172.50
2057	268	48	17	1	4	compra	30	49.90	1497.00
2058	234	4	8	3	1	compra	28	86.12	2411.36
2059	314	87	1	2	3	compra	13	64.02	832.26
2060	294	80	12	1	2	compra	15	16.24	243.60
2061	122	59	15	1	4	compra	1	75.42	75.42
2062	339	29	9	2	3	venta	16	67.70	1083.20
2063	184	8	19	3	5	compra	4	19.50	78.00
2064	1	42	20	2	5	compra	1	32.71	32.71
2065	217	78	5	2	1	merma	10	6.60	66.00
2066	41	93	19	1	4	venta	30	14.78	443.40
2067	288	42	17	2	3	compra	10	68.90	689.00
2068	233	43	16	2	4	compra	22	15.32	337.04
2069	158	30	3	3	1	merma	27	52.53	1418.31
2070	263	89	11	1	5	merma	27	82.34	2223.18
2071	23	96	8	3	1	merma	23	21.58	496.34
2072	95	53	20	1	4	compra	17	84.74	1440.58
2073	249	66	16	1	4	merma	25	90.19	2254.75
2074	249	50	2	3	2	venta	3	62.43	187.29
2075	136	79	18	2	3	compra	14	78.30	1096.20
2076	341	33	10	3	1	venta	22	48.91	1076.02
2077	320	44	17	2	1	venta	29	29.36	851.44
2078	23	85	2	3	3	compra	29	22.38	649.02
2079	268	78	20	2	2	compra	2	50.44	100.88
2080	290	28	11	3	1	merma	7	91.31	639.17
2081	101	86	2	2	3	venta	15	76.42	1146.30
2082	333	72	3	2	2	merma	11	37.56	413.16
2083	2	67	20	1	5	venta	16	63.57	1017.12
2084	237	43	12	3	4	merma	10	27.81	278.10
2085	356	67	11	3	5	venta	8	96.84	774.72
2086	189	59	14	1	1	merma	27	18.22	491.94
2087	205	54	9	2	3	merma	4	72.25	289.00
2088	266	80	16	2	3	merma	28	12.46	348.88
2089	275	44	12	2	2	venta	23	30.88	710.24
2090	122	32	12	1	3	compra	6	21.54	129.24
2091	128	29	19	1	3	merma	30	13.03	390.90
2092	34	24	2	1	4	venta	27	47.06	1270.62
2093	195	88	6	2	4	venta	21	94.03	1974.63
2094	244	13	3	1	4	merma	6	52.62	315.72
2095	337	88	13	1	5	compra	13	16.74	217.62
2096	151	61	12	3	2	venta	3	45.36	136.08
2097	294	11	3	2	2	venta	25	42.25	1056.25
2098	74	15	6	1	5	compra	28	91.70	2567.60
2099	362	73	3	1	1	compra	25	35.50	887.50
2100	309	13	1	2	2	compra	23	78.78	1811.94
2101	350	18	15	1	4	venta	22	13.74	302.28
2102	215	12	19	2	5	compra	20	78.38	1567.60
2103	45	60	12	1	5	merma	11	23.56	259.16
2104	267	18	12	2	2	merma	13	6.99	90.87
2105	360	81	15	3	1	compra	23	36.66	843.18
2106	291	62	17	3	2	venta	24	8.96	215.04
2107	44	34	7	3	3	merma	2	75.05	150.10
2108	263	53	2	3	4	compra	18	92.00	1656.00
2109	83	62	3	1	5	compra	30	88.96	2668.80
2110	61	69	18	2	2	compra	28	81.49	2281.72
2111	27	7	10	3	1	merma	18	52.50	945.00
2112	282	45	8	1	5	venta	9	42.39	381.51
2113	260	51	1	1	4	merma	1	48.29	48.29
2114	77	79	19	2	1	compra	16	86.48	1383.68
2115	122	3	14	3	4	merma	25	45.49	1137.25
2116	236	4	6	3	4	compra	20	29.91	598.20
2117	147	58	2	1	4	venta	19	15.27	290.13
2118	241	35	6	3	5	merma	17	59.78	1016.26
2119	341	98	4	3	2	venta	14	57.50	805.00
2120	199	82	7	2	1	merma	17	33.47	568.99
2121	223	45	10	3	3	compra	19	88.10	1673.90
2122	173	91	18	3	2	venta	23	48.83	1123.09
2123	126	70	3	3	5	merma	12	71.24	854.88
2124	84	5	10	3	2	venta	14	79.74	1116.36
2125	44	69	15	3	4	venta	8	60.78	486.24
2126	228	80	17	1	3	merma	3	61.46	184.38
2127	71	7	17	1	4	venta	12	92.73	1112.76
2128	220	28	13	1	5	compra	12	80.77	969.24
2129	193	32	19	3	2	merma	18	36.00	648.00
2130	127	65	10	1	2	merma	11	11.79	129.69
2131	261	33	11	2	3	compra	19	66.38	1261.22
2132	276	44	18	2	4	compra	26	51.48	1338.48
2133	140	25	14	2	3	venta	21	5.29	111.09
2134	145	12	17	1	4	merma	16	43.48	695.68
2135	277	93	14	1	2	venta	26	62.13	1615.38
2136	179	97	18	2	1	compra	28	92.56	2591.68
2137	45	27	13	3	1	merma	15	92.64	1389.60
2138	103	23	15	1	2	venta	12	44.33	531.96
2139	36	7	17	1	1	merma	26	57.71	1500.46
2140	288	82	16	2	2	compra	12	40.31	483.72
2141	14	62	18	1	2	venta	1	49.10	49.10
2142	90	14	14	1	1	venta	18	89.16	1604.88
2143	180	45	14	3	5	venta	11	29.38	323.18
2144	166	87	15	3	1	merma	7	16.24	113.68
2145	26	64	17	3	4	compra	8	90.67	725.36
2146	34	88	12	3	2	compra	9	25.87	232.83
2147	205	10	13	2	5	venta	24	14.43	346.32
2148	305	31	1	1	4	merma	17	20.73	352.41
2149	168	73	3	1	4	merma	15	37.01	555.15
2150	37	38	6	1	4	venta	18	37.25	670.50
2151	322	84	16	2	2	compra	14	56.83	795.62
2152	10	2	2	2	5	merma	5	24.26	121.30
2153	163	23	6	2	5	compra	12	40.15	481.80
2154	97	15	7	2	3	compra	19	80.56	1530.64
2155	235	62	13	1	3	venta	25	40.44	1011.00
2156	14	37	15	3	3	compra	10	29.41	294.10
2157	279	49	9	2	1	merma	25	49.02	1225.50
2158	216	86	4	1	5	merma	1	95.32	95.32
2159	59	93	13	3	3	venta	10	76.69	766.90
2160	41	99	17	1	3	compra	13	84.59	1099.67
2161	23	63	8	3	3	compra	29	24.56	712.24
2162	65	1	17	3	5	merma	7	9.68	67.76
2163	91	9	8	1	5	merma	18	84.45	1520.10
2164	190	77	8	3	3	compra	22	69.70	1533.40
2165	209	12	2	1	4	compra	10	29.99	299.90
2166	296	11	15	3	4	compra	1	37.74	37.74
2167	261	72	7	3	2	compra	5	26.16	130.80
2168	290	58	6	3	2	venta	7	34.35	240.45
2169	312	88	4	1	3	compra	14	34.04	476.56
2170	160	47	4	3	5	compra	19	18.45	350.55
2171	361	33	12	1	5	merma	24	77.56	1861.44
2172	298	41	20	1	5	venta	16	77.99	1247.84
2173	153	85	7	1	5	merma	20	7.46	149.20
2174	257	42	1	2	3	merma	11	84.03	924.33
2175	183	20	5	1	4	venta	22	100.00	2200.00
2176	277	42	16	3	1	merma	23	33.05	760.15
2177	16	10	17	2	3	venta	11	58.30	641.30
2178	366	91	9	2	5	compra	8	74.56	596.48
2179	191	3	9	3	1	compra	30	48.17	1445.10
2180	258	84	13	1	2	compra	24	33.18	796.32
2181	193	41	8	1	3	venta	5	79.66	398.30
2182	159	60	5	3	5	venta	12	21.52	258.24
2183	158	51	15	2	1	compra	25	85.45	2136.25
2184	36	62	15	3	4	merma	26	5.83	151.58
2185	354	93	3	2	5	merma	19	19.01	361.19
2186	300	33	2	1	4	compra	11	44.90	493.90
2187	175	3	1	3	1	merma	16	62.53	1000.48
2188	22	5	18	3	3	venta	16	33.35	533.60
2189	117	54	4	3	4	venta	7	62.33	436.31
2190	305	39	16	1	5	venta	24	57.92	1390.08
2191	195	87	6	2	4	venta	30	36.80	1104.00
2192	51	25	19	1	4	merma	20	51.32	1026.40
2193	120	38	10	3	4	compra	2	29.29	58.58
2194	179	16	1	2	5	compra	14	56.75	794.50
2195	227	85	16	3	3	merma	19	13.57	257.83
2196	207	35	19	1	4	merma	14	32.84	459.76
2197	121	16	19	3	2	compra	25	53.18	1329.50
2198	291	58	2	1	2	merma	27	61.82	1669.14
2199	281	14	15	2	1	venta	4	75.84	303.36
2200	324	94	19	1	4	merma	17	79.23	1346.91
2201	328	33	9	2	3	compra	19	23.63	448.97
2202	288	32	13	1	3	venta	16	28.02	448.32
2203	323	91	4	2	4	compra	23	94.47	2172.81
2204	182	61	1	2	5	compra	5	89.81	449.05
2205	64	26	6	1	5	venta	29	48.16	1396.64
2206	83	77	12	2	2	compra	30	72.76	2182.80
2207	194	32	1	3	1	compra	3	6.57	19.71
2208	267	47	6	3	3	merma	12	90.55	1086.60
2209	190	49	11	1	1	compra	2	38.11	76.22
2210	111	96	3	1	1	venta	9	53.07	477.63
2211	154	99	3	1	3	venta	20	43.18	863.60
2212	223	21	8	1	4	compra	19	11.12	211.28
2213	120	7	7	1	1	compra	2	8.94	17.88
2214	282	69	13	2	4	merma	10	83.35	833.50
2215	187	26	6	1	1	compra	27	63.52	1715.04
2216	197	69	15	3	4	compra	15	40.69	610.35
2217	233	53	13	2	4	compra	20	81.32	1626.40
2218	360	1	19	2	4	compra	29	44.47	1289.63
2219	342	32	11	2	5	merma	24	86.19	2068.56
2220	343	38	1	2	1	merma	4	19.32	77.28
2221	255	61	14	3	3	compra	12	13.88	166.56
2222	200	50	1	1	1	venta	5	45.16	225.80
2223	144	75	20	2	2	merma	10	92.68	926.80
2224	144	41	2	1	1	venta	6	78.32	469.92
2225	199	54	18	2	5	venta	11	5.79	63.69
2226	13	99	19	3	2	compra	6	67.71	406.26
2227	265	32	10	1	1	venta	18	42.07	757.26
2228	358	98	2	2	1	venta	16	62.58	1001.28
2229	48	54	3	2	1	merma	11	86.86	955.46
2230	279	31	12	1	2	venta	25	85.77	2144.25
2231	57	22	11	2	5	compra	24	38.74	929.76
2232	153	9	4	3	4	venta	27	89.58	2418.66
2233	143	6	1	2	2	merma	5	44.96	224.80
2234	311	9	7	1	3	venta	6	54.70	328.20
2235	92	62	2	1	5	compra	15	19.37	290.55
2236	314	24	18	1	3	venta	8	58.53	468.24
2237	135	89	13	2	1	venta	26	28.81	749.06
2238	103	48	15	2	4	merma	24	44.96	1079.04
2239	13	17	9	2	5	merma	22	29.17	641.74
2240	137	75	1	2	2	venta	20	92.34	1846.80
2241	221	48	11	1	1	merma	2	90.87	181.74
2242	163	28	10	1	2	merma	23	51.56	1185.88
2243	130	17	9	3	5	venta	5	60.19	300.95
2244	3	79	18	3	4	merma	4	77.89	311.56
2245	176	54	5	1	3	compra	20	56.15	1123.00
2246	351	34	17	3	4	venta	3	48.58	145.74
2247	30	35	13	2	5	compra	12	30.28	363.36
2248	107	53	14	2	4	compra	18	49.60	892.80
2249	224	5	13	3	5	merma	14	24.11	337.54
2250	209	15	19	2	1	venta	30	79.80	2394.00
2251	348	30	11	1	2	merma	27	99.99	2699.73
2252	38	61	6	3	2	merma	3	70.77	212.31
2253	170	3	15	3	2	venta	22	76.08	1673.76
2254	187	57	19	1	2	compra	6	21.18	127.08
2255	123	58	19	2	1	merma	16	50.05	800.80
2256	248	93	20	3	2	merma	13	13.72	178.36
2257	237	99	10	2	4	compra	2	28.75	57.50
2258	271	28	2	1	3	compra	18	70.87	1275.66
2259	327	75	5	1	5	venta	6	81.54	489.24
2260	342	23	13	1	1	compra	19	33.47	635.93
2261	363	99	16	1	2	venta	8	90.65	725.20
2262	196	73	13	2	5	venta	15	84.08	1261.20
2263	27	51	7	2	2	venta	6	64.43	386.58
2264	58	6	2	1	1	compra	1	68.13	68.13
2265	111	1	20	2	5	compra	26	80.95	2104.70
2266	301	73	7	2	3	compra	4	29.07	116.28
2267	204	81	11	1	4	venta	20	13.19	263.80
2268	268	79	17	3	1	compra	15	37.29	559.35
2269	109	82	18	1	1	venta	2	89.87	179.74
2270	197	96	15	2	2	venta	16	78.99	1263.84
2271	160	53	2	2	3	venta	7	76.05	532.35
2272	366	76	9	3	3	venta	8	91.68	733.44
2273	93	68	17	3	4	compra	27	75.87	2048.49
2274	69	30	14	1	3	venta	23	54.45	1252.35
2275	54	36	19	2	5	venta	23	35.99	827.77
2276	297	64	6	2	1	venta	21	38.92	817.32
2277	271	24	12	3	1	merma	15	60.16	902.40
2278	68	98	11	3	2	compra	19	28.23	536.37
2279	151	28	5	3	5	venta	16	48.81	780.96
2280	15	42	16	2	2	merma	28	78.01	2184.28
2281	138	9	16	1	2	venta	20	96.71	1934.20
2282	102	100	13	2	2	merma	21	80.83	1697.43
2283	12	81	12	2	1	merma	5	53.93	269.65
2284	162	94	9	1	5	merma	19	42.86	814.34
2285	274	7	19	3	4	venta	23	36.75	845.25
2286	158	45	11	3	3	compra	10	37.42	374.20
2287	351	69	12	2	1	merma	4	67.94	271.76
2288	38	53	9	1	5	merma	17	93.89	1596.13
2289	186	45	9	2	5	merma	24	72.11	1730.64
2290	248	62	2	3	4	venta	19	18.57	352.83
2291	41	72	7	2	2	merma	9	45.42	408.78
2292	286	83	15	3	5	compra	17	35.60	605.20
2293	83	62	2	2	4	compra	26	11.77	306.02
2294	56	39	12	3	4	merma	12	71.67	860.04
2295	47	62	6	2	3	venta	1	15.17	15.17
2296	155	83	16	1	4	merma	24	19.69	472.56
2297	338	85	2	2	3	venta	15	28.66	429.90
2298	142	45	4	3	5	merma	21	44.19	927.99
2299	82	78	17	1	1	compra	30	84.80	2544.00
2300	245	58	5	1	3	merma	5	87.80	439.00
2301	284	57	9	3	5	merma	7	69.04	483.28
2302	148	96	19	3	4	compra	16	53.87	861.92
2303	120	54	19	3	3	compra	14	61.75	864.50
2304	9	32	6	1	2	venta	21	51.10	1073.10
2305	210	32	8	1	2	venta	26	8.33	216.58
2306	193	9	11	3	5	venta	17	61.08	1038.36
2307	188	35	8	2	5	venta	27	53.59	1446.93
2308	97	26	8	3	1	compra	8	31.94	255.52
2309	109	81	7	3	4	venta	29	8.72	252.88
2310	248	89	2	3	2	compra	13	77.15	1002.95
2311	5	77	16	2	4	venta	3	98.33	294.99
2312	363	16	7	3	2	merma	24	53.68	1288.32
2313	22	65	20	2	4	venta	15	40.47	607.05
2314	49	5	4	1	3	compra	27	75.82	2047.14
2315	353	28	12	2	2	merma	4	18.79	75.16
2316	158	59	11	2	1	compra	4	48.87	195.48
2317	356	41	1	1	3	merma	10	99.17	991.70
2318	10	81	2	3	4	merma	20	50.00	1000.00
2319	267	62	5	3	4	compra	16	65.15	1042.40
2320	125	92	4	1	4	merma	19	13.38	254.22
2321	277	50	6	2	2	venta	27	27.54	743.58
2322	178	75	8	1	3	merma	10	60.92	609.20
2323	304	35	4	2	1	venta	6	95.46	572.76
2324	328	34	12	2	4	compra	1	27.92	27.92
2325	165	14	2	2	4	compra	8	63.24	505.92
2326	39	93	20	3	4	merma	28	95.04	2661.12
2327	344	14	11	2	1	venta	7	31.29	219.03
2328	134	56	11	2	1	venta	18	20.40	367.20
2329	235	40	20	1	2	venta	18	73.17	1317.06
2330	57	87	10	3	5	compra	12	32.19	386.28
2331	151	74	9	3	5	compra	2	98.78	197.56
2332	137	88	13	1	2	venta	1	85.12	85.12
2333	226	35	5	2	1	compra	8	87.36	698.88
2334	349	33	3	1	5	compra	10	69.16	691.60
2335	83	16	12	2	3	venta	22	77.10	1696.20
2336	104	25	15	1	1	venta	27	25.62	691.74
2337	170	46	8	3	4	compra	16	88.82	1421.12
2338	261	23	17	1	2	venta	8	88.72	709.76
2339	245	7	4	1	3	merma	15	17.70	265.50
2340	164	66	16	3	2	merma	17	15.72	267.24
2341	95	47	3	2	2	compra	19	98.82	1877.58
2342	11	51	5	2	5	venta	6	59.89	359.34
2343	297	69	18	2	5	venta	14	11.62	162.68
2344	225	35	4	3	1	merma	11	52.40	576.40
2345	119	72	7	3	2	merma	6	27.37	164.22
2346	318	20	10	3	1	compra	21	71.76	1506.96
2347	240	39	17	1	4	merma	10	29.88	298.80
2348	153	48	13	1	1	compra	19	7.08	134.52
2349	272	51	9	3	4	compra	21	11.99	251.79
2350	149	96	7	3	2	compra	15	81.75	1226.25
2351	11	58	20	1	5	venta	12	20.28	243.36
2352	159	30	11	1	2	venta	1	27.20	27.20
2353	164	72	2	2	4	merma	21	94.78	1990.38
2354	275	90	13	1	1	venta	1	7.42	7.42
2355	117	52	8	2	4	compra	25	62.61	1565.25
2356	243	65	11	3	3	compra	24	84.26	2022.24
2357	119	88	15	2	2	compra	4	18.26	73.04
2358	47	62	14	3	2	venta	13	76.36	992.68
2359	327	31	18	3	1	compra	3	83.80	251.40
2360	159	81	10	2	2	venta	29	11.66	338.14
2361	17	47	14	1	3	venta	12	71.47	857.64
2362	292	33	9	2	1	venta	10	66.91	669.10
2363	246	23	1	2	2	merma	9	36.43	327.87
2364	71	58	7	1	2	venta	27	72.01	1944.27
2365	125	58	1	3	2	compra	14	73.02	1022.28
2366	101	39	8	3	5	compra	20	52.69	1053.80
2367	153	6	20	1	2	venta	23	63.61	1463.03
2368	40	66	14	1	5	compra	24	7.51	180.24
2369	284	18	7	3	2	merma	4	89.66	358.64
2370	140	86	20	1	2	venta	21	37.99	797.79
2371	36	89	18	1	4	compra	5	39.68	198.40
2372	307	22	8	2	5	compra	9	25.88	232.92
2373	348	52	20	1	5	compra	10	90.10	901.00
2374	111	16	12	1	1	merma	28	72.24	2022.72
2375	257	18	9	2	4	venta	18	63.60	1144.80
2376	141	79	1	2	1	compra	8	20.66	165.28
2377	145	20	18	3	2	compra	15	96.25	1443.75
2378	207	82	20	3	4	merma	16	6.26	100.16
2379	68	45	18	1	3	merma	3	56.97	170.91
2380	36	41	18	2	2	merma	1	57.61	57.61
2381	355	46	9	2	3	venta	29	41.47	1202.63
2382	65	79	3	1	1	compra	5	12.40	62.00
2383	49	81	18	3	1	compra	16	32.41	518.56
2384	300	50	12	2	1	compra	9	54.75	492.75
2385	263	96	3	3	3	venta	28	25.86	724.08
2386	231	88	11	3	5	venta	7	71.11	497.77
2387	127	50	15	1	2	merma	10	73.82	738.20
2388	134	13	17	3	3	merma	4	98.21	392.84
2389	220	97	11	1	1	compra	7	54.85	383.95
2390	104	56	4	3	5	venta	14	11.96	167.44
2391	136	33	10	1	1	venta	6	35.46	212.76
2392	26	39	18	1	1	venta	11	63.68	700.48
2393	261	63	6	1	5	venta	20	99.64	1992.80
2394	180	24	4	2	2	compra	19	12.84	243.96
2395	273	9	16	2	2	merma	10	5.76	57.60
2396	20	40	11	1	5	compra	26	38.47	1000.22
2397	258	86	17	3	1	merma	5	19.81	99.05
2398	139	86	6	2	2	venta	6	10.59	63.54
2399	105	50	18	1	1	venta	1	10.56	10.56
2400	324	37	1	1	2	compra	22	53.79	1183.38
2401	241	29	20	3	3	venta	20	30.61	612.20
2402	108	11	5	1	1	venta	1	58.53	58.53
2403	351	58	12	1	4	merma	27	21.58	582.66
2404	305	61	16	3	1	venta	26	44.24	1150.24
2405	235	58	14	3	2	merma	8	87.79	702.32
2406	110	8	19	1	4	venta	24	47.78	1146.72
2407	284	43	1	3	1	merma	23	45.36	1043.28
2408	218	57	12	2	3	compra	18	33.03	594.54
2409	124	93	8	3	2	merma	2	40.88	81.76
2410	219	62	10	2	3	venta	6	83.61	501.66
2411	301	17	15	2	4	merma	16	30.38	486.08
2412	252	84	9	2	4	compra	19	12.12	230.28
2413	131	82	19	1	5	venta	26	35.74	929.24
2414	361	87	14	3	2	compra	1	30.10	30.10
2415	263	46	18	2	2	compra	13	36.65	476.45
2416	351	62	14	2	5	compra	9	81.73	735.57
2417	76	3	9	2	4	compra	6	77.73	466.38
2418	117	73	11	1	5	compra	15	57.33	859.95
2419	283	50	8	2	2	compra	10	97.22	972.20
2420	272	22	3	3	3	merma	19	13.01	247.19
2421	295	31	1	3	5	venta	22	24.20	532.40
2422	120	21	16	1	2	merma	28	57.71	1615.88
2423	60	9	16	1	3	compra	18	28.66	515.88
2424	357	38	10	1	2	venta	28	72.70	2035.60
2425	193	20	19	2	1	compra	6	56.83	340.98
2426	146	44	2	3	4	compra	4	86.23	344.92
2427	137	99	3	1	3	merma	3	81.20	243.60
2428	174	47	5	3	4	merma	28	29.70	831.60
2429	162	13	2	2	4	compra	21	82.43	1731.03
2430	92	88	12	1	1	compra	6	81.48	488.88
2431	134	28	13	3	4	compra	12	45.39	544.68
2432	155	40	17	2	4	venta	27	64.67	1746.09
2433	130	38	2	3	4	venta	13	53.99	701.87
2434	152	47	7	1	5	merma	18	80.99	1457.82
2435	182	96	9	3	2	venta	1	42.69	42.69
2436	17	4	3	2	4	merma	20	65.04	1300.80
2437	61	80	12	2	1	merma	1	70.94	70.94
2438	275	45	5	1	4	compra	4	98.07	392.28
2439	2	84	19	3	4	compra	10	29.46	294.60
2440	356	44	13	1	4	compra	11	96.32	1059.52
2441	226	78	5	2	1	compra	15	94.55	1418.25
2442	282	57	2	3	4	merma	11	97.34	1070.74
2443	230	11	5	1	2	merma	20	39.37	787.40
2444	155	44	20	1	2	merma	19	49.75	945.25
2445	246	20	12	2	3	merma	18	36.87	663.66
2446	110	22	14	3	5	compra	10	37.35	373.50
2447	49	79	2	3	2	venta	21	81.88	1719.48
2448	340	34	18	3	2	merma	16	80.38	1286.08
2449	179	40	8	2	1	merma	12	71.38	856.56
2450	258	33	9	2	1	venta	15	84.45	1266.75
2451	5	41	10	1	5	merma	9	48.16	433.44
2452	361	61	10	2	3	compra	17	58.91	1001.47
2453	214	99	9	1	3	venta	9	43.90	395.10
2454	159	66	5	1	4	merma	28	42.33	1185.24
2455	99	64	5	3	4	merma	11	40.19	442.09
2456	195	88	10	3	5	venta	5	49.35	246.75
2457	198	16	18	2	3	venta	9	78.14	703.26
2458	14	81	17	3	3	venta	15	35.23	528.45
2459	327	44	11	3	3	merma	20	45.46	909.20
2460	173	61	8	1	3	venta	25	49.57	1239.25
2461	308	1	12	1	1	merma	2	78.04	156.08
2462	50	30	11	2	4	venta	29	32.50	942.50
2463	337	53	14	3	1	compra	15	24.26	363.90
2464	185	93	4	1	5	merma	28	15.24	426.72
2465	271	90	1	2	1	merma	24	45.47	1091.28
2466	6	99	4	3	5	merma	30	62.24	1867.20
2467	229	38	18	3	4	merma	2	61.11	122.22
2468	31	62	5	1	3	compra	29	32.31	936.99
2469	81	50	13	2	3	merma	22	20.38	448.36
2470	205	72	13	3	1	compra	17	40.47	687.99
2471	354	8	10	3	2	merma	3	51.19	153.57
2472	83	4	6	1	5	venta	23	55.71	1281.33
2473	145	97	5	2	3	compra	13	43.22	561.86
2474	351	83	14	2	1	compra	12	29.51	354.12
2475	73	36	3	3	1	merma	10	12.03	120.30
2476	105	77	9	1	4	compra	11	79.08	869.88
2477	329	48	20	1	5	compra	10	6.02	60.20
2478	331	84	11	1	2	venta	30	31.90	957.00
2479	305	98	14	1	1	merma	8	13.78	110.24
2480	327	28	9	3	2	merma	24	80.91	1941.84
2481	124	24	8	2	4	venta	4	93.83	375.32
2482	196	53	11	1	4	venta	22	32.71	719.62
2483	185	41	20	3	2	merma	5	51.99	259.95
2484	123	19	9	1	5	merma	1	77.03	77.03
2485	327	10	15	2	3	venta	18	89.52	1611.36
2486	8	67	19	1	5	merma	1	27.12	27.12
2487	321	71	11	1	3	merma	5	25.46	127.30
2488	102	5	1	1	5	venta	23	52.11	1198.53
2489	306	89	3	3	2	venta	6	62.58	375.48
2490	205	33	3	3	2	venta	28	78.58	2200.24
2491	48	74	6	2	3	compra	28	96.88	2712.64
2492	202	12	3	2	3	venta	26	91.77	2386.02
2493	335	65	2	1	1	venta	14	74.35	1040.90
2494	62	52	9	3	5	merma	1	12.85	12.85
2495	300	59	19	3	2	venta	2	58.53	117.06
2496	339	35	16	3	3	compra	29	62.80	1821.20
2497	333	87	6	3	2	compra	1	25.50	25.50
2498	24	8	1	1	2	compra	19	72.22	1372.18
2499	145	59	12	1	4	compra	30	16.77	503.10
2500	62	1	5	3	4	merma	6	41.52	249.12
2501	130	58	14	1	1	merma	12	50.67	608.04
2502	268	57	17	2	1	venta	10	88.92	889.20
2503	195	39	9	3	4	venta	21	18.38	385.98
2504	55	23	15	1	5	merma	24	30.46	731.04
2505	249	12	20	2	3	compra	18	21.51	387.18
2506	152	27	4	1	2	merma	21	90.94	1909.74
2507	265	63	10	1	1	venta	30	26.61	798.30
2508	281	90	10	2	3	compra	21	68.93	1447.53
2509	27	2	11	1	3	merma	7	95.78	670.46
2510	45	31	14	1	3	merma	25	77.48	1937.00
2511	239	71	2	3	2	venta	23	89.54	2059.42
2512	172	26	17	2	4	compra	21	15.23	319.83
2513	179	46	16	2	4	compra	2	55.41	110.82
2514	212	48	4	3	2	merma	26	46.95	1220.70
2515	147	56	18	1	1	compra	16	79.52	1272.32
2516	251	54	13	3	4	compra	25	14.93	373.25
2517	184	90	18	3	5	venta	26	96.65	2512.90
2518	186	50	18	1	2	compra	23	17.57	404.11
2519	70	84	16	1	3	compra	2	28.72	57.44
2520	258	31	11	3	3	merma	4	79.48	317.92
2521	152	79	9	3	2	venta	2	50.74	101.48
2522	28	16	8	1	4	merma	8	15.14	121.12
2523	289	88	11	2	3	compra	19	37.88	719.72
2524	59	35	19	1	3	merma	12	44.08	528.96
2525	85	55	6	3	4	venta	25	88.25	2206.25
2526	339	90	19	3	5	compra	5	29.95	149.75
2527	12	45	16	3	2	compra	24	30.57	733.68
2528	337	42	20	2	5	venta	3	27.74	83.22
2529	339	90	11	2	3	merma	20	71.05	1421.00
2530	183	75	13	1	4	venta	3	17.32	51.96
2531	301	94	19	3	1	merma	25	10.15	253.75
2532	52	15	6	3	3	venta	14	60.33	844.62
2533	200	39	9	3	3	compra	26	48.97	1273.22
2534	199	88	12	3	1	compra	7	32.99	230.93
2535	242	13	20	1	2	venta	15	56.93	853.95
2536	78	66	5	1	4	compra	23	35.50	816.50
2537	326	67	8	1	2	venta	5	68.09	340.45
2538	54	74	20	1	4	venta	4	14.63	58.52
2539	46	75	12	2	3	venta	19	19.02	361.38
2540	78	38	18	1	2	merma	25	76.03	1900.75
2541	110	97	18	3	2	merma	30	98.37	2951.10
2542	248	92	10	3	4	merma	17	60.02	1020.34
2543	329	75	1	3	3	merma	18	35.54	639.72
2544	129	39	1	3	3	merma	29	17.73	514.17
2545	358	65	2	1	4	merma	18	62.79	1130.22
2546	300	57	15	2	2	venta	24	84.95	2038.80
2547	205	93	18	1	2	venta	22	77.00	1694.00
2548	160	1	15	1	2	venta	9	25.73	231.57
2549	310	27	11	1	4	venta	2	35.45	70.90
2550	87	99	11	3	1	merma	4	13.08	52.32
2551	58	39	7	1	5	venta	13	39.36	511.68
2552	63	60	16	3	1	merma	28	24.77	693.56
2553	342	6	10	3	2	compra	22	49.36	1085.92
2554	221	65	15	2	2	merma	25	12.34	308.50
2555	353	84	13	2	4	compra	4	76.74	306.96
2556	246	14	6	3	4	merma	4	50.44	201.76
2557	188	28	9	2	3	venta	25	77.75	1943.75
2558	17	52	16	1	2	venta	21	30.35	637.35
2559	39	5	6	1	1	compra	18	37.75	679.50
2560	299	81	17	2	1	venta	27	44.38	1198.26
2561	344	25	2	2	5	venta	14	28.49	398.86
2562	174	91	14	3	3	venta	6	31.96	191.76
2563	29	54	14	3	5	compra	27	76.25	2058.75
2564	312	25	15	1	1	venta	3	83.91	251.73
2565	29	49	6	3	2	compra	3	30.96	92.88
2566	5	34	20	2	2	venta	17	42.12	716.04
2567	289	99	18	3	4	venta	9	97.68	879.12
2568	98	100	12	1	5	compra	12	66.40	796.80
2569	11	90	4	2	2	merma	15	16.26	243.90
2570	54	71	2	3	5	venta	8	72.30	578.40
2571	295	25	10	3	3	merma	19	11.09	210.71
2572	97	75	4	2	1	venta	13	74.34	966.42
2573	145	62	15	2	5	merma	6	55.09	330.54
2574	54	97	1	3	2	merma	28	88.31	2472.68
2575	279	33	14	3	4	merma	24	34.55	829.20
2576	179	48	7	3	1	compra	4	91.25	365.00
2577	4	81	16	3	4	venta	23	76.17	1751.91
2578	228	32	19	3	5	venta	4	19.70	78.80
2579	332	81	13	2	4	compra	14	32.35	452.90
2580	358	29	2	3	1	merma	19	32.62	619.78
2581	227	87	3	2	4	merma	11	82.46	907.06
2582	191	85	17	2	5	compra	18	43.65	785.70
2583	329	21	14	1	3	merma	17	32.02	544.34
2584	290	25	2	3	5	compra	8	86.91	695.28
2585	284	40	3	2	1	compra	9	46.11	414.99
2586	23	63	3	2	3	venta	24	78.86	1892.64
2587	349	95	1	1	5	merma	4	38.54	154.16
2588	128	56	5	2	2	compra	21	7.84	164.64
2589	306	71	20	3	2	venta	2	71.09	142.18
2590	5	100	10	1	2	compra	14	75.44	1056.16
2591	57	56	10	2	4	venta	22	99.42	2187.24
2592	162	37	19	3	1	merma	23	30.37	698.51
2593	94	87	17	1	3	merma	21	20.63	433.23
2594	44	10	19	1	1	merma	23	23.94	550.62
2595	98	29	10	2	1	merma	8	54.53	436.24
2596	198	7	18	2	4	venta	5	38.60	193.00
2597	289	47	9	2	1	merma	30	19.14	574.20
2598	220	81	6	3	5	compra	26	42.31	1100.06
2599	304	85	14	3	4	merma	21	33.20	697.20
2600	205	41	14	3	1	compra	5	21.84	109.20
2601	147	68	1	1	4	merma	15	24.76	371.40
2602	89	44	4	3	2	merma	24	63.99	1535.76
2603	67	86	9	2	1	venta	20	89.86	1797.20
2604	86	34	11	2	1	merma	24	92.30	2215.20
2605	54	27	14	3	3	venta	17	5.42	92.14
2606	266	7	9	2	5	venta	25	21.36	534.00
2607	118	17	7	1	2	compra	3	97.67	293.01
2608	79	97	5	3	4	compra	5	92.23	461.15
2609	107	24	18	1	1	compra	18	86.86	1563.48
2610	166	9	5	3	3	compra	18	22.84	411.12
2611	43	47	12	2	3	compra	12	40.91	490.92
2612	202	77	16	3	3	venta	13	30.86	401.18
2613	160	83	6	3	2	venta	21	86.79	1822.59
2614	75	69	15	2	2	compra	9	92.62	833.58
2615	105	6	14	1	2	compra	23	22.92	527.16
2616	306	74	10	1	3	venta	6	96.46	578.76
2617	124	82	11	2	2	compra	26	16.74	435.24
2618	28	26	2	3	4	venta	21	12.23	256.83
2619	295	4	9	1	5	venta	17	44.73	760.41
2620	229	51	4	1	2	venta	22	80.73	1776.06
2621	207	56	15	3	2	compra	21	25.84	542.64
2622	243	90	19	1	3	venta	16	85.21	1363.36
2623	364	24	3	2	1	merma	24	47.19	1132.56
2624	236	52	19	2	4	compra	15	46.10	691.50
2625	172	90	6	2	2	compra	21	59.29	1245.09
2626	198	92	18	1	1	compra	2	69.38	138.76
2627	324	14	6	3	3	merma	28	8.00	224.00
2628	273	42	1	1	1	venta	16	6.74	107.84
2629	82	59	8	1	5	merma	26	87.56	2276.56
2630	311	36	19	2	1	venta	16	53.78	860.48
2631	178	48	4	1	5	venta	28	13.29	372.12
2632	201	72	13	2	2	venta	29	20.37	590.73
2633	160	40	9	2	5	merma	29	72.61	2105.69
2634	284	40	8	1	5	venta	13	82.70	1075.10
2635	354	35	13	3	3	merma	30	26.20	786.00
2636	138	60	11	2	2	venta	25	22.74	568.50
2637	291	49	9	3	5	venta	1	24.08	24.08
2638	157	41	1	2	3	venta	21	11.43	240.03
2639	314	53	9	2	5	merma	10	19.78	197.80
2640	4	28	6	3	1	merma	26	26.74	695.24
2641	314	12	3	3	2	venta	23	92.95	2137.85
2642	78	89	3	2	1	venta	17	45.53	774.01
2643	326	60	20	3	1	venta	23	90.55	2082.65
2644	346	6	17	1	2	venta	4	75.89	303.56
2645	106	98	6	3	3	venta	16	69.68	1114.88
2646	321	42	7	3	1	venta	18	32.10	577.80
2647	307	15	5	2	5	venta	4	9.89	39.56
2648	277	8	4	2	2	compra	3	41.55	124.65
2649	111	62	7	1	3	merma	21	71.20	1495.20
2650	117	60	17	3	1	compra	21	14.14	296.94
2651	244	26	2	1	2	venta	29	73.79	2139.91
2652	91	49	4	1	4	compra	9	95.37	858.33
2653	331	47	3	1	4	venta	26	36.64	952.64
2654	253	92	8	2	3	venta	4	5.75	23.00
2655	94	9	20	1	5	merma	3	55.82	167.46
2656	107	51	4	2	3	compra	22	86.96	1913.12
2657	220	49	14	1	1	merma	10	92.49	924.90
2658	257	62	3	3	2	compra	1	12.50	12.50
2659	29	61	13	1	3	merma	17	65.62	1115.54
2660	296	4	18	3	2	merma	24	66.31	1591.44
2661	63	24	4	1	5	venta	16	70.31	1124.96
2662	175	33	2	2	5	compra	2	72.79	145.58
2663	148	87	8	1	3	merma	10	58.35	583.50
2664	237	1	8	1	3	venta	30	69.09	2072.70
2665	269	86	4	1	5	merma	20	61.38	1227.60
2666	264	86	7	2	4	compra	9	76.32	686.88
2667	127	49	14	2	1	compra	28	21.48	601.44
2668	24	34	15	2	1	compra	18	19.77	355.86
2669	354	60	13	2	4	merma	21	67.64	1420.44
2670	159	8	1	1	1	compra	13	36.98	480.74
2671	111	24	5	1	5	compra	9	33.83	304.47
2672	106	24	10	3	4	merma	19	59.63	1132.97
2673	326	16	14	1	2	compra	10	46.28	462.80
2674	57	5	8	3	4	venta	24	80.83	1939.92
2675	96	30	17	3	3	venta	5	16.77	83.85
2676	225	29	13	2	5	compra	26	12.90	335.40
2677	109	13	6	1	1	merma	5	64.93	324.65
2678	243	100	19	3	1	merma	14	32.93	461.02
2679	363	80	17	1	2	merma	28	40.19	1125.32
2680	304	45	6	3	4	merma	2	43.23	86.46
2681	90	63	10	3	4	venta	25	59.23	1480.75
2682	278	61	15	1	5	merma	24	18.13	435.12
2683	118	9	17	3	2	venta	16	79.79	1276.64
2684	59	1	9	1	1	merma	12	84.68	1016.16
2685	22	81	3	3	1	compra	1	31.88	31.88
2686	332	86	19	3	4	compra	6	66.67	400.02
2687	32	28	6	1	3	merma	28	53.13	1487.64
2688	59	90	12	2	5	compra	16	65.23	1043.68
2689	271	48	16	3	5	compra	9	24.00	216.00
2690	312	35	14	1	2	compra	4	10.21	40.84
2691	141	23	6	2	4	merma	13	37.29	484.77
2692	258	31	8	1	1	venta	10	7.94	79.40
2693	50	13	19	1	4	venta	20	60.78	1215.60
2694	312	54	4	3	1	compra	19	94.98	1804.62
2695	169	77	20	1	1	compra	12	56.50	678.00
2696	123	12	15	3	5	venta	17	32.22	547.74
2697	11	66	5	3	1	compra	26	99.65	2590.90
2698	34	87	15	2	1	compra	11	61.63	677.93
2699	1	45	3	3	4	merma	23	54.51	1253.73
2700	336	38	15	2	4	compra	28	82.90	2321.20
2701	273	95	12	2	3	merma	27	28.76	776.52
2702	346	79	17	3	2	merma	9	73.05	657.45
2703	161	93	19	3	2	venta	11	33.47	368.17
2704	366	48	8	2	5	merma	19	22.81	433.39
2705	227	99	17	2	2	compra	9	59.98	539.82
2706	311	72	16	3	3	venta	30	81.46	2443.80
2707	57	82	13	1	5	compra	27	96.76	2612.52
2708	56	56	6	3	5	venta	12	67.34	808.08
2709	353	100	3	1	2	merma	1	74.63	74.63
2710	95	43	8	2	4	venta	25	61.78	1544.50
2711	253	61	8	3	3	venta	26	24.92	647.92
2712	149	34	17	1	1	venta	22	21.49	472.78
2713	264	68	16	1	4	merma	25	39.25	981.25
2714	201	98	4	3	3	venta	22	12.58	276.76
2715	286	94	7	1	4	venta	17	23.22	394.74
2716	133	92	16	3	4	venta	15	70.43	1056.45
2717	36	50	6	3	4	compra	12	32.83	393.96
2718	160	82	19	2	1	compra	22	27.09	595.98
2719	197	49	19	3	2	venta	16	10.20	163.20
2720	28	68	15	1	4	compra	9	7.32	65.88
2721	94	67	4	3	1	venta	25	21.23	530.75
2722	59	56	13	2	3	compra	24	83.15	1995.60
2723	337	85	14	1	4	merma	16	66.24	1059.84
2724	195	74	14	1	2	merma	26	49.62	1290.12
2725	213	63	19	1	2	compra	5	52.35	261.75
2726	65	39	14	3	1	merma	5	23.85	119.25
2727	23	45	16	2	4	merma	16	25.20	403.20
2728	202	28	19	3	3	compra	18	79.00	1422.00
2729	287	44	2	3	4	merma	1	46.34	46.34
2730	33	98	3	2	1	compra	7	91.19	638.33
2731	146	89	2	3	2	merma	6	83.62	501.72
2732	291	50	6	1	2	venta	25	96.47	2411.75
2733	254	54	5	2	2	venta	27	18.69	504.63
2734	252	15	5	3	4	venta	1	22.37	22.37
2735	57	67	4	3	3	merma	8	42.65	341.20
2736	151	83	2	1	5	venta	3	92.87	278.61
2737	189	95	13	2	3	merma	17	46.54	791.18
2738	208	97	16	2	5	merma	19	11.43	217.17
2739	53	87	13	3	4	venta	13	35.78	465.14
2740	319	13	19	1	1	merma	2	58.99	117.98
2741	169	29	7	2	2	merma	18	60.21	1083.78
2742	187	83	10	2	5	compra	25	73.29	1832.25
2743	154	11	13	3	3	merma	21	54.41	1142.61
2744	271	69	13	2	4	compra	7	23.52	164.64
2745	30	25	14	3	1	compra	14	66.58	932.12
2746	333	59	19	3	5	venta	7	25.91	181.37
2747	97	26	15	1	4	compra	26	9.58	249.08
2748	111	87	13	1	2	compra	19	49.45	939.55
2749	293	96	10	2	4	venta	21	23.71	497.91
2750	186	52	2	1	2	compra	5	93.83	469.15
2751	197	5	13	1	4	venta	23	38.14	877.22
2752	338	13	17	3	5	venta	11	89.12	980.32
2753	226	8	18	2	2	merma	28	11.93	334.04
2754	125	43	3	3	4	venta	17	61.51	1045.67
2755	25	26	11	2	4	compra	13	46.09	599.17
2756	329	27	17	3	1	venta	11	17.55	193.05
2757	17	89	15	2	4	compra	3	27.91	83.73
2758	196	3	19	1	5	venta	25	73.80	1845.00
2759	161	83	2	3	4	merma	1	86.00	86.00
2760	218	36	1	3	2	merma	17	36.79	625.43
2761	97	40	10	3	4	venta	6	24.27	145.62
2762	330	82	14	2	5	venta	16	33.62	537.92
2763	103	8	17	1	3	venta	11	18.34	201.74
2764	340	85	2	3	5	merma	12	55.06	660.72
2765	343	77	3	2	5	venta	7	23.92	167.44
2766	80	80	16	1	4	compra	27	39.35	1062.45
2767	35	44	19	2	1	compra	17	98.02	1666.34
2768	313	29	4	1	5	venta	18	32.24	580.32
2769	296	68	3	2	1	venta	21	44.67	938.07
2770	348	58	5	3	2	compra	5	13.72	68.60
2771	311	32	8	3	1	venta	25	76.97	1924.25
2772	269	57	1	1	1	compra	8	90.29	722.32
2773	110	36	13	1	5	compra	29	89.07	2583.03
2774	353	71	3	3	5	merma	10	11.35	113.50
2775	179	77	13	1	3	venta	18	72.47	1304.46
2776	282	11	8	3	1	merma	11	83.08	913.88
2777	173	76	20	1	1	compra	11	84.16	925.76
2778	103	71	10	1	5	venta	30	73.98	2219.40
2779	155	25	19	2	3	compra	4	82.22	328.88
2780	334	73	17	1	2	merma	14	61.68	863.52
2781	7	69	18	2	3	merma	6	59.52	357.12
2782	17	82	16	2	2	compra	13	73.15	950.95
2783	2	32	11	3	4	compra	28	14.16	396.48
2784	143	46	9	3	4	compra	5	53.56	267.80
2785	74	57	19	2	5	compra	18	23.48	422.64
2786	338	91	10	2	2	compra	3	99.10	297.30
2787	23	9	19	1	1	merma	18	73.55	1323.90
2788	56	29	1	1	1	venta	20	11.47	229.40
2789	364	16	1	1	2	merma	21	94.03	1974.63
2790	298	56	12	1	2	merma	25	66.14	1653.50
2791	30	36	16	3	1	venta	1	69.79	69.79
2792	327	40	4	3	1	venta	9	43.65	392.85
2793	83	11	2	2	1	compra	13	67.90	882.70
2794	99	46	17	2	2	merma	17	70.11	1191.87
2795	341	58	11	2	5	venta	25	53.55	1338.75
2796	137	11	3	1	2	compra	15	63.54	953.10
2797	214	73	8	2	5	compra	5	72.96	364.80
2798	148	22	15	1	3	merma	2	77.98	155.96
2799	98	7	15	2	1	compra	7	15.34	107.38
2800	86	30	7	1	2	venta	28	66.38	1858.64
2801	316	91	15	1	1	venta	27	83.84	2263.68
2802	23	56	20	2	5	compra	13	60.56	787.28
2803	118	65	6	3	3	venta	7	10.87	76.09
2804	255	90	14	1	1	venta	23	43.13	991.99
2805	160	10	8	3	4	venta	10	54.40	544.00
2806	149	89	12	3	4	compra	23	96.77	2225.71
2807	91	85	7	1	1	venta	6	34.31	205.86
2808	222	92	18	3	2	compra	27	12.77	344.79
2809	218	94	1	2	5	merma	18	11.77	211.86
2810	168	82	19	1	3	venta	9	75.31	677.79
2811	6	97	9	3	5	merma	11	28.56	314.16
2812	239	53	5	3	3	merma	15	8.49	127.35
2813	327	46	2	3	5	venta	10	81.98	819.80
2814	147	82	14	2	4	merma	24	19.49	467.76
2815	241	69	16	2	3	merma	27	24.25	654.75
2816	226	8	16	3	1	venta	16	13.86	221.76
2817	331	10	7	1	2	compra	12	26.92	323.04
2818	334	68	13	2	4	merma	13	50.46	655.98
2819	356	36	13	1	2	compra	4	64.19	256.76
2820	202	40	8	3	5	compra	8	6.53	52.24
2821	308	64	12	1	4	venta	18	14.37	258.66
2822	13	51	6	3	2	compra	11	75.64	832.04
2823	114	76	17	1	3	compra	2	6.15	12.30
2824	43	37	15	2	2	compra	2	83.59	167.18
2825	320	66	9	2	3	merma	27	33.10	893.70
2826	236	33	13	3	1	compra	20	94.32	1886.40
2827	11	44	18	3	5	compra	27	68.87	1859.49
2828	278	67	8	2	1	compra	9	50.03	450.27
2829	359	45	2	1	4	compra	15	19.27	289.05
2830	210	29	13	2	4	venta	4	63.48	253.92
2831	27	17	13	3	4	venta	24	39.81	955.44
2832	351	57	12	2	1	merma	2	50.04	100.08
2833	185	37	2	2	4	compra	8	38.85	310.80
2834	314	93	17	2	1	venta	13	26.16	340.08
2835	137	34	5	2	5	venta	27	78.79	2127.33
2836	78	35	7	3	1	merma	28	84.04	2353.12
2837	236	16	10	2	3	merma	29	94.41	2737.89
2838	314	74	19	3	5	merma	9	14.16	127.44
2839	2	27	2	3	3	merma	27	72.15	1948.05
2840	126	8	13	1	2	merma	20	27.15	543.00
2841	356	14	4	1	1	merma	12	71.16	853.92
2842	54	19	2	3	4	compra	21	16.21	340.41
2843	213	14	7	1	3	venta	19	9.71	184.49
2844	161	100	15	1	2	venta	2	96.67	193.34
2845	92	22	5	1	1	merma	17	73.94	1256.98
2846	94	48	7	3	3	merma	24	26.33	631.92
2847	366	97	11	1	4	compra	26	71.21	1851.46
2848	323	57	19	3	1	venta	15	28.21	423.15
2849	13	43	6	2	2	merma	21	71.74	1506.54
2850	336	75	15	3	4	merma	22	93.63	2059.86
2851	293	32	16	2	2	merma	9	8.35	75.15
2852	181	86	5	3	4	venta	1	41.05	41.05
2853	211	71	19	1	5	venta	27	69.13	1866.51
2854	342	9	13	3	5	compra	18	73.33	1319.94
2855	148	63	8	3	1	compra	18	63.51	1143.18
2856	20	36	11	2	2	merma	15	73.33	1099.95
2857	282	15	2	2	5	venta	9	44.46	400.14
2858	265	73	10	3	4	venta	28	21.45	600.60
2859	305	44	1	1	5	venta	30	30.29	908.70
2860	331	9	15	2	2	venta	9	88.90	800.10
2861	323	7	5	1	1	compra	17	55.85	949.45
2862	76	97	13	1	1	compra	19	59.53	1131.07
2863	41	19	10	2	4	merma	23	23.62	543.26
2864	98	88	3	1	2	merma	7	11.19	78.33
2865	32	48	10	1	5	compra	22	5.87	129.14
2866	317	76	7	3	2	merma	3	89.88	269.64
2867	2	25	7	2	3	merma	10	46.87	468.70
2868	71	22	4	2	5	merma	8	98.18	785.44
2869	228	74	7	1	3	compra	28	46.70	1307.60
2870	321	44	12	3	2	merma	10	79.97	799.70
2871	349	18	4	2	4	venta	24	43.35	1040.40
2872	81	99	1	3	3	merma	30	25.73	771.90
2873	139	51	4	2	3	merma	27	20.90	564.30
2874	80	73	11	1	5	venta	4	13.30	53.20
2875	309	51	20	1	2	merma	3	82.66	247.98
2876	251	7	9	2	4	merma	28	12.19	341.32
2877	36	70	20	2	2	merma	25	5.50	137.50
2878	198	12	5	3	3	compra	21	94.31	1980.51
2879	334	18	16	3	2	venta	6	95.16	570.96
2880	140	21	1	3	2	venta	15	80.58	1208.70
2881	268	67	14	1	3	venta	26	55.83	1451.58
2882	256	24	16	3	2	merma	1	33.91	33.91
2883	338	70	2	1	3	merma	11	91.77	1009.47
2884	10	59	10	1	5	venta	1	33.71	33.71
2885	352	1	12	2	3	merma	19	6.53	124.07
2886	48	76	9	1	2	merma	9	13.60	122.40
2887	51	42	9	3	4	venta	21	9.07	190.47
2888	187	2	20	1	3	compra	3	95.61	286.83
2889	113	55	2	3	3	merma	18	81.80	1472.40
2890	346	9	15	3	1	compra	25	62.38	1559.50
2891	161	98	19	3	3	compra	18	76.38	1374.84
2892	242	25	3	2	4	venta	24	24.20	580.80
2893	130	76	7	2	1	venta	13	64.91	843.83
2894	29	25	15	3	3	venta	20	92.29	1845.80
2895	59	33	19	2	5	merma	11	71.65	788.15
2896	317	64	9	3	5	compra	7	9.27	64.89
2897	54	79	20	2	3	merma	7	40.87	286.09
2898	224	32	15	3	1	merma	28	81.23	2274.44
2899	29	3	9	3	3	compra	15	85.49	1282.35
2900	178	68	9	1	3	merma	28	23.52	658.56
2901	133	74	13	3	5	merma	17	23.30	396.10
2902	329	74	12	3	5	venta	30	29.66	889.80
2903	334	44	13	2	5	merma	9	5.12	46.08
2904	294	13	1	3	2	merma	2	18.74	37.48
2905	263	3	7	1	4	venta	13	9.12	118.56
2906	327	74	2	3	3	merma	16	18.55	296.80
2907	92	77	6	3	1	compra	2	12.99	25.98
2908	41	9	20	3	4	venta	8	28.04	224.32
2909	253	94	4	1	3	venta	18	38.64	695.52
2910	116	4	18	1	1	compra	29	36.21	1050.09
2911	22	96	3	2	5	merma	21	76.98	1616.58
2912	149	100	5	3	3	merma	11	92.94	1022.34
2913	253	60	13	3	5	compra	9	98.22	883.98
2914	228	8	17	1	3	compra	29	49.75	1442.75
2915	102	95	6	2	1	venta	1	69.31	69.31
2916	156	12	20	3	2	venta	12	78.93	947.16
2917	8	75	2	1	1	merma	5	77.18	385.90
2918	106	100	7	1	5	merma	15	94.55	1418.25
2919	180	12	18	2	4	merma	27	7.19	194.13
2920	286	32	5	2	3	merma	24	43.17	1036.08
2921	243	59	18	3	1	venta	3	62.71	188.13
2922	347	43	20	1	4	venta	20	7.92	158.40
2923	359	45	14	3	1	compra	26	82.94	2156.44
2924	143	99	15	3	1	compra	9	84.50	760.50
2925	17	67	3	3	5	venta	21	38.83	815.43
2926	274	21	10	1	2	merma	29	6.78	196.62
2927	252	93	4	2	2	merma	2	78.38	156.76
2928	315	14	16	3	3	merma	21	84.84	1781.64
2929	38	50	6	2	3	compra	13	55.43	720.59
2930	70	13	8	3	1	merma	19	38.59	733.21
2931	105	21	11	3	2	compra	19	62.38	1185.22
2932	87	92	2	3	2	merma	23	44.56	1024.88
2933	78	66	10	2	5	merma	13	40.62	528.06
2934	126	90	16	3	5	compra	1	15.17	15.17
2935	129	8	13	1	3	merma	15	43.16	647.40
2936	320	99	6	2	3	merma	8	39.50	316.00
2937	29	75	4	1	1	venta	5	5.64	28.20
2938	264	82	12	1	5	venta	29	42.06	1219.74
2939	342	45	2	1	1	merma	8	97.56	780.48
2940	108	64	16	2	1	merma	4	56.82	227.28
2941	358	68	10	1	5	merma	7	86.65	606.55
2942	11	68	10	3	5	venta	11	89.83	988.13
2943	157	98	1	2	4	compra	23	66.78	1535.94
2944	346	84	1	2	4	compra	4	51.82	207.28
2945	105	78	15	2	4	venta	17	22.25	378.25
2946	180	17	15	3	4	compra	15	30.70	460.50
2947	21	12	19	3	3	merma	12	90.02	1080.24
2948	238	42	10	3	5	venta	15	66.17	992.55
2949	86	73	6	1	2	merma	5	21.06	105.30
2950	169	76	19	2	4	merma	15	54.28	814.20
2951	109	68	14	3	5	merma	3	77.70	233.10
2952	153	65	3	1	2	compra	11	55.53	610.83
2953	305	53	2	3	4	venta	6	60.33	361.98
2954	133	52	20	2	5	compra	16	19.73	315.68
2955	259	75	12	3	1	compra	27	13.49	364.23
2956	131	41	6	3	1	venta	2	87.18	174.36
2957	353	43	19	1	3	merma	8	88.64	709.12
2958	109	94	8	3	5	venta	21	61.91	1300.11
2959	47	47	12	3	2	compra	25	84.21	2105.25
2960	145	15	9	2	1	merma	1	38.99	38.99
2961	340	4	5	3	3	venta	27	46.62	1258.74
2962	146	14	19	3	3	compra	8	11.61	92.88
2963	128	23	11	2	5	merma	18	41.90	754.20
2964	335	86	7	1	3	venta	11	22.35	245.85
2965	253	80	7	3	5	merma	5	91.95	459.75
2966	126	1	15	1	4	venta	8	74.78	598.24
2967	285	88	3	1	4	compra	28	73.35	2053.80
2968	19	42	19	2	3	merma	22	45.58	1002.76
2969	100	68	13	1	1	compra	13	88.38	1148.94
2970	246	62	20	2	2	compra	30	47.53	1425.90
2971	304	11	2	3	5	merma	4	27.94	111.76
2972	304	67	20	3	5	compra	24	98.03	2352.72
2973	132	20	8	2	5	compra	12	83.45	1001.40
2974	273	69	12	1	5	venta	15	80.15	1202.25
2975	345	26	19	3	4	venta	18	52.05	936.90
2976	241	27	14	2	2	merma	20	44.66	893.20
2977	128	12	18	1	1	merma	4	57.90	231.60
2978	239	25	18	2	4	compra	15	60.08	901.20
2979	20	38	14	2	1	merma	24	91.11	2186.64
2980	201	37	12	3	2	venta	17	54.27	922.59
2981	78	79	14	3	5	merma	29	74.48	2159.92
2982	251	9	8	3	5	venta	18	35.42	637.56
2983	32	95	6	3	2	compra	16	90.05	1440.80
2984	112	3	20	3	2	compra	8	6.27	50.16
2985	270	22	9	3	2	compra	17	94.10	1599.70
2986	63	2	7	1	1	compra	30	97.20	2916.00
2987	274	43	16	3	2	compra	10	19.47	194.70
2988	222	85	12	1	2	compra	14	28.31	396.34
2989	69	45	18	1	5	venta	15	29.70	445.50
2990	71	39	15	1	1	venta	18	7.53	135.54
2991	53	57	9	3	2	merma	6	19.34	116.04
2992	10	21	9	3	5	compra	11	88.57	974.27
2993	208	25	2	1	2	compra	12	46.16	553.92
2994	266	68	5	3	4	venta	18	63.41	1141.38
2995	274	5	3	2	2	venta	19	70.15	1332.85
2996	149	14	13	1	2	merma	5	28.11	140.55
2997	300	54	7	3	4	venta	3	24.11	72.33
2998	69	58	12	2	3	venta	7	61.43	430.01
2999	47	81	13	2	3	compra	4	86.56	346.24
3000	212	42	6	2	5	merma	12	64.65	775.80
3001	178	66	9	2	1	venta	28	83.45	2336.60
3002	296	64	20	1	3	compra	15	65.01	975.15
3003	235	86	16	2	2	compra	8	76.35	610.80
3004	89	61	10	1	2	compra	8	33.13	265.04
3005	265	26	16	3	5	merma	20	48.80	976.00
3006	81	5	16	3	2	venta	28	70.74	1980.72
3007	70	61	13	1	5	merma	20	44.23	884.60
3008	83	29	17	2	5	compra	29	18.18	527.22
3009	13	80	1	1	5	merma	10	61.45	614.50
3010	153	54	1	1	2	compra	24	42.63	1023.12
3011	273	24	12	2	2	merma	29	16.84	488.36
3012	211	43	4	3	3	merma	21	82.20	1726.20
3013	2	20	9	1	2	compra	11	71.73	789.03
3014	258	70	5	3	5	merma	22	72.67	1598.74
3015	258	73	13	1	2	merma	26	25.51	663.26
3016	241	81	16	3	4	venta	4	31.67	126.68
3017	76	26	18	2	4	compra	8	97.81	782.48
3018	2	78	6	1	4	merma	30	31.24	937.20
3019	199	27	12	2	1	venta	10	58.79	587.90
3020	232	27	5	3	5	venta	13	8.35	108.55
3021	327	54	15	2	3	merma	14	17.99	251.86
3022	150	23	18	2	4	compra	9	11.79	106.11
3023	36	82	4	2	3	venta	1	97.92	97.92
3024	152	37	2	3	2	venta	13	85.07	1105.91
3025	86	6	15	2	4	merma	18	5.58	100.44
3026	363	60	3	3	4	compra	21	17.82	374.22
3027	15	58	11	3	5	compra	26	96.35	2505.10
3028	211	62	11	1	1	venta	23	64.08	1473.84
3029	1	53	4	3	1	compra	14	10.28	143.92
3030	269	60	10	2	1	compra	14	94.09	1317.26
3031	188	25	1	2	5	merma	18	49.80	896.40
3032	79	12	8	2	4	compra	27	92.89	2508.03
3033	235	53	13	2	3	venta	20	86.92	1738.40
3034	362	40	20	3	3	compra	2	19.79	39.58
3035	199	31	3	1	4	venta	15	20.90	313.50
3036	71	48	9	3	1	merma	16	98.77	1580.32
3037	286	55	7	2	4	compra	22	48.74	1072.28
3038	226	6	2	3	1	merma	11	28.00	308.00
3039	81	66	5	2	2	compra	24	70.67	1696.08
3040	305	64	17	3	1	merma	16	68.70	1099.20
3041	299	37	19	1	3	venta	26	31.81	827.06
3042	115	69	18	3	4	compra	12	93.75	1125.00
3043	59	35	13	2	4	venta	3	36.40	109.20
3044	346	43	20	1	1	venta	13	43.23	561.99
3045	320	96	11	2	4	venta	17	94.93	1613.81
3046	349	78	6	1	2	venta	17	80.08	1361.36
3047	247	99	18	2	1	compra	13	25.55	332.15
3048	184	50	8	1	1	venta	26	59.79	1554.54
3049	183	36	9	1	5	compra	29	51.47	1492.63
3050	316	9	10	1	1	merma	18	34.75	625.50
3051	129	48	16	3	5	venta	12	34.48	413.76
3052	346	34	10	2	4	venta	21	18.20	382.20
3053	309	3	1	3	2	merma	20	76.57	1531.40
3054	354	11	9	2	3	merma	3	63.87	191.61
3055	156	40	1	1	1	compra	14	42.33	592.62
3056	215	65	20	1	3	venta	9	95.24	857.16
3057	43	43	1	1	5	compra	27	77.23	2085.21
3058	307	2	3	3	4	compra	21	66.69	1400.49
3059	171	24	9	3	4	venta	23	28.27	650.21
3060	49	80	11	3	2	merma	11	5.99	65.89
3061	76	29	16	3	2	venta	1	69.34	69.34
3062	134	70	15	3	4	venta	29	37.47	1086.63
3063	106	96	1	3	3	merma	21	24.39	512.19
3064	189	10	17	3	1	venta	21	56.10	1178.10
3065	84	23	16	3	3	compra	18	90.14	1622.52
3066	2	17	4	3	3	merma	11	57.30	630.30
3067	144	80	14	3	1	merma	26	80.85	2102.10
3068	233	24	7	2	4	compra	10	11.19	111.90
3069	282	45	16	1	1	venta	2	97.60	195.20
3070	180	39	10	3	2	compra	8	43.46	347.68
3071	341	48	10	1	4	compra	6	90.88	545.28
3072	236	69	20	1	2	compra	10	96.22	962.20
3073	292	12	20	2	4	merma	8	32.96	263.68
3074	85	78	8	3	1	compra	17	99.18	1686.06
3075	99	7	7	2	5	compra	4	28.46	113.84
3076	18	62	19	2	2	compra	28	61.16	1712.48
3077	69	58	12	1	3	venta	23	98.73	2270.79
3078	328	44	3	1	4	merma	8	29.86	238.88
3079	218	88	14	2	5	merma	25	43.86	1096.50
3080	305	95	17	3	3	compra	19	86.94	1651.86
3081	298	45	1	1	5	merma	4	63.73	254.92
3082	341	8	10	3	1	venta	29	73.35	2127.15
3083	204	75	8	2	3	compra	14	53.89	754.46
3084	150	94	5	3	4	compra	12	34.39	412.68
3085	49	38	18	2	4	compra	11	76.20	838.20
3086	270	74	6	1	4	merma	28	61.21	1713.88
3087	72	19	1	3	1	merma	14	73.53	1029.42
3088	196	90	20	1	5	compra	13	12.25	159.25
3089	192	21	2	3	3	venta	13	15.58	202.54
3090	277	54	19	1	2	compra	25	70.22	1755.50
3091	35	42	13	3	2	venta	22	19.54	429.88
3092	123	40	18	2	4	merma	18	59.25	1066.50
3093	163	55	10	1	1	merma	6	67.80	406.80
3094	124	17	17	2	1	compra	23	69.39	1595.97
3095	224	51	12	3	2	venta	25	20.46	511.50
3096	247	28	16	2	5	compra	24	86.82	2083.68
3097	187	33	1	1	3	compra	29	81.01	2349.29
3098	145	97	3	1	3	merma	4	47.71	190.84
3099	30	79	15	3	1	compra	28	72.12	2019.36
3100	180	54	16	3	1	merma	14	17.60	246.40
3101	169	98	15	2	1	merma	9	24.14	217.26
3102	25	76	9	2	2	venta	23	96.56	2220.88
3103	334	83	11	1	4	compra	21	42.82	899.22
3104	283	17	5	2	5	venta	29	47.95	1390.55
3105	253	97	20	2	3	compra	20	50.59	1011.80
3106	277	5	3	3	1	venta	14	7.46	104.44
3107	78	88	8	1	5	merma	18	46.75	841.50
3108	353	50	3	2	1	venta	29	38.58	1118.82
3109	264	45	8	1	2	venta	14	44.87	628.18
3110	328	44	14	2	2	merma	15	46.61	699.15
3111	189	87	2	1	4	venta	13	34.44	447.72
3112	365	100	11	1	3	merma	19	78.07	1483.33
3113	71	73	3	3	1	venta	20	63.91	1278.20
3114	267	81	10	1	5	compra	30	22.23	666.90
3115	202	4	13	2	5	venta	14	90.78	1270.92
3116	145	45	16	3	5	venta	4	40.64	162.56
3117	121	86	17	1	5	venta	26	66.56	1730.56
3118	284	8	20	2	3	merma	16	78.87	1261.92
3119	306	24	12	3	2	compra	12	38.22	458.64
3120	90	89	20	1	1	compra	9	79.99	719.91
3121	325	47	2	3	4	compra	30	57.24	1717.20
3122	333	61	11	1	4	merma	14	15.13	211.82
3123	296	17	6	3	5	compra	16	8.01	128.16
3124	340	66	13	3	5	venta	9	39.30	353.70
3125	349	68	13	3	1	merma	18	60.91	1096.38
3126	197	54	14	2	4	merma	22	11.09	243.98
3127	118	89	12	1	5	merma	17	43.70	742.90
3128	353	88	12	3	2	merma	29	61.23	1775.67
3129	187	46	8	1	2	merma	15	73.47	1102.05
3130	83	26	9	2	1	compra	25	43.36	1084.00
3131	19	21	11	2	3	merma	28	48.66	1362.48
3132	55	16	11	2	5	merma	23	54.32	1249.36
3133	362	96	19	2	1	merma	11	7.01	77.11
3134	222	16	13	3	5	merma	2	85.00	170.00
3135	194	24	1	2	2	compra	26	23.83	619.58
3136	212	11	12	1	5	compra	3	99.76	299.28
3137	275	48	18	3	3	compra	12	86.04	1032.48
3138	350	22	2	1	5	compra	4	65.91	263.64
3139	116	80	5	2	1	compra	19	21.08	400.52
3140	121	88	12	1	4	compra	25	96.96	2424.00
3141	38	34	14	2	2	merma	6	38.52	231.12
3142	168	36	20	2	4	merma	3	25.63	76.89
3143	32	16	20	3	3	merma	30	94.49	2834.70
3144	294	96	20	1	1	compra	1	89.27	89.27
3145	338	69	9	3	1	compra	17	90.08	1531.36
3146	267	34	17	3	3	merma	17	84.90	1443.30
3147	97	28	7	2	1	merma	17	38.34	651.78
3148	136	20	20	1	5	venta	5	50.98	254.90
3149	290	9	9	1	3	merma	21	47.57	998.97
3150	105	64	20	3	3	merma	11	26.79	294.69
3151	186	51	16	2	4	compra	24	71.24	1709.76
3152	49	42	20	3	4	merma	15	80.55	1208.25
3153	358	91	7	3	5	compra	28	81.62	2285.36
3154	98	40	2	3	1	compra	10	72.67	726.70
3155	301	37	5	2	2	venta	27	11.88	320.76
3156	217	98	5	2	4	venta	6	8.57	51.42
3157	142	100	19	1	1	compra	12	94.63	1135.56
3158	233	86	15	1	5	merma	20	72.16	1443.20
3159	66	28	3	1	3	venta	19	19.95	379.05
3160	98	47	9	2	5	merma	30	90.81	2724.30
3161	1	38	13	1	5	merma	17	47.31	804.27
3162	137	33	10	2	1	venta	13	53.56	696.28
3163	198	73	6	3	2	venta	10	75.86	758.60
3164	156	79	9	3	2	merma	8	36.86	294.88
3165	322	49	6	3	1	venta	22	14.94	328.68
3166	110	25	9	3	3	merma	4	13.49	53.96
3167	338	16	4	3	3	merma	27	64.67	1746.09
3168	327	88	10	3	5	merma	13	47.98	623.74
3169	223	77	10	3	3	merma	1	96.88	96.88
3170	13	82	12	2	4	merma	5	63.95	319.75
3171	250	91	10	3	5	compra	21	28.23	592.83
3172	273	79	3	2	1	merma	19	17.56	333.64
3173	134	43	8	3	4	venta	24	8.88	213.12
3174	273	7	11	1	1	venta	19	35.82	680.58
3175	173	63	1	3	4	compra	16	76.90	1230.40
3176	196	74	17	2	1	venta	14	47.08	659.12
3177	137	51	12	1	3	merma	20	72.30	1446.00
3178	46	97	16	2	2	compra	7	42.99	300.93
3179	74	8	7	2	2	merma	29	67.22	1949.38
3180	64	99	18	1	3	compra	10	95.89	958.90
3181	350	58	12	2	5	compra	7	54.74	383.18
3182	262	2	20	2	1	merma	15	10.18	152.70
3183	324	98	16	2	1	merma	14	53.45	748.30
3184	287	20	18	2	1	merma	2	75.61	151.22
3185	235	65	15	1	2	merma	2	67.46	134.92
3186	252	73	13	2	2	merma	19	92.73	1761.87
3187	106	73	12	1	3	compra	19	31.32	595.08
3188	143	33	7	3	4	venta	19	75.15	1427.85
3189	137	22	10	3	3	compra	15	61.09	916.35
3190	138	27	20	3	3	venta	6	42.79	256.74
3191	313	99	11	1	3	compra	7	6.08	42.56
3192	31	38	7	3	1	compra	29	70.94	2057.26
3193	355	62	16	2	1	merma	2	53.79	107.58
3194	207	18	18	1	1	merma	22	43.11	948.42
3195	63	85	10	1	4	merma	21	46.69	980.49
3196	289	36	1	2	3	venta	14	89.05	1246.70
3197	79	63	2	3	2	merma	22	6.26	137.72
3198	267	52	15	3	3	venta	9	6.23	56.07
3199	174	91	15	2	2	merma	18	83.83	1508.94
3200	331	67	7	2	3	compra	25	88.25	2206.25
3201	51	73	18	3	3	compra	24	45.99	1103.76
3202	339	75	10	3	5	merma	5	44.30	221.50
3203	337	3	9	1	5	compra	9	59.18	532.62
3204	310	80	16	2	5	compra	3	36.70	110.10
3205	201	27	20	2	3	merma	9	18.53	166.77
3206	289	30	10	2	5	venta	15	24.86	372.90
3207	1	99	4	3	3	compra	6	49.77	298.62
3208	154	24	14	2	1	venta	15	6.80	102.00
3209	87	36	20	3	4	compra	5	60.76	303.80
3210	298	81	18	2	4	merma	16	27.68	442.88
3211	8	53	6	1	5	compra	20	8.73	174.60
3212	33	19	15	1	5	compra	12	40.73	488.76
3213	212	31	4	3	5	compra	6	79.32	475.92
3214	342	93	19	1	5	venta	8	81.79	654.32
3215	34	63	12	2	2	merma	26	82.50	2145.00
3216	59	32	14	1	1	compra	17	15.03	255.51
3217	193	53	18	2	2	merma	20	24.65	493.00
3218	53	16	9	1	3	compra	28	63.83	1787.24
3219	277	93	10	3	5	compra	25	98.78	2469.50
3220	58	16	17	2	5	merma	26	28.02	728.52
3221	26	96	12	1	4	compra	4	29.72	118.88
3222	104	38	17	2	1	compra	19	55.40	1052.60
3223	275	43	20	3	4	compra	6	89.29	535.74
3224	16	73	8	1	4	merma	11	10.46	115.06
3225	189	30	8	1	2	venta	17	62.67	1065.39
3226	273	48	15	2	2	compra	23	32.72	752.56
3227	262	39	16	3	4	merma	2	5.93	11.86
3228	68	19	20	1	3	merma	1	50.34	50.34
3229	138	17	20	3	3	merma	30	26.42	792.60
3230	55	18	20	2	3	venta	16	94.98	1519.68
3231	17	17	13	2	3	merma	18	57.59	1036.62
3232	289	81	18	1	2	compra	23	23.56	541.88
3233	268	63	17	1	1	compra	16	69.32	1109.12
3234	256	50	14	3	1	venta	14	92.58	1296.12
3235	238	74	12	3	5	compra	5	26.08	130.40
3236	94	89	5	3	4	merma	2	16.23	32.46
3237	213	93	16	1	2	venta	27	11.20	302.40
3238	195	33	3	1	5	merma	4	21.77	87.08
3239	95	20	14	1	1	compra	16	25.07	401.12
3240	102	50	11	3	2	venta	26	92.96	2416.96
3241	213	85	19	1	4	merma	18	65.32	1175.76
3242	345	58	2	2	1	venta	13	70.81	920.53
3243	102	73	13	1	4	compra	20	16.90	338.00
3244	261	44	4	1	4	merma	26	58.48	1520.48
3245	195	37	19	1	5	compra	5	79.09	395.45
3246	184	47	14	3	2	venta	21	75.38	1582.98
3247	256	80	10	1	3	compra	25	29.86	746.50
3248	199	21	19	2	3	compra	12	68.32	819.84
3249	323	34	1	1	1	compra	7	28.97	202.79
3250	41	21	3	1	1	merma	24	34.52	828.48
3251	71	70	6	2	3	compra	18	38.86	699.48
3252	281	36	9	3	5	venta	29	88.34	2561.86
3253	322	34	15	2	1	venta	19	77.11	1465.09
3254	227	39	16	1	3	merma	5	11.99	59.95
3255	7	97	9	1	4	venta	17	74.10	1259.70
3256	145	17	12	3	3	merma	13	7.30	94.90
3257	258	54	2	1	5	merma	5	48.40	242.00
3258	322	63	8	3	4	venta	11	65.89	724.79
3259	38	17	5	2	5	merma	11	89.69	986.59
3260	190	5	11	3	5	venta	22	8.35	183.70
3261	87	16	19	2	3	merma	3	35.38	106.14
3262	109	70	12	2	2	merma	16	61.61	985.76
3263	335	54	10	2	3	compra	29	78.80	2285.20
3264	348	14	14	2	5	compra	1	31.40	31.40
3265	334	3	10	2	4	compra	12	39.51	474.12
3266	257	79	10	3	3	compra	7	37.89	265.23
3267	179	46	9	3	2	merma	20	74.84	1496.80
3268	112	87	5	3	5	compra	5	39.37	196.85
3269	308	15	18	1	4	compra	26	63.85	1660.10
3270	1	18	19	2	4	merma	22	49.04	1078.88
3271	43	79	9	3	5	merma	12	47.08	564.96
3272	281	72	9	2	2	merma	29	53.07	1539.03
3273	56	62	4	3	1	merma	10	67.76	677.60
3274	358	19	5	1	5	merma	28	25.98	727.44
3275	330	95	9	3	2	merma	22	62.58	1376.76
3276	64	99	11	2	2	venta	30	71.41	2142.30
3277	360	13	6	2	1	venta	10	13.89	138.90
3278	144	85	14	3	1	venta	30	91.79	2753.70
3279	169	53	3	2	4	compra	18	30.75	553.50
3280	192	3	19	1	3	merma	6	51.91	311.46
3281	232	91	6	2	4	venta	25	22.56	564.00
3282	325	44	7	1	1	merma	12	26.54	318.48
3283	311	16	11	2	3	merma	4	17.38	69.52
3284	40	81	16	2	2	merma	5	21.20	106.00
3285	145	25	2	2	1	venta	12	87.18	1046.16
3286	110	25	4	3	3	venta	10	26.55	265.50
3287	115	13	7	2	2	venta	20	75.48	1509.60
3288	114	86	3	1	2	compra	1	91.72	91.72
3289	117	16	5	1	1	merma	20	80.51	1610.20
3290	326	85	20	3	2	merma	17	26.86	456.62
3291	229	56	10	1	4	venta	16	68.59	1097.44
3292	9	10	14	2	1	compra	11	66.88	735.68
3293	274	15	10	2	5	venta	16	75.99	1215.84
3294	264	90	8	2	3	venta	22	68.21	1500.62
3295	71	40	19	2	3	compra	23	80.42	1849.66
3296	131	82	13	2	5	venta	7	58.90	412.30
3297	292	49	14	3	3	merma	23	6.39	146.97
3298	292	92	8	1	4	merma	24	77.89	1869.36
3299	292	12	2	1	1	compra	27	90.24	2436.48
3300	303	20	2	3	2	merma	9	60.66	545.94
3301	233	61	18	1	4	venta	7	90.60	634.20
3302	134	32	3	3	4	compra	21	92.47	1941.87
3303	116	84	9	1	3	venta	16	97.66	1562.56
3304	295	44	4	2	4	venta	24	59.38	1425.12
3305	86	91	4	2	4	venta	27	73.41	1982.07
3306	129	72	2	1	4	merma	23	52.84	1215.32
3307	45	47	14	1	1	venta	22	68.88	1515.36
3308	104	99	18	1	2	merma	12	93.47	1121.64
3309	130	51	8	2	2	compra	29	77.35	2243.15
3310	358	89	16	3	3	merma	5	6.82	34.10
3311	83	71	10	1	5	compra	5	58.43	292.15
3312	107	87	19	3	4	venta	16	34.88	558.08
3313	283	21	9	1	1	venta	20	55.12	1102.40
3314	290	36	1	2	4	compra	6	73.12	438.72
3315	359	24	9	3	4	venta	22	18.11	398.42
3316	287	25	20	3	3	compra	28	61.00	1708.00
3317	327	87	12	2	2	venta	11	73.42	807.62
3318	97	100	4	2	3	venta	22	98.08	2157.76
3319	142	66	7	2	4	compra	7	66.77	467.39
3320	66	88	13	3	3	venta	22	76.45	1681.90
3321	355	15	3	2	5	venta	25	59.64	1491.00
3322	142	66	16	2	5	merma	25	39.97	999.25
3323	216	46	11	3	1	venta	6	99.06	594.36
3324	177	22	2	2	3	venta	20	12.63	252.60
3325	30	95	18	1	4	compra	25	42.82	1070.50
3326	30	36	3	1	2	compra	5	53.22	266.10
3327	82	26	10	2	5	compra	15	35.91	538.65
3328	90	87	2	1	1	compra	29	54.79	1588.91
3329	109	36	4	1	5	compra	8	99.79	798.32
3330	353	80	9	2	5	merma	11	82.98	912.78
3331	357	19	3	3	1	merma	24	5.28	126.72
3332	57	5	19	1	4	compra	15	67.54	1013.10
3333	216	59	2	3	1	compra	7	87.69	613.83
3334	87	85	1	3	2	compra	9	13.94	125.46
3335	93	30	17	2	3	compra	2	32.42	64.84
3336	157	64	3	2	2	merma	22	78.62	1729.64
3337	221	81	9	2	2	compra	19	19.11	363.09
3338	179	24	20	1	3	merma	21	43.43	912.03
3339	175	29	11	3	2	merma	1	24.43	24.43
3340	315	66	3	1	3	merma	17	32.82	557.94
3341	180	37	6	1	2	venta	14	43.51	609.14
3342	265	30	11	1	4	venta	8	72.84	582.72
3343	245	60	14	1	5	compra	28	98.67	2762.76
3344	22	7	13	1	2	compra	4	57.36	229.44
3345	274	38	15	3	3	venta	10	9.61	96.10
3346	270	41	3	2	5	compra	10	8.45	84.50
3347	110	62	5	1	5	compra	27	8.69	234.63
3348	228	81	3	3	1	merma	19	98.01	1862.19
3349	65	68	8	1	5	venta	18	25.76	463.68
3350	146	32	13	3	2	merma	28	96.65	2706.20
3351	15	39	17	3	2	venta	23	42.52	977.96
3352	345	12	6	3	3	compra	9	15.32	137.88
3353	7	84	8	3	2	venta	30	26.90	807.00
3354	59	26	4	2	5	venta	25	86.83	2170.75
3355	90	31	4	3	4	compra	2	54.93	109.86
3356	210	29	10	2	1	merma	20	9.21	184.20
3357	33	52	10	3	1	venta	26	24.27	631.02
3358	37	19	14	3	4	venta	12	55.22	662.64
3359	197	41	3	3	3	compra	20	7.42	148.40
3360	68	37	20	1	2	merma	24	38.17	916.08
3361	256	77	4	2	3	venta	14	82.56	1155.84
3362	242	85	2	3	3	merma	30	17.28	518.40
3363	308	1	19	2	4	venta	24	99.09	2378.16
3364	279	26	20	3	4	compra	29	16.25	471.25
3365	142	79	17	1	4	compra	25	13.39	334.75
3366	359	66	17	2	2	merma	3	49.77	149.31
3367	161	24	19	1	5	venta	4	36.65	146.60
3368	17	95	16	2	3	merma	24	12.09	290.16
3369	211	67	14	1	2	venta	21	17.58	369.18
3370	42	3	1	3	1	compra	14	99.95	1399.30
3371	146	96	12	1	4	merma	19	90.10	1711.90
3372	69	50	16	3	1	compra	30	36.12	1083.60
3373	157	60	1	3	5	merma	19	17.60	334.40
3374	105	93	13	2	5	venta	29	93.71	2717.59
3375	241	59	16	2	1	venta	23	70.20	1614.60
3376	354	83	17	3	1	compra	1	53.68	53.68
3377	190	52	2	1	4	compra	25	32.43	810.75
3378	102	69	3	3	1	merma	19	27.84	528.96
3379	241	61	14	2	1	compra	17	24.17	410.89
3380	238	55	8	3	4	compra	8	10.20	81.60
3381	286	98	11	3	2	merma	7	31.45	220.15
3382	158	43	19	3	1	merma	7	50.87	356.09
3383	137	11	12	1	1	compra	27	95.41	2576.07
3384	125	23	17	1	2	compra	9	86.44	777.96
3385	212	18	13	3	3	merma	24	82.34	1976.16
3386	306	12	16	3	4	merma	5	78.26	391.30
3387	62	12	2	1	2	compra	4	49.14	196.56
3388	14	28	11	2	3	venta	13	22.37	290.81
3389	305	52	8	1	4	compra	12	94.82	1137.84
3390	53	40	7	1	1	venta	28	8.10	226.80
3391	300	43	3	2	3	venta	23	74.32	1709.36
3392	143	81	6	3	4	compra	6	43.83	262.98
3393	22	11	1	3	3	venta	29	84.80	2459.20
3394	260	41	6	3	1	venta	4	86.42	345.68
3395	328	71	3	3	5	venta	1	9.71	9.71
3396	223	68	8	2	4	compra	17	88.67	1507.39
3397	62	87	9	1	5	venta	11	51.62	567.82
3398	104	5	17	2	4	merma	12	24.88	298.56
3399	37	18	3	1	5	venta	23	56.16	1291.68
3400	41	13	19	3	3	merma	11	46.59	512.49
3401	190	59	9	3	1	merma	28	84.63	2369.64
3402	35	74	3	2	5	venta	23	68.54	1576.42
3403	63	6	2	3	3	venta	28	30.36	850.08
3404	10	1	14	3	2	compra	12	70.43	845.16
3405	279	39	15	3	4	venta	21	59.06	1240.26
3406	198	36	12	3	5	venta	2	80.29	160.58
3407	173	80	1	1	4	merma	10	30.74	307.40
3408	212	6	20	1	1	compra	2	84.74	169.48
3409	32	80	18	1	1	compra	3	62.23	186.69
3410	221	81	7	3	5	compra	13	77.08	1002.04
3411	301	36	10	1	4	merma	1	51.01	51.01
3412	291	27	10	1	2	compra	21	99.88	2097.48
3413	300	15	9	3	5	merma	17	36.68	623.56
3414	341	20	14	3	5	merma	4	59.43	237.72
3415	101	91	2	3	2	merma	16	97.25	1556.00
3416	211	21	8	1	1	merma	3	70.63	211.89
3417	42	46	17	3	1	compra	3	50.04	150.12
3418	16	59	11	2	2	merma	23	78.89	1814.47
3419	340	56	13	2	3	venta	30	46.65	1399.50
3420	280	18	10	1	5	merma	9	37.51	337.59
3421	93	54	12	2	5	venta	17	84.36	1434.12
3422	229	5	17	1	2	merma	30	43.80	1314.00
3423	150	73	14	1	5	compra	9	37.47	337.23
3424	301	54	19	1	1	merma	27	62.18	1678.86
3425	130	64	6	1	2	compra	17	55.00	935.00
3426	218	81	7	2	3	venta	18	11.04	198.72
3427	41	17	15	2	5	merma	21	77.49	1627.29
3428	319	33	14	3	2	compra	26	50.12	1303.12
3429	142	74	17	2	5	venta	22	66.83	1470.26
3430	269	23	4	1	5	merma	8	79.30	634.40
3431	316	21	14	2	4	venta	4	81.86	327.44
3432	21	13	5	1	1	merma	3	31.64	94.92
3433	13	63	8	3	3	merma	11	39.91	439.01
3434	171	54	10	1	5	venta	20	10.95	219.00
3435	12	81	14	2	1	merma	12	14.58	174.96
3436	141	9	9	3	3	venta	21	7.77	163.17
3437	299	60	5	3	5	merma	6	31.93	191.58
3438	223	62	20	3	3	merma	3	56.92	170.76
3439	217	77	11	2	2	compra	18	62.74	1129.32
3440	221	48	4	3	5	compra	28	43.64	1221.92
3441	231	59	13	3	1	compra	29	72.41	2099.89
3442	28	26	16	2	5	merma	21	84.46	1773.66
3443	53	15	16	2	1	merma	11	59.11	650.21
3444	253	97	6	1	2	venta	11	68.47	753.17
3445	210	47	5	1	2	compra	13	37.89	492.57
3446	257	42	8	2	1	merma	29	27.23	789.67
3447	153	86	6	2	5	venta	2	95.08	190.16
3448	117	18	13	1	1	compra	23	34.71	798.33
3449	194	34	4	1	3	compra	23	69.01	1587.23
3450	236	85	8	3	5	merma	12	99.40	1192.80
3451	4	35	8	3	3	venta	12	28.96	347.52
3452	337	80	13	1	5	compra	4	51.71	206.84
3453	109	86	14	1	4	venta	1	73.52	73.52
3454	329	40	20	3	5	compra	27	61.91	1671.57
3455	214	87	8	3	5	compra	14	7.01	98.14
3456	12	2	7	2	1	merma	26	14.63	380.38
3457	63	100	4	2	5	venta	10	23.43	234.30
3458	276	20	15	3	2	venta	11	95.11	1046.21
3459	156	16	4	1	1	venta	5	26.28	131.40
3460	95	92	9	1	2	venta	30	48.05	1441.50
3461	106	46	7	1	5	venta	1	76.99	76.99
3462	338	87	15	2	5	merma	30	11.14	334.20
3463	99	61	7	3	2	merma	21	40.48	850.08
3464	159	26	16	3	1	venta	6	79.68	478.08
3465	260	8	1	3	4	compra	27	13.00	351.00
3466	53	84	18	1	3	merma	6	17.85	107.10
3467	226	27	5	1	1	merma	16	28.23	451.68
3468	286	81	7	2	2	venta	10	82.69	826.90
3469	136	17	11	3	2	venta	28	93.47	2617.16
3470	214	4	12	2	5	compra	26	25.54	664.04
3471	359	42	15	3	5	merma	29	8.23	238.67
3472	203	8	16	2	4	compra	19	94.50	1795.50
3473	32	27	4	2	1	compra	18	16.15	290.70
3474	221	37	1	3	4	merma	4	62.84	251.36
3475	354	54	6	2	2	compra	23	5.72	131.56
3476	152	27	8	1	1	venta	11	67.44	741.84
3477	333	44	10	2	2	merma	15	39.05	585.75
3478	352	6	16	3	5	merma	13	20.00	260.00
3479	263	60	5	1	2	compra	9	34.00	306.00
3480	363	65	3	2	1	compra	10	98.71	987.10
3481	360	55	2	2	2	merma	27	18.53	500.31
3482	166	21	20	1	1	merma	15	69.06	1035.90
3483	107	91	18	3	4	compra	20	93.41	1868.20
3484	241	27	14	1	2	merma	9	79.39	714.51
3485	297	81	15	2	3	merma	22	33.24	731.28
3486	41	58	17	2	1	merma	15	55.31	829.65
3487	294	36	18	1	1	merma	23	83.46	1919.58
3488	310	56	18	3	5	compra	8	25.86	206.88
3489	40	92	19	2	3	compra	22	11.08	243.76
3490	10	1	2	2	1	venta	7	29.38	205.66
3491	271	43	4	1	4	venta	2	59.67	119.34
3492	331	67	4	3	4	compra	10	73.65	736.50
3493	105	91	12	1	5	compra	17	91.59	1557.03
3494	285	23	18	2	4	venta	12	8.48	101.76
3495	294	61	8	1	4	venta	14	67.04	938.56
3496	207	96	3	2	1	compra	1	65.77	65.77
3497	363	71	19	1	1	compra	24	27.60	662.40
3498	195	77	4	2	1	compra	16	50.65	810.40
3499	306	42	5	1	2	compra	2	7.86	15.72
3500	180	84	7	1	2	compra	27	24.19	653.13
3501	269	60	19	3	1	venta	12	68.42	821.04
3502	59	72	1	3	2	venta	6	83.08	498.48
3503	208	51	18	3	1	compra	13	14.77	192.01
3504	168	10	6	1	1	compra	28	42.47	1189.16
3505	177	28	18	3	1	merma	27	77.04	2080.08
3506	59	29	8	2	4	compra	16	71.52	1144.32
3507	165	46	12	2	1	compra	27	25.67	693.09
3508	342	42	15	2	1	merma	12	48.17	578.04
3509	141	65	11	2	2	compra	25	21.07	526.75
3510	122	18	17	2	2	compra	30	43.61	1308.30
3511	216	27	13	2	2	merma	12	18.80	225.60
3512	249	94	1	1	1	merma	26	8.61	223.86
3513	44	6	12	3	5	compra	8	17.60	140.80
3514	128	12	15	1	4	compra	5	66.66	333.30
3515	77	33	1	2	3	merma	21	27.24	572.04
3516	208	72	15	2	4	compra	10	59.94	599.40
3517	255	39	5	2	3	merma	11	37.77	415.47
3518	160	80	11	1	2	merma	10	73.98	739.80
3519	166	41	12	1	1	compra	9	30.50	274.50
3520	311	69	20	3	1	compra	4	19.61	78.44
3521	158	48	2	2	5	compra	20	50.31	1006.20
3522	226	48	5	2	2	merma	16	69.84	1117.44
3523	309	69	18	2	2	venta	29	73.92	2143.68
3524	233	58	9	2	3	compra	5	30.06	150.30
3525	6	84	4	2	5	venta	15	31.96	479.40
3526	124	26	3	1	2	merma	5	29.34	146.70
3527	92	24	15	2	4	merma	12	35.69	428.28
3528	156	80	13	1	3	compra	22	31.23	687.06
3529	246	24	7	3	5	venta	17	32.49	552.33
3530	211	20	7	1	1	merma	20	59.83	1196.60
3531	336	43	3	1	5	venta	21	60.36	1267.56
3532	2	47	11	3	5	merma	16	9.22	147.52
3533	213	30	10	2	1	merma	21	14.89	312.69
3534	252	33	8	1	1	merma	30	84.40	2532.00
3535	127	88	9	2	5	merma	19	23.64	449.16
3536	365	17	19	3	5	venta	20	95.08	1901.60
3537	133	15	13	3	5	merma	22	51.50	1133.00
3538	334	80	9	1	5	merma	29	40.48	1173.92
3539	74	55	18	2	3	compra	15	12.79	191.85
3540	194	23	17	1	1	compra	21	28.39	596.19
3541	298	61	10	3	4	venta	5	95.95	479.75
3542	47	68	11	3	4	merma	6	7.27	43.62
3543	1	49	11	1	3	merma	17	33.11	562.87
3544	156	61	3	2	4	compra	6	7.04	42.24
3545	336	17	6	3	4	compra	9	27.90	251.10
3546	1	33	3	1	1	compra	5	28.40	142.00
3547	89	53	8	1	2	merma	2	80.09	160.18
3548	366	4	5	1	2	merma	28	66.55	1863.40
3549	24	64	15	2	1	merma	22	24.70	543.40
3550	62	77	4	2	3	compra	29	74.65	2164.85
3551	56	29	15	2	4	venta	10	12.08	120.80
3552	18	19	5	3	2	compra	20	27.55	551.00
3553	253	7	15	3	5	venta	18	25.86	465.48
3554	347	12	11	1	1	merma	13	29.96	389.48
3555	306	25	19	3	3	venta	24	49.87	1196.88
3556	260	27	19	1	4	compra	9	38.11	342.99
3557	81	11	8	1	3	venta	27	23.92	645.84
3558	52	32	8	2	2	venta	15	93.10	1396.50
3559	349	100	17	1	1	merma	11	48.03	528.33
3560	60	92	7	2	1	merma	13	60.50	786.50
3561	63	5	10	1	4	compra	14	95.39	1335.46
3562	33	67	18	1	3	compra	22	50.77	1116.94
3563	312	88	18	1	5	venta	5	85.87	429.35
3564	267	92	1	3	2	venta	8	71.83	574.64
3565	32	28	17	3	3	venta	30	19.88	596.40
3566	205	81	12	2	5	venta	17	63.57	1080.69
3567	54	29	3	3	5	compra	23	16.58	381.34
3568	217	56	4	2	5	merma	30	36.94	1108.20
3569	69	55	3	1	2	venta	2	29.46	58.92
3570	174	91	17	3	1	merma	7	37.69	263.83
3571	99	27	10	3	3	venta	16	17.07	273.12
3572	158	54	4	2	1	compra	6	46.99	281.94
3573	225	73	9	3	3	merma	23	75.41	1734.43
3574	77	18	1	2	3	compra	20	93.37	1867.40
3575	291	5	2	3	3	merma	19	56.79	1079.01
3576	121	67	4	3	1	merma	12	44.00	528.00
3577	209	1	17	3	4	venta	12	62.53	750.36
3578	180	74	10	1	3	venta	17	29.32	498.44
3579	33	9	19	1	4	venta	27	36.62	988.74
3580	111	28	20	1	1	compra	25	73.74	1843.50
3581	161	70	16	3	3	merma	5	54.17	270.85
3582	223	26	7	3	3	compra	17	17.28	293.76
3583	88	91	1	2	3	merma	3	84.04	252.12
3584	64	3	10	3	1	compra	30	78.24	2347.20
3585	100	80	14	2	4	venta	16	12.28	196.48
3586	23	15	16	3	3	merma	24	93.87	2252.88
3587	50	15	16	2	5	venta	24	84.95	2038.80
3588	91	42	8	1	1	compra	29	81.15	2353.35
3589	17	12	17	1	5	venta	13	68.20	886.60
3590	316	64	17	2	3	merma	9	20.65	185.85
3591	332	43	1	3	2	merma	17	75.35	1280.95
3592	324	60	17	1	2	compra	14	36.85	515.90
3593	16	87	1	1	4	compra	18	52.09	937.62
3594	175	89	11	3	5	compra	9	86.11	774.99
3595	153	5	17	3	2	compra	17	46.79	795.43
3596	255	19	18	1	4	compra	22	65.81	1447.82
3597	360	34	9	1	4	merma	4	63.75	255.00
3598	350	1	16	3	2	compra	13	10.85	141.05
3599	360	56	12	1	2	venta	14	99.94	1399.16
3600	177	3	6	3	5	merma	25	30.32	758.00
3601	240	72	12	2	3	compra	28	55.70	1559.60
3602	236	85	10	3	4	venta	12	43.29	519.48
3603	349	7	17	1	4	merma	30	7.97	239.10
3604	39	41	20	2	3	merma	16	21.89	350.24
3605	205	64	10	2	2	compra	17	38.46	653.82
3606	168	97	13	3	4	merma	23	90.51	2081.73
3607	88	16	14	3	3	compra	4	66.60	266.40
3608	115	31	18	1	2	merma	11	50.32	553.52
3609	291	30	13	2	2	venta	25	73.97	1849.25
3610	148	32	2	2	1	merma	29	63.49	1841.21
3611	109	34	11	1	1	compra	4	49.78	199.12
3612	355	10	4	3	5	venta	21	95.39	2003.19
3613	352	87	2	2	2	compra	14	33.07	462.98
3614	28	84	5	1	2	merma	4	51.33	205.32
3615	159	89	2	2	5	venta	24	45.41	1089.84
3616	146	31	4	3	4	venta	14	42.34	592.76
3617	139	100	16	1	3	merma	4	96.46	385.84
3618	13	19	4	1	5	compra	5	11.51	57.55
3619	17	70	4	1	4	venta	24	65.25	1566.00
3620	222	70	8	2	4	venta	5	14.29	71.45
3621	103	29	2	1	1	merma	5	56.31	281.55
3622	92	5	17	1	2	venta	16	8.90	142.40
3623	344	51	14	1	5	compra	10	66.98	669.80
3624	84	1	9	3	3	compra	10	81.27	812.70
3625	354	31	10	3	2	merma	21	11.74	246.54
3626	207	44	8	1	3	venta	23	53.60	1232.80
3627	277	24	13	1	3	venta	22	56.56	1244.32
3628	234	77	11	1	1	merma	5	87.82	439.10
3629	350	68	14	3	4	venta	18	10.06	181.08
3630	94	8	20	2	1	merma	7	64.92	454.44
3631	219	99	17	3	2	merma	24	53.25	1278.00
3632	287	84	10	2	2	merma	13	44.59	579.67
3633	345	55	15	2	3	merma	5	53.97	269.85
3634	107	57	7	1	4	merma	1	31.70	31.70
3635	327	31	15	3	1	venta	16	27.84	445.44
3636	170	87	4	3	4	merma	7	81.94	573.58
3637	123	1	10	1	3	venta	22	17.93	394.46
3638	217	90	2	1	1	compra	27	9.64	260.28
3639	16	98	3	1	3	venta	5	63.24	316.20
3640	27	7	15	2	1	merma	11	93.08	1023.88
3641	316	27	8	1	5	venta	13	72.26	939.38
3642	311	65	18	2	2	venta	10	21.36	213.60
3643	337	41	6	3	2	compra	25	18.99	474.75
3644	23	29	14	1	3	venta	2	26.16	52.32
3645	248	85	17	2	1	merma	28	16.59	464.52
3646	343	7	15	1	4	compra	19	15.60	296.40
3647	313	89	11	1	3	venta	2	79.96	159.92
3648	123	97	9	1	1	compra	27	24.82	670.14
3649	272	4	10	3	4	merma	6	84.88	509.28
3650	50	97	5	2	5	venta	11	5.53	60.83
3651	287	95	20	3	4	merma	2	92.21	184.42
3652	311	40	7	1	1	venta	11	17.92	197.12
3653	282	72	2	1	3	venta	25	60.83	1520.75
3654	53	12	18	2	5	compra	5	49.45	247.25
3655	136	38	18	1	3	venta	20	31.30	626.00
3656	328	87	1	2	2	merma	10	72.25	722.50
3657	285	70	5	2	4	venta	15	22.53	337.95
3658	98	5	3	1	3	venta	15	7.17	107.55
3659	28	57	1	1	3	merma	27	95.33	2573.91
3660	118	82	19	2	2	merma	27	58.28	1573.56
3661	340	71	17	3	3	merma	25	14.51	362.75
3662	126	62	20	3	2	merma	21	19.66	412.86
3663	307	44	7	3	4	compra	9	94.74	852.66
3664	99	61	18	2	3	compra	23	50.90	1170.70
3665	355	100	20	1	1	merma	30	94.74	2842.20
3666	135	75	10	3	3	merma	15	84.78	1271.70
3667	4	4	19	2	1	compra	30	34.86	1045.80
3668	207	96	5	1	2	venta	27	38.18	1030.86
3669	234	96	6	1	4	merma	6	55.17	331.02
3670	247	53	20	1	4	merma	18	26.63	479.34
3671	17	27	18	3	2	compra	12	31.85	382.20
3672	39	47	7	1	5	venta	6	89.35	536.10
3673	171	98	10	1	3	merma	5	49.49	247.45
3674	341	13	13	1	1	merma	8	53.57	428.56
3675	248	35	11	1	4	compra	1	7.55	7.55
3676	67	83	10	2	5	compra	30	58.76	1762.80
3677	38	59	11	3	5	merma	21	18.81	395.01
3678	135	83	13	3	4	merma	18	33.30	599.40
3679	361	71	11	1	1	merma	11	48.48	533.28
3680	49	72	4	2	2	compra	16	99.12	1585.92
3681	293	69	1	2	1	merma	22	40.34	887.48
3682	183	54	14	2	5	venta	9	60.02	540.18
3683	186	56	1	3	5	venta	7	82.23	575.61
3684	94	60	11	1	3	compra	23	30.46	700.58
3685	232	29	2	3	1	venta	13	17.85	232.05
3686	260	76	18	1	2	venta	3	55.39	166.17
3687	74	97	13	2	2	venta	2	71.07	142.14
3688	176	95	14	2	5	venta	15	70.13	1051.95
3689	241	58	14	3	2	compra	8	49.85	398.80
3690	218	64	17	3	4	venta	3	69.39	208.17
3691	316	78	7	2	1	venta	5	32.67	163.35
3692	197	8	12	2	3	compra	20	11.19	223.80
3693	328	54	12	1	4	compra	13	12.78	166.14
3694	123	17	18	3	3	compra	16	38.96	623.36
3695	302	88	14	1	2	compra	13	95.91	1246.83
3696	197	80	10	1	1	merma	6	61.85	371.10
3697	332	57	18	2	1	venta	16	89.96	1439.36
3698	281	39	2	1	4	compra	1	69.78	69.78
3699	346	2	18	3	5	merma	30	50.09	1502.70
3700	93	9	18	3	3	compra	13	93.51	1215.63
3701	325	90	5	3	4	merma	13	98.53	1280.89
3702	298	72	8	3	2	merma	17	76.06	1293.02
3703	109	37	5	1	1	merma	1	59.72	59.72
3704	283	38	18	3	1	venta	5	29.33	146.65
3705	113	52	13	2	3	compra	13	95.88	1246.44
3706	100	58	18	1	2	merma	7	80.50	563.50
3707	200	61	3	1	1	venta	19	19.17	364.23
3708	38	100	20	3	5	merma	30	48.97	1469.10
3709	338	34	14	1	5	compra	25	34.53	863.25
3710	138	56	6	3	3	merma	2	5.25	10.50
3711	181	71	18	1	3	venta	24	32.97	791.28
3712	195	12	11	1	5	merma	29	78.95	2289.55
3713	297	92	4	1	3	venta	6	17.74	106.44
3714	261	60	16	2	5	merma	29	19.98	579.42
3715	134	71	12	3	2	venta	29	58.92	1708.68
3716	210	99	12	3	2	merma	22	53.58	1178.76
3717	227	38	5	2	1	venta	17	92.02	1564.34
3718	189	6	1	3	3	venta	3	83.57	250.71
3719	232	53	2	3	2	merma	13	71.88	934.44
3720	132	56	15	3	5	merma	16	62.64	1002.24
3721	109	63	1	1	2	merma	29	22.30	646.70
3722	130	77	18	3	1	compra	20	64.55	1291.00
3723	343	20	15	2	3	venta	22	29.71	653.62
3724	295	65	6	2	2	venta	5	71.06	355.30
3725	175	97	9	2	3	compra	18	21.35	384.30
3726	47	76	17	2	3	merma	28	37.94	1062.32
3727	64	5	13	1	3	compra	7	86.63	606.41
3728	333	49	9	2	3	venta	5	41.99	209.95
3729	340	27	14	2	4	venta	21	58.29	1224.09
3730	85	15	5	1	5	venta	22	23.95	526.90
3731	297	57	14	2	3	compra	25	70.68	1767.00
3732	65	85	10	1	1	merma	30	13.34	400.20
3733	279	71	16	1	2	merma	6	52.77	316.62
3734	34	22	5	2	2	venta	4	13.33	53.32
3735	183	18	17	3	3	compra	29	90.14	2614.06
3736	24	26	14	2	5	venta	5	88.45	442.25
3737	119	40	16	2	4	merma	14	99.13	1387.82
3738	17	39	7	1	5	merma	10	48.28	482.80
3739	99	64	6	2	2	venta	13	38.88	505.44
3740	220	23	16	3	4	merma	23	99.77	2294.71
3741	325	69	8	3	2	venta	30	31.82	954.60
3742	93	9	6	3	2	compra	20	68.81	1376.20
3743	94	99	2	3	2	venta	8	29.31	234.48
3744	313	11	2	3	4	merma	9	85.56	770.04
3745	117	47	6	1	5	compra	7	87.65	613.55
3746	35	50	13	3	1	merma	3	48.81	146.43
3747	115	36	18	2	4	venta	24	78.85	1892.40
3748	278	53	5	1	5	compra	28	60.54	1695.12
3749	292	47	18	2	5	merma	25	10.01	250.25
3750	194	55	3	3	3	venta	11	13.62	149.82
3751	110	30	1	3	1	merma	28	21.17	592.76
3752	9	70	19	3	4	venta	8	64.54	516.32
3753	311	48	6	1	1	compra	11	33.86	372.46
3754	21	34	2	3	2	compra	19	67.17	1276.23
3755	341	49	13	3	1	compra	29	76.20	2209.80
3756	279	64	13	1	4	venta	24	37.15	891.60
3757	285	54	19	2	3	compra	7	79.51	556.57
3758	12	10	2	2	1	merma	30	22.72	681.60
3759	30	20	17	3	3	venta	28	12.47	349.16
3760	16	51	1	3	1	compra	8	96.03	768.24
3761	276	87	6	2	5	venta	1	30.34	30.34
3762	14	21	12	2	1	venta	9	79.68	717.12
3763	156	59	16	2	2	merma	9	44.57	401.13
3764	63	73	15	3	4	venta	15	58.54	878.10
3765	218	87	15	3	3	compra	20	15.74	314.80
3766	214	36	19	1	3	merma	5	84.36	421.80
3767	80	25	6	1	3	merma	17	64.34	1093.78
3768	62	11	8	1	4	merma	15	45.21	678.15
3769	89	97	18	1	1	merma	24	44.51	1068.24
3770	69	54	4	3	3	merma	26	14.41	374.66
3771	158	88	13	2	1	merma	29	47.45	1376.05
3772	320	62	17	2	3	compra	26	28.18	732.68
3773	48	17	10	3	5	venta	25	84.49	2112.25
3774	70	76	10	2	4	compra	26	13.94	362.44
3775	200	57	8	2	1	venta	2	92.47	184.94
3776	238	12	3	1	1	venta	11	68.24	750.64
3777	14	26	10	2	4	compra	16	5.30	84.80
3778	220	61	9	3	1	merma	5	67.57	337.85
3779	334	70	6	1	1	compra	2	92.27	184.54
3780	87	27	9	3	1	merma	26	5.31	138.06
3781	317	39	11	3	3	venta	30	73.41	2202.30
3782	221	22	3	2	1	merma	29	23.26	674.54
3783	199	7	14	1	4	venta	1	18.79	18.79
3784	135	82	19	1	3	venta	4	56.30	225.20
3785	364	55	15	2	4	merma	23	89.07	2048.61
3786	102	54	7	1	3	merma	12	68.34	820.08
3787	67	41	13	1	2	merma	28	65.79	1842.12
3788	273	97	18	3	1	merma	22	30.95	680.90
3789	123	89	4	1	5	venta	6	13.00	78.00
3790	286	54	18	1	1	venta	30	94.24	2827.20
3791	184	24	9	1	3	merma	13	90.80	1180.40
3792	150	64	11	3	4	compra	23	28.01	644.23
3793	353	63	16	2	4	merma	2	70.24	140.48
3794	364	49	18	2	2	venta	16	26.83	429.28
3795	319	72	11	1	3	compra	4	59.21	236.84
3796	46	74	5	2	5	compra	1	51.36	51.36
3797	124	6	5	1	5	merma	4	40.05	160.20
3798	308	81	9	1	4	merma	3	29.33	87.99
3799	268	88	12	1	3	compra	30	57.10	1713.00
3800	190	40	3	1	2	venta	3	30.61	91.83
3801	120	50	17	1	4	venta	1	11.11	11.11
3802	350	37	10	2	5	venta	17	81.43	1384.31
3803	244	52	12	3	2	venta	30	42.77	1283.10
3804	347	94	13	1	3	compra	17	68.47	1163.99
3805	117	35	20	1	4	merma	9	94.53	850.77
3806	212	76	9	1	1	venta	15	39.95	599.25
3807	158	54	5	2	3	venta	1	33.00	33.00
3808	209	6	3	2	5	merma	1	30.44	30.44
3809	122	66	14	1	5	compra	28	67.66	1894.48
3810	13	27	1	1	5	compra	30	57.33	1719.90
3811	104	28	2	1	1	compra	1	7.52	7.52
3812	79	25	16	1	2	merma	28	85.87	2404.36
3813	35	82	11	2	5	merma	25	19.70	492.50
3814	69	84	4	2	5	merma	14	75.31	1054.34
3815	350	11	16	3	3	compra	20	40.98	819.60
3816	234	32	9	3	5	compra	17	77.90	1324.30
3817	150	51	8	2	1	compra	16	12.77	204.32
3818	13	31	20	3	2	compra	21	27.23	571.83
3819	122	16	11	1	2	compra	13	99.31	1291.03
3820	85	71	17	2	1	compra	14	26.00	364.00
3821	73	87	2	3	2	merma	2	76.01	152.02
3822	98	62	19	1	5	merma	14	11.51	161.14
3823	95	58	14	2	4	venta	29	43.50	1261.50
3824	257	29	2	3	3	merma	12	13.98	167.76
3825	124	24	7	3	5	venta	4	84.52	338.08
3826	86	2	2	3	4	venta	4	30.71	122.84
3827	356	81	17	2	5	venta	1	95.54	95.54
3828	187	24	14	3	2	venta	23	23.60	542.80
3829	179	77	7	1	1	compra	30	35.99	1079.70
3830	362	38	7	2	1	compra	16	28.29	452.64
3831	279	61	5	2	3	merma	24	38.14	915.36
3832	238	56	8	1	5	venta	13	56.19	730.47
3833	260	33	11	1	5	venta	30	80.71	2421.30
3834	62	33	6	2	1	compra	10	99.77	997.70
3835	228	35	8	2	3	compra	28	87.06	2437.68
3836	175	86	17	2	2	merma	2	68.08	136.16
3837	96	73	15	1	1	compra	7	46.15	323.05
3838	132	59	14	3	3	venta	2	19.40	38.80
3839	83	9	18	3	4	merma	25	53.25	1331.25
3840	146	10	5	3	5	merma	28	95.42	2671.76
3841	7	52	2	3	4	venta	7	35.48	248.36
3842	62	98	10	3	5	compra	15	90.24	1353.60
3843	245	44	4	1	2	compra	29	68.56	1988.24
3844	276	12	1	2	5	merma	14	83.49	1168.86
3845	365	23	3	2	1	merma	28	65.24	1826.72
3846	242	26	6	3	4	merma	15	60.26	903.90
3847	286	94	11	3	1	merma	9	27.48	247.32
3848	282	30	19	1	5	merma	10	27.20	272.00
3849	210	83	8	2	5	venta	17	6.60	112.20
3850	132	23	17	1	5	compra	13	98.11	1275.43
3851	64	68	11	2	2	compra	25	58.34	1458.50
3852	200	55	9	2	5	merma	2	59.83	119.66
3853	308	68	19	1	3	venta	6	95.14	570.84
3854	141	76	16	2	2	merma	17	95.26	1619.42
3855	118	57	3	3	4	merma	1	33.04	33.04
3856	332	38	13	3	4	compra	6	7.96	47.76
3857	263	39	14	3	3	compra	19	43.00	817.00
3858	18	90	13	3	3	compra	28	5.70	159.60
3859	244	89	8	2	4	merma	29	69.54	2016.66
3860	313	53	17	3	4	compra	10	60.08	600.80
3861	343	76	20	3	1	merma	21	78.01	1638.21
3862	247	46	7	3	1	venta	4	50.66	202.64
3863	318	93	9	2	3	merma	24	12.16	291.84
3864	259	4	14	2	3	compra	14	96.66	1353.24
3865	290	47	11	2	3	merma	4	76.04	304.16
3866	222	72	6	1	1	compra	27	41.66	1124.82
3867	262	93	2	3	3	compra	30	68.61	2058.30
3868	146	63	19	3	3	merma	25	41.21	1030.25
3869	93	33	6	2	5	compra	24	8.97	215.28
3870	235	67	8	1	3	venta	28	10.39	290.92
3871	60	100	8	2	4	compra	10	64.64	646.40
3872	299	41	12	1	5	compra	22	27.76	610.72
3873	356	88	20	3	1	compra	2	52.21	104.42
3874	95	43	19	3	3	compra	12	98.06	1176.72
3875	323	40	6	1	4	compra	15	53.67	805.05
3876	24	4	6	3	1	compra	12	76.51	918.12
3877	129	93	1	1	5	compra	19	59.16	1124.04
3878	142	4	6	2	4	compra	26	43.21	1123.46
3879	215	6	13	1	5	compra	24	84.38	2025.12
3880	130	9	2	3	1	merma	30	12.93	387.90
3881	255	5	1	3	1	merma	15	77.17	1157.55
3882	26	42	6	3	3	merma	29	97.57	2829.53
3883	346	66	1	1	3	venta	1	63.24	63.24
3884	42	75	5	1	3	compra	1	63.55	63.55
3885	97	53	12	2	5	merma	23	38.46	884.58
3886	356	1	13	2	1	venta	22	80.79	1777.38
3887	15	38	12	1	3	merma	1	32.08	32.08
3888	324	76	4	2	1	venta	27	27.78	750.06
3889	249	23	1	1	3	merma	13	82.29	1069.77
3890	254	52	14	2	1	merma	5	76.99	384.95
3891	116	63	18	2	2	venta	23	44.65	1026.95
3892	290	89	8	1	3	venta	22	27.17	597.74
3893	202	35	17	3	2	compra	1	53.67	53.67
3894	140	66	4	3	5	merma	29	18.59	539.11
3895	45	54	14	1	2	venta	7	48.55	339.85
3896	272	81	12	3	2	merma	6	71.84	431.04
3897	38	58	10	1	2	merma	16	34.58	553.28
3898	172	73	11	1	5	venta	25	30.01	750.25
3899	32	100	6	3	2	venta	22	38.61	849.42
3900	285	46	14	3	3	venta	1	5.23	5.23
3901	25	13	7	2	5	merma	26	62.62	1628.12
3902	27	13	16	1	5	compra	29	99.40	2882.60
3903	65	94	12	1	1	venta	10	37.43	374.30
3904	62	12	18	1	3	compra	29	8.77	254.33
3905	186	9	19	3	5	venta	24	81.46	1955.04
3906	27	97	4	3	2	merma	9	50.90	458.10
3907	47	63	8	1	1	merma	25	82.74	2068.50
3908	258	74	3	3	3	venta	2	54.79	109.58
3909	269	21	2	1	4	merma	25	58.99	1474.75
3910	272	53	11	3	4	merma	21	92.87	1950.27
3911	263	16	8	1	2	venta	3	29.93	89.79
3912	219	66	10	1	3	merma	18	60.05	1080.90
3913	326	33	8	2	1	venta	28	67.66	1894.48
3914	92	40	5	1	4	merma	24	87.51	2100.24
3915	276	27	3	3	3	venta	11	53.79	591.69
3916	129	16	17	2	2	merma	29	30.50	884.50
3917	86	34	7	2	5	compra	8	31.23	249.84
3918	186	75	17	3	2	compra	19	5.60	106.40
3919	317	76	5	1	5	venta	23	80.06	1841.38
3920	354	83	8	2	2	merma	4	74.40	297.60
3921	227	66	5	3	3	merma	1	12.82	12.82
3922	159	90	15	2	4	venta	14	14.74	206.36
3923	289	97	12	1	2	merma	6	74.39	446.34
3924	95	67	3	1	5	merma	23	60.03	1380.69
3925	244	81	14	3	3	merma	25	35.88	897.00
3926	147	9	15	2	4	merma	4	47.47	189.88
3927	284	8	17	1	1	merma	2	99.89	199.78
3928	111	96	10	1	3	merma	21	77.33	1623.93
3929	52	58	9	3	3	merma	18	66.49	1196.82
3930	226	37	13	2	3	venta	29	94.05	2727.45
3931	150	31	2	1	5	compra	17	38.87	660.79
3932	123	58	3	3	4	venta	20	5.37	107.40
3933	52	93	10	3	4	merma	9	22.20	199.80
3934	292	49	20	2	3	venta	22	89.53	1969.66
3935	283	88	15	2	1	venta	12	46.06	552.72
3936	132	87	20	1	5	merma	16	57.04	912.64
3937	124	54	17	1	2	compra	1	79.89	79.89
3938	195	77	10	2	5	compra	16	75.88	1214.08
3939	192	48	8	2	5	venta	20	54.12	1082.40
3940	124	11	7	1	1	venta	23	91.05	2094.15
3941	312	78	3	2	2	venta	19	53.38	1014.22
3942	91	65	2	2	3	merma	8	43.32	346.56
3943	235	89	6	3	2	compra	4	61.47	245.88
3944	328	57	1	2	5	compra	20	87.23	1744.60
3945	357	19	12	1	5	compra	23	39.51	908.73
3946	187	18	17	2	4	compra	29	42.09	1220.61
3947	151	60	15	1	3	merma	30	68.50	2055.00
3948	289	54	1	1	2	merma	29	81.74	2370.46
3949	244	29	4	3	1	compra	5	10.77	53.85
3950	126	3	15	1	3	compra	22	86.25	1897.50
3951	70	60	18	3	3	merma	29	64.97	1884.13
3952	140	90	4	1	2	compra	16	51.27	820.32
3953	136	93	5	2	5	merma	23	55.46	1275.58
3954	151	71	20	1	2	compra	6	82.76	496.56
3955	92	83	7	3	1	venta	12	81.67	980.04
3956	287	5	1	2	3	merma	9	8.48	76.32
3957	90	98	11	2	1	compra	4	93.53	374.12
3958	221	22	19	2	3	merma	24	49.68	1192.32
3959	279	28	17	3	4	merma	5	71.10	355.50
3960	38	34	13	1	2	compra	10	99.33	993.30
3961	47	75	4	2	3	compra	14	45.40	635.60
3962	185	34	14	2	4	merma	1	71.68	71.68
3963	188	39	2	2	1	venta	16	5.09	81.44
3964	333	84	5	1	2	merma	5	37.95	189.75
3965	153	9	16	1	5	merma	18	86.14	1550.52
3966	68	55	1	2	1	compra	24	88.96	2135.04
3967	127	41	18	3	5	compra	9	19.22	172.98
3968	152	7	2	2	2	compra	11	61.51	676.61
3969	286	39	8	2	2	compra	4	20.23	80.92
3970	269	4	7	2	4	merma	26	6.16	160.16
3971	242	87	5	3	2	merma	29	84.84	2460.36
3972	326	72	10	3	1	merma	22	89.96	1979.12
3973	199	59	12	2	5	merma	4	45.73	182.92
3974	85	79	14	3	3	compra	23	56.95	1309.85
3975	14	10	19	3	1	venta	21	69.23	1453.83
3976	201	73	2	1	3	compra	12	56.56	678.72
3977	10	81	14	1	4	merma	19	35.62	676.78
3978	238	58	1	1	2	compra	15	16.64	249.60
3979	62	9	18	1	1	compra	11	9.42	103.62
3980	177	20	16	3	2	merma	17	33.00	561.00
3981	305	9	6	3	5	merma	6	64.15	384.90
3982	170	65	9	2	5	compra	7	97.85	684.95
3983	18	24	19	1	1	compra	1	6.38	6.38
3984	145	88	9	3	2	compra	3	22.58	67.74
3985	149	97	2	2	4	venta	4	86.63	346.52
3986	258	88	6	3	5	venta	27	11.34	306.18
3987	156	46	12	2	5	merma	7	20.95	146.65
3988	70	4	8	1	5	venta	15	38.20	573.00
3989	30	18	15	1	5	venta	1	58.10	58.10
3990	292	60	10	2	3	merma	27	68.18	1840.86
3991	36	9	2	3	2	venta	18	78.70	1416.60
3992	236	40	10	2	1	compra	24	26.53	636.72
3993	24	45	3	2	5	venta	15	36.76	551.40
3994	152	62	17	1	3	merma	3	82.94	248.82
3995	352	14	15	2	2	venta	27	12.35	333.45
3996	363	73	16	1	5	compra	8	10.61	84.88
3997	12	7	7	1	2	merma	5	8.52	42.60
3998	3	97	16	2	4	venta	27	53.92	1455.84
3999	147	28	13	1	3	venta	12	32.09	385.08
4000	101	31	17	3	5	merma	14	10.63	148.82
4001	77	10	3	2	2	venta	12	99.81	1197.72
4002	280	87	7	3	5	merma	11	16.25	178.75
4003	100	35	18	1	2	compra	30	22.68	680.40
4004	358	26	20	2	4	compra	7	6.45	45.15
4005	305	16	19	3	5	merma	1	53.72	53.72
4006	166	16	9	3	2	venta	10	52.44	524.40
4007	55	57	19	1	4	compra	17	89.64	1523.88
4008	138	76	7	1	1	merma	9	86.80	781.20
4009	201	42	17	3	2	merma	14	90.89	1272.46
4010	115	72	12	3	4	venta	18	59.77	1075.86
4011	34	17	8	2	5	compra	14	8.76	122.64
4012	143	76	9	2	1	venta	8	32.56	260.48
4013	167	44	16	1	4	merma	25	57.11	1427.75
4014	220	15	8	1	3	merma	10	99.49	994.90
4015	140	14	3	3	2	compra	2	33.11	66.22
4016	39	77	6	1	5	merma	5	35.41	177.05
4017	34	31	6	1	5	compra	9	29.55	265.95
4018	30	60	11	3	2	venta	23	30.13	692.99
4019	232	6	13	3	1	compra	13	87.08	1132.04
4020	235	76	2	3	3	venta	13	17.37	225.81
4021	98	91	18	3	2	compra	10	52.76	527.60
4022	211	35	1	2	2	merma	14	64.19	898.66
4023	241	10	10	2	3	compra	8	80.69	645.52
4024	93	77	3	2	1	venta	27	67.82	1831.14
4025	357	73	8	2	4	merma	16	88.55	1416.80
4026	274	29	16	3	3	venta	25	42.28	1057.00
4027	85	17	11	2	2	merma	8	89.02	712.16
4028	51	15	8	2	1	venta	2	44.60	89.20
4029	200	77	17	3	3	venta	21	71.96	1511.16
4030	360	37	8	1	2	merma	7	45.34	317.38
4031	259	14	16	2	1	compra	11	54.34	597.74
4032	170	80	19	1	3	compra	25	86.81	2170.25
4033	231	38	10	1	3	venta	9	71.98	647.82
4034	236	60	16	2	2	merma	18	50.18	903.24
4035	56	31	14	1	5	merma	11	66.35	729.85
4036	53	14	18	2	2	venta	2	55.83	111.66
4037	330	17	17	1	1	merma	1	8.27	8.27
4038	68	32	4	3	2	venta	20	62.72	1254.40
4039	278	93	8	2	1	compra	11	45.28	498.08
4040	54	30	13	3	1	compra	15	44.58	668.70
4041	99	12	20	2	5	merma	19	66.11	1256.09
4042	62	98	7	2	5	merma	19	77.62	1474.78
4043	6	61	1	2	3	compra	2	16.89	33.78
4044	49	81	19	1	5	venta	27	28.47	768.69
4045	218	91	12	1	5	merma	22	78.75	1732.50
4046	58	41	3	2	4	merma	18	61.79	1112.22
4047	357	26	9	1	5	venta	18	70.63	1271.34
4048	221	17	11	2	5	compra	24	93.78	2250.72
4049	238	92	14	3	3	merma	1	91.31	91.31
4050	140	99	12	3	2	venta	4	54.94	219.76
4051	102	93	6	3	5	merma	20	38.84	776.80
4052	216	56	20	2	1	compra	19	90.31	1715.89
4053	343	98	1	1	5	venta	21	80.55	1691.55
4054	195	84	14	1	4	venta	17	63.23	1074.91
4055	54	55	17	1	3	merma	29	15.01	435.29
4056	281	57	7	2	5	merma	13	52.51	682.63
4057	31	22	8	2	3	venta	22	58.72	1291.84
4058	251	43	12	3	2	compra	28	37.99	1063.72
4059	180	68	5	1	1	venta	11	37.00	407.00
4060	28	75	16	3	2	venta	3	64.17	192.51
4061	292	33	19	2	1	venta	30	39.87	1196.10
4062	279	59	1	2	5	merma	25	67.31	1682.75
4063	32	72	9	2	4	venta	4	16.64	66.56
4064	96	80	9	2	1	venta	24	83.28	1998.72
4065	156	14	2	2	1	compra	20	57.44	1148.80
4066	219	90	19	1	1	venta	6	10.90	65.40
4067	133	30	20	1	3	venta	3	44.01	132.03
4068	324	43	14	1	4	merma	6	58.65	351.90
4069	303	72	7	1	3	merma	15	25.44	381.60
4070	100	24	11	1	1	merma	12	6.69	80.28
4071	287	20	9	3	5	venta	30	34.08	1022.40
4072	1	4	19	2	3	compra	26	66.34	1724.84
4073	204	41	8	3	1	compra	3	63.32	189.96
4074	118	49	14	1	2	merma	20	46.39	927.80
4075	45	13	19	3	3	merma	3	8.64	25.92
4076	19	14	8	2	1	merma	6	62.45	374.70
4077	326	79	5	3	5	venta	6	20.96	125.76
4078	313	89	10	1	5	merma	30	44.75	1342.50
4079	312	51	8	3	1	venta	20	24.93	498.60
4080	269	65	5	3	2	merma	13	74.93	974.09
4081	47	19	4	2	5	merma	8	45.43	363.44
4082	200	11	15	1	5	venta	16	99.04	1584.64
4083	364	92	6	1	2	compra	18	83.98	1511.64
4084	110	44	19	1	3	merma	30	88.02	2640.60
4085	10	35	15	2	2	merma	29	12.82	371.78
4086	94	58	16	2	5	venta	30	80.39	2411.70
4087	302	37	17	2	2	compra	9	30.15	271.35
4088	295	39	4	3	3	venta	27	91.18	2461.86
4089	147	45	1	1	4	merma	15	56.80	852.00
4090	37	57	20	2	1	merma	14	79.28	1109.92
4091	255	41	12	2	2	merma	6	80.78	484.68
4092	325	95	3	3	2	compra	3	7.04	21.12
4093	288	69	5	1	5	merma	27	94.85	2560.95
4094	292	86	7	3	1	venta	17	43.16	733.72
4095	366	20	13	2	3	merma	27	9.81	264.87
4096	81	23	19	2	4	venta	1	41.51	41.51
4097	41	2	8	3	3	merma	28	66.79	1870.12
4098	321	68	1	2	5	venta	22	96.60	2125.20
4099	117	21	16	1	4	compra	26	78.95	2052.70
4100	189	35	1	1	2	merma	24	75.51	1812.24
4101	67	89	15	3	2	merma	25	38.74	968.50
4102	208	79	9	2	3	venta	8	30.27	242.16
4103	185	11	4	1	2	venta	30	63.13	1893.90
4104	151	82	3	2	4	compra	9	50.89	458.01
4105	95	40	16	3	5	compra	29	91.45	2652.05
4106	75	46	7	2	3	compra	8	74.06	592.48
4107	255	8	8	1	2	compra	16	74.94	1199.04
4108	308	50	4	1	5	compra	12	86.95	1043.40
4109	194	59	20	1	4	compra	1	76.80	76.80
4110	53	60	10	1	5	compra	24	66.62	1598.88
4111	254	77	1	3	1	merma	21	29.83	626.43
4112	193	64	13	2	1	compra	1	58.95	58.95
4113	360	26	2	3	4	venta	12	66.61	799.32
4114	217	57	2	1	1	compra	4	94.10	376.40
4115	142	28	14	2	5	compra	17	99.04	1683.68
4116	158	51	7	1	3	venta	11	17.58	193.38
4117	70	74	16	1	1	merma	14	93.30	1306.20
4118	89	91	4	1	4	merma	11	52.73	580.03
4119	286	11	14	2	2	venta	24	93.31	2239.44
4120	350	17	18	3	3	compra	8	84.22	673.76
4121	356	56	17	2	3	compra	29	26.90	780.10
4122	133	48	9	3	4	merma	13	39.64	515.32
4123	141	96	3	3	1	venta	17	17.46	296.82
4124	190	70	13	1	4	merma	1	48.33	48.33
4125	298	16	10	1	5	venta	29	74.60	2163.40
4126	365	58	2	3	4	compra	3	53.63	160.89
4127	261	50	19	3	5	compra	22	64.07	1409.54
4128	275	63	12	2	2	compra	13	78.41	1019.33
4129	275	100	2	3	4	venta	4	84.39	337.56
4130	60	59	1	2	4	compra	28	68.97	1931.16
4131	171	98	16	2	4	compra	12	34.87	418.44
4132	213	53	9	1	2	venta	10	84.46	844.60
4133	39	8	14	3	1	merma	5	35.57	177.85
4134	9	87	20	2	4	venta	12	72.48	869.76
4135	196	91	2	2	2	compra	13	92.74	1205.62
4136	17	16	17	1	2	venta	11	8.14	89.54
4137	30	86	13	3	2	venta	18	69.71	1254.78
4138	69	21	14	1	1	merma	18	98.30	1769.40
4139	9	20	8	2	1	merma	29	68.86	1996.94
4140	37	67	1	2	3	compra	3	35.68	107.04
4141	232	75	10	1	4	venta	20	58.50	1170.00
4142	1	92	11	1	4	venta	12	8.88	106.56
4143	11	20	17	1	3	venta	14	22.78	318.92
4144	191	81	19	2	2	venta	8	61.47	491.76
4145	218	42	11	1	5	compra	22	12.75	280.50
4146	99	90	15	2	5	compra	8	99.35	794.80
4147	332	9	11	2	5	venta	7	30.86	216.02
4148	285	46	11	1	2	venta	15	20.82	312.30
4149	278	26	12	3	2	merma	10	50.66	506.60
4150	92	75	19	1	1	compra	29	98.86	2866.94
4151	184	27	6	3	1	compra	12	60.92	731.04
4152	176	89	16	3	4	compra	25	81.93	2048.25
4153	226	43	1	1	5	venta	16	56.09	897.44
4154	279	78	10	3	4	compra	12	15.76	189.12
4155	194	26	9	1	5	compra	23	42.20	970.60
4156	30	96	13	3	1	merma	23	31.07	714.61
4157	22	3	16	2	4	merma	25	50.31	1257.75
4158	346	73	19	3	5	venta	10	88.21	882.10
4159	254	40	1	2	2	merma	14	47.89	670.46
4160	304	72	8	3	2	venta	13	84.41	1097.33
4161	80	48	3	3	3	compra	23	97.08	2232.84
4162	1	23	13	2	2	venta	27	5.12	138.24
4163	203	71	12	3	1	compra	18	38.14	686.52
4164	134	40	1	3	3	merma	23	87.54	2013.42
4165	217	96	4	3	3	merma	28	66.68	1867.04
4166	211	67	12	3	2	merma	15	77.34	1160.10
4167	109	91	16	3	3	merma	25	6.03	150.75
4168	127	100	10	2	2	merma	1	74.18	74.18
4169	19	2	3	3	5	compra	30	39.17	1175.10
4170	8	24	20	3	4	merma	2	33.12	66.24
4171	176	25	10	1	5	merma	20	47.21	944.20
4172	221	75	15	3	5	compra	12	81.61	979.32
4173	89	44	15	1	4	venta	19	14.31	271.89
4174	90	97	10	3	4	compra	4	68.00	272.00
4175	119	89	5	2	3	compra	5	73.21	366.05
4176	81	90	8	2	2	compra	30	29.31	879.30
4177	278	67	8	2	4	venta	10	89.57	895.70
4178	335	59	8	1	3	compra	3	67.42	202.26
4179	277	70	3	2	1	compra	27	54.99	1484.73
4180	196	67	11	2	5	merma	2	73.82	147.64
4181	78	40	19	1	3	merma	9	59.12	532.08
4182	131	63	20	3	5	merma	5	79.07	395.35
4183	102	17	20	3	4	compra	14	28.86	404.04
4184	137	68	9	1	1	compra	7	26.91	188.37
4185	328	34	6	1	3	venta	30	76.80	2304.00
4186	315	100	14	2	3	compra	19	36.43	692.17
4187	105	66	15	1	2	merma	10	45.16	451.60
4188	363	38	10	1	5	merma	26	28.12	731.12
4189	142	1	12	2	1	venta	13	74.73	971.49
4190	202	53	14	2	3	venta	30	12.72	381.60
4191	168	57	16	2	5	compra	13	80.32	1044.16
4192	348	82	19	2	1	venta	14	15.04	210.56
4193	69	65	19	2	3	venta	6	36.04	216.24
4194	174	54	4	1	3	merma	3	37.86	113.58
4195	90	12	15	3	4	venta	4	28.32	113.28
4196	280	67	15	2	1	compra	20	81.54	1630.80
4197	36	4	13	1	4	compra	11	80.39	884.29
4198	302	16	4	3	5	compra	5	60.51	302.55
4199	155	41	5	2	3	compra	8	87.58	700.64
4200	164	3	18	2	4	merma	6	59.52	357.12
4201	262	73	3	1	3	compra	25	92.15	2303.75
4202	320	42	3	1	2	compra	14	63.34	886.76
4203	25	61	14	3	1	merma	5	14.77	73.85
4204	171	41	19	3	5	compra	5	31.78	158.90
4205	92	39	14	2	3	venta	23	47.09	1083.07
4206	365	88	1	1	1	compra	18	89.82	1616.76
4207	104	70	16	1	3	venta	9	29.90	269.10
4208	17	31	3	1	2	merma	13	57.38	745.94
4209	261	43	13	1	1	venta	10	27.72	277.20
4210	177	21	2	1	2	venta	1	83.37	83.37
4211	244	18	4	3	3	compra	5	53.06	265.30
4212	139	79	20	2	5	venta	10	45.08	450.80
4213	223	1	11	3	1	venta	2	34.48	68.96
4214	338	68	2	2	1	merma	24	84.21	2021.04
4215	193	84	20	1	4	compra	2	50.31	100.62
4216	16	68	16	1	5	venta	6	93.38	560.28
4217	362	46	12	1	3	venta	20	39.11	782.20
4218	241	32	2	1	4	compra	12	52.29	627.48
4219	121	16	10	2	3	compra	4	37.41	149.64
4220	271	33	3	2	5	venta	7	57.85	404.95
4221	4	21	9	3	5	merma	22	48.21	1060.62
4222	264	23	12	3	2	venta	15	76.14	1142.10
4223	161	67	16	2	4	compra	15	92.22	1383.30
4224	72	40	13	3	5	merma	12	81.46	977.52
4225	287	38	12	3	2	merma	7	40.97	286.79
4226	305	41	7	3	2	venta	9	34.83	313.47
4227	168	65	18	3	4	venta	10	49.59	495.90
4228	300	69	4	3	1	venta	20	58.26	1165.20
4229	29	75	1	3	3	compra	2	38.02	76.04
4230	65	13	9	1	2	compra	1	71.72	71.72
4231	154	43	17	2	3	compra	26	44.27	1151.02
4232	339	11	10	2	1	compra	14	91.58	1282.12
4233	41	14	10	1	4	venta	17	77.00	1309.00
4234	188	17	1	2	1	merma	19	97.96	1861.24
4235	243	80	5	1	3	merma	29	6.82	197.78
4236	114	72	8	3	3	compra	23	64.97	1494.31
4237	351	83	5	1	4	compra	23	38.76	891.48
4238	270	80	15	2	4	venta	17	56.61	962.37
4239	322	51	19	2	1	merma	24	44.56	1069.44
4240	150	48	20	1	5	compra	27	94.55	2552.85
4241	268	94	13	3	5	venta	25	90.93	2273.25
4242	18	12	8	2	4	venta	21	21.54	452.34
4243	2	36	14	3	2	venta	20	57.17	1143.40
4244	333	99	8	2	2	merma	25	72.45	1811.25
4245	271	74	13	2	2	venta	28	15.24	426.72
4246	191	27	19	2	1	compra	20	67.64	1352.80
4247	284	8	3	2	3	venta	30	99.27	2978.10
4248	139	95	16	3	2	venta	10	16.96	169.60
4249	294	14	8	3	1	compra	17	33.18	564.06
4250	79	2	17	1	1	merma	30	11.98	359.40
4251	80	36	9	2	3	venta	14	95.66	1339.24
4252	88	24	9	2	2	merma	30	97.87	2936.10
4253	86	23	1	2	5	compra	27	66.99	1808.73
4254	182	61	17	3	2	compra	7	90.15	631.05
4255	93	14	4	1	1	compra	30	14.20	426.00
4256	361	93	6	3	2	merma	14	32.95	461.30
4257	7	12	20	1	2	compra	28	95.56	2675.68
4258	8	36	7	1	2	venta	6	98.50	591.00
4259	195	97	4	2	2	venta	15	8.47	127.05
4260	221	95	3	1	1	venta	19	67.92	1290.48
4261	172	31	8	2	1	merma	11	22.74	250.14
4262	366	55	11	2	5	venta	16	38.27	612.32
4263	100	87	11	2	2	merma	29	12.27	355.83
4264	23	82	11	3	5	compra	25	44.42	1110.50
4265	133	56	16	3	5	venta	27	46.73	1261.71
4266	226	93	11	1	3	venta	19	55.07	1046.33
4267	225	92	15	1	2	merma	1	55.66	55.66
4268	222	19	12	2	3	merma	5	46.02	230.10
4269	159	59	5	2	5	merma	23	17.33	398.59
4270	84	2	9	2	2	venta	12	45.49	545.88
4271	117	98	10	2	4	compra	28	84.36	2362.08
4272	271	27	3	3	1	venta	13	31.56	410.28
4273	145	99	20	3	2	merma	23	82.44	1896.12
4274	203	1	19	2	1	venta	13	90.05	1170.65
4275	282	10	20	1	5	compra	28	85.26	2387.28
4276	112	62	11	2	5	compra	10	98.61	986.10
4277	183	28	5	2	2	compra	11	36.97	406.67
4278	223	89	5	1	2	venta	13	95.13	1236.69
4279	36	89	18	3	2	venta	9	75.97	683.73
4280	272	38	3	1	3	venta	11	22.51	247.61
4281	203	10	1	1	2	venta	6	34.07	204.42
4282	346	70	7	3	4	venta	21	14.72	309.12
4283	352	5	5	3	5	venta	1	12.99	12.99
4284	144	96	14	1	5	compra	21	58.63	1231.23
4285	76	67	16	1	1	venta	16	67.15	1074.40
4286	27	33	3	3	1	merma	21	25.18	528.78
4287	140	46	9	2	5	compra	28	80.18	2245.04
4288	315	2	1	1	1	compra	18	30.28	545.04
4289	186	90	17	2	3	compra	11	84.09	924.99
4290	344	5	20	3	1	merma	13	52.97	688.61
4291	141	45	17	2	5	merma	24	27.91	669.84
4292	300	59	1	1	5	merma	19	34.09	647.71
4293	74	24	16	1	3	merma	12	32.59	391.08
4294	116	32	15	1	3	merma	17	9.11	154.87
4295	302	37	7	1	3	venta	6	7.49	44.94
4296	48	62	19	1	3	compra	3	98.28	294.84
4297	298	66	18	3	3	merma	21	37.14	779.94
4298	172	56	10	2	1	venta	10	19.76	197.60
4299	45	84	10	2	5	merma	3	37.81	113.43
4300	276	66	11	3	3	merma	7	81.66	571.62
4301	340	7	11	1	1	venta	9	27.02	243.18
4302	41	93	8	2	3	compra	25	39.45	986.25
4303	4	88	3	2	2	venta	27	56.90	1536.30
4304	89	12	19	2	1	compra	15	29.79	446.85
4305	198	8	16	1	4	merma	9	75.16	676.44
4306	35	94	16	3	4	merma	24	63.11	1514.64
4307	281	86	8	3	4	merma	17	52.34	889.78
4308	348	29	18	2	3	venta	7	42.44	297.08
4309	37	5	18	3	5	compra	14	91.11	1275.54
4310	135	97	9	2	2	merma	25	51.68	1292.00
4311	185	33	16	3	5	compra	7	23.11	161.77
4312	163	25	10	1	3	merma	30	45.98	1379.40
4313	335	71	19	1	3	merma	16	19.82	317.12
4314	83	97	20	3	1	merma	29	54.79	1588.91
4315	268	72	2	3	4	venta	20	22.38	447.60
4316	28	6	13	3	1	merma	1	96.26	96.26
4317	86	12	5	3	4	compra	23	62.84	1445.32
4318	316	11	15	2	5	venta	15	39.53	592.95
4319	316	82	12	3	2	venta	24	30.82	739.68
4320	252	24	9	2	4	venta	17	12.23	207.91
4321	244	52	7	1	3	merma	10	55.75	557.50
4322	144	33	2	2	1	compra	6	58.00	348.00
4323	207	20	16	1	2	merma	1	80.28	80.28
4324	69	85	16	1	5	compra	24	75.99	1823.76
4325	169	62	14	3	5	compra	30	42.12	1263.60
4326	328	63	16	1	1	compra	3	62.21	186.63
4327	71	82	9	3	2	venta	12	76.77	921.24
4328	10	100	11	1	4	venta	27	74.64	2015.28
4329	297	38	20	3	5	merma	7	52.56	367.92
4330	226	47	12	2	3	merma	4	50.67	202.68
4331	20	41	20	2	4	compra	5	22.35	111.75
4332	333	39	5	3	3	merma	4	98.40	393.60
4333	2	67	4	3	1	venta	2	19.27	38.54
4334	42	57	12	2	5	compra	12	21.89	262.68
4335	130	48	7	1	3	venta	14	30.14	421.96
4336	356	99	10	2	4	venta	14	67.67	947.38
4337	333	3	20	2	3	compra	29	66.29	1922.41
4338	181	96	14	2	1	merma	26	72.64	1888.64
4339	84	82	13	1	1	compra	18	85.20	1533.60
4340	28	37	2	3	5	venta	2	46.20	92.40
4341	145	35	11	3	3	compra	7	12.45	87.15
4342	347	90	17	3	3	venta	13	34.82	452.66
4343	254	65	15	3	2	merma	5	99.30	496.50
4344	193	14	19	2	3	compra	2	45.90	91.80
4345	150	80	19	3	4	compra	25	32.69	817.25
4346	263	1	8	2	3	merma	27	5.48	147.96
4347	189	45	20	3	1	compra	17	53.09	902.53
4348	143	37	5	1	3	compra	15	38.68	580.20
4349	1	44	10	2	5	merma	26	28.21	733.46
4350	193	16	6	1	1	compra	7	56.16	393.12
4351	97	91	4	2	2	venta	6	86.87	521.22
4352	120	79	8	2	3	venta	22	20.55	452.10
4353	110	26	5	2	4	venta	29	91.44	2651.76
4354	322	18	1	1	5	merma	26	67.51	1755.26
4355	208	15	18	3	4	compra	4	90.26	361.04
4356	209	76	17	2	4	compra	17	75.38	1281.46
4357	31	7	1	1	4	venta	3	34.07	102.21
4358	349	82	8	3	2	merma	7	32.86	230.02
4359	348	69	1	3	2	venta	3	48.98	146.94
4360	53	71	5	2	4	venta	23	33.21	763.83
4361	190	3	11	2	3	merma	22	51.77	1138.94
4362	187	96	7	1	2	venta	24	22.56	541.44
4363	197	4	10	1	4	merma	8	44.78	358.24
4364	361	63	6	3	2	compra	8	67.73	541.84
4365	250	98	11	2	3	merma	12	79.28	951.36
4366	201	2	2	3	4	venta	18	87.54	1575.72
4367	59	85	12	3	3	venta	25	73.53	1838.25
4368	340	21	3	3	4	venta	16	66.45	1063.20
4369	237	29	2	1	5	compra	7	53.39	373.73
4370	181	12	6	1	5	venta	15	50.16	752.40
4371	115	94	5	1	3	venta	23	31.65	727.95
4372	227	77	2	3	1	venta	7	75.63	529.41
4373	155	69	18	3	3	compra	12	99.04	1188.48
4374	134	36	11	2	5	merma	19	10.93	207.67
4375	214	98	4	2	1	compra	4	10.95	43.80
4376	215	96	13	1	2	merma	5	97.14	485.70
4377	230	74	1	1	4	compra	23	96.47	2218.81
4378	295	76	3	2	4	compra	28	92.38	2586.64
4379	102	48	19	1	5	merma	24	77.05	1849.20
4380	3	75	15	3	1	venta	24	79.97	1919.28
4381	200	8	6	1	4	compra	9	85.24	767.16
4382	133	33	14	3	4	compra	10	53.73	537.30
4383	319	70	9	2	2	venta	10	86.89	868.90
4384	288	45	11	3	3	merma	24	8.87	212.88
4385	191	33	11	1	1	venta	7	33.91	237.37
4386	131	89	8	3	5	venta	18	80.68	1452.24
4387	296	75	17	3	1	venta	4	30.13	120.52
4388	107	66	2	3	4	compra	15	63.80	957.00
4389	83	78	13	3	3	compra	8	41.33	330.64
4390	275	93	19	3	1	merma	29	49.42	1433.18
4391	171	38	3	3	5	venta	4	18.62	74.48
4392	228	12	13	2	1	venta	28	31.78	889.84
4393	228	20	20	3	2	merma	23	7.09	163.07
4394	246	50	5	1	5	merma	26	27.51	715.26
4395	326	68	13	1	2	compra	14	24.39	341.46
4396	120	50	17	2	5	venta	20	19.09	381.80
4397	66	13	11	3	1	merma	15	59.81	897.15
4398	151	62	12	1	3	venta	29	5.66	164.14
4399	31	92	16	3	2	compra	10	82.03	820.30
4400	321	85	1	1	5	venta	26	68.06	1769.56
4401	89	6	16	3	4	venta	13	35.25	458.25
4402	143	86	9	1	4	venta	16	22.63	362.08
4403	59	47	18	3	1	merma	2	67.90	135.80
4404	318	62	10	3	3	compra	24	84.68	2032.32
4405	341	84	16	1	3	merma	3	7.79	23.37
4406	319	35	9	2	4	venta	27	56.87	1535.49
4407	340	31	14	1	5	compra	26	97.50	2535.00
4408	231	2	9	1	2	compra	20	40.46	809.20
4409	87	76	16	1	4	merma	4	40.24	160.96
4410	358	49	5	1	2	merma	18	12.55	225.90
4411	189	66	14	1	5	venta	3	68.95	206.85
4412	239	68	11	2	5	compra	24	92.46	2219.04
4413	12	88	2	1	2	compra	1	70.55	70.55
4414	297	13	4	3	2	merma	24	61.77	1482.48
4415	357	87	11	3	3	merma	17	27.18	462.06
4416	131	12	9	3	4	venta	25	91.98	2299.50
4417	140	91	11	1	4	compra	23	89.72	2063.56
4418	89	65	18	1	2	venta	20	91.23	1824.60
4419	1	34	12	2	5	venta	20	19.70	394.00
4420	242	86	15	3	3	venta	17	14.27	242.59
4421	310	29	2	2	1	compra	20	85.26	1705.20
4422	171	100	6	2	4	merma	14	45.09	631.26
4423	218	51	13	2	3	merma	8	72.12	576.96
4424	271	87	3	1	1	compra	18	75.07	1351.26
4425	63	35	16	3	4	compra	16	50.43	806.88
4426	216	37	3	3	1	venta	12	8.93	107.16
4427	316	89	17	1	3	venta	29	97.43	2825.47
4428	51	6	2	3	1	venta	17	46.67	793.39
4429	75	56	14	2	3	venta	21	9.47	198.87
4430	24	72	2	2	5	merma	9	69.10	621.90
4431	274	42	13	3	5	venta	21	9.54	200.34
4432	229	6	14	2	5	venta	6	20.49	122.94
4433	122	91	13	3	1	compra	16	10.32	165.12
4434	150	11	5	2	5	venta	9	67.48	607.32
4435	108	21	20	2	4	compra	4	61.72	246.88
4436	156	73	13	3	3	compra	4	11.55	46.20
4437	13	20	9	2	5	venta	28	67.39	1886.92
4438	249	13	20	2	3	merma	16	41.96	671.36
4439	179	64	6	3	1	merma	29	79.72	2311.88
4440	265	96	19	3	2	compra	27	93.79	2532.33
4441	36	36	20	3	1	venta	16	73.98	1183.68
4442	14	84	11	3	2	merma	30	45.09	1352.70
4443	26	90	19	1	1	compra	20	51.30	1026.00
4444	94	4	19	1	1	venta	8	98.86	790.88
4445	136	68	11	3	1	venta	6	49.53	297.18
4446	275	39	16	2	2	venta	14	26.03	364.42
4447	156	75	1	3	4	compra	23	23.86	548.78
4448	303	58	20	3	1	compra	3	37.05	111.15
4449	271	94	1	3	2	merma	18	40.49	728.82
4450	134	20	10	1	1	compra	30	79.54	2386.20
4451	180	61	5	2	4	venta	28	54.54	1527.12
4452	278	75	15	3	2	compra	3	13.29	39.87
4453	102	62	18	2	5	merma	19	52.35	994.65
4454	214	99	9	2	4	compra	22	44.24	973.28
4455	60	27	18	2	1	merma	20	39.58	791.60
4456	31	67	1	1	1	compra	12	65.90	790.80
4457	257	28	3	3	4	merma	2	72.15	144.30
4458	210	23	12	1	4	venta	3	81.69	245.07
4459	224	45	20	1	3	compra	23	16.18	372.14
4460	58	50	8	1	2	compra	11	95.23	1047.53
4461	263	60	6	2	5	merma	13	27.17	353.21
4462	71	42	2	1	2	compra	15	78.08	1171.20
4463	95	85	13	2	2	merma	15	45.25	678.75
4464	182	83	15	1	1	venta	21	87.41	1835.61
4465	96	96	5	2	1	compra	14	37.67	527.38
4466	98	52	15	3	5	compra	11	86.06	946.66
4467	166	80	15	2	2	venta	10	81.74	817.40
4468	25	48	5	2	5	merma	19	73.90	1404.10
4469	115	49	19	3	5	venta	4	53.33	213.32
4470	92	70	6	1	4	merma	5	6.81	34.05
4471	64	72	20	1	5	venta	28	92.65	2594.20
4472	156	2	4	2	1	venta	13	39.54	514.02
4473	349	2	6	3	3	merma	11	13.11	144.21
4474	129	37	7	2	5	venta	20	86.79	1735.80
4475	211	22	20	3	3	venta	30	18.15	544.50
4476	241	19	11	1	4	compra	12	69.54	834.48
4477	32	74	16	3	5	venta	23	42.55	978.65
4478	319	10	8	1	2	merma	6	27.04	162.24
4479	191	57	1	1	5	compra	14	24.82	347.48
4480	176	33	9	1	1	venta	2	49.30	98.60
4481	128	96	2	3	2	venta	13	73.02	949.26
4482	20	80	14	1	5	venta	26	85.14	2213.64
4483	152	60	12	1	5	merma	13	31.48	409.24
4484	60	26	13	3	1	compra	18	29.54	531.72
4485	44	68	18	1	2	merma	24	89.52	2148.48
4486	121	77	8	1	3	compra	7	98.15	687.05
4487	194	51	16	3	2	merma	5	37.02	185.10
4488	224	4	9	2	4	venta	29	34.41	997.89
4489	185	13	3	2	4	venta	19	24.94	473.86
4490	39	51	15	2	2	compra	19	21.42	406.98
4491	348	86	3	3	2	venta	27	85.35	2304.45
4492	218	41	19	2	1	venta	19	57.39	1090.41
4493	7	20	12	3	1	merma	29	74.97	2174.13
4494	303	91	11	3	3	compra	11	86.94	956.34
4495	186	80	3	3	2	venta	10	66.79	667.90
4496	46	90	4	3	3	compra	14	90.15	1262.10
4497	172	74	11	3	4	venta	8	5.52	44.16
4498	355	22	15	3	1	venta	25	75.50	1887.50
4499	318	80	8	1	2	compra	27	56.96	1537.92
4500	115	77	2	2	5	merma	16	67.79	1084.64
4501	238	31	7	3	1	compra	19	84.23	1600.37
4502	74	73	1	3	4	compra	1	10.66	10.66
4503	359	75	16	2	4	merma	29	6.96	201.84
4504	191	55	4	1	1	venta	7	30.73	215.11
4505	33	20	4	3	1	compra	5	17.05	85.25
4506	171	42	13	2	1	compra	24	6.05	145.20
4507	314	50	16	1	2	venta	11	66.66	733.26
4508	71	67	17	2	5	compra	16	18.51	296.16
4509	126	9	18	2	5	venta	27	89.94	2428.38
4510	54	76	19	1	4	merma	5	86.49	432.45
4511	9	33	9	1	5	compra	10	60.45	604.50
4512	64	99	10	2	3	merma	23	39.01	897.23
4513	88	27	8	1	5	merma	9	25.43	228.87
4514	18	57	2	3	4	compra	29	98.38	2853.02
4515	338	75	5	3	1	merma	30	38.87	1166.10
4516	194	21	20	2	2	venta	28	97.53	2730.84
4517	188	67	11	1	3	merma	11	34.83	383.13
4518	296	84	16	2	4	merma	23	58.73	1350.79
4519	158	85	1	3	5	venta	27	12.80	345.60
4520	186	85	6	2	4	venta	5	43.81	219.05
4521	162	3	10	3	2	venta	30	6.13	183.90
4522	169	84	15	2	2	merma	24	10.67	256.08
4523	172	16	12	3	3	venta	27	9.62	259.74
4524	15	72	8	1	4	merma	20	46.72	934.40
4525	282	59	17	3	3	compra	3	83.39	250.17
4526	206	32	2	2	4	compra	13	33.55	436.15
4527	248	80	2	2	5	merma	26	33.15	861.90
4528	151	77	14	2	4	compra	25	82.96	2074.00
4529	121	37	1	2	4	compra	27	59.49	1606.23
4530	73	49	20	3	5	merma	10	10.87	108.70
4531	66	90	4	3	4	compra	27	84.49	2281.23
4532	350	81	18	1	2	merma	26	75.90	1973.40
4533	23	72	14	3	2	merma	27	24.10	650.70
4534	198	64	9	3	3	compra	23	79.09	1819.07
4535	45	15	14	1	3	venta	10	60.75	607.50
4536	348	24	16	3	5	venta	17	80.99	1376.83
4537	248	95	13	2	2	compra	25	90.30	2257.50
4538	77	5	9	2	2	compra	30	55.54	1666.20
4539	262	95	12	3	5	venta	15	53.69	805.35
4540	106	25	20	2	1	venta	5	5.86	29.30
4541	128	88	8	1	5	merma	25	26.15	653.75
4542	310	56	1	1	4	venta	27	92.87	2507.49
4543	331	51	6	3	4	venta	21	23.69	497.49
4544	196	56	14	1	4	compra	12	36.15	433.80
4545	310	63	17	3	4	venta	24	50.66	1215.84
4546	262	63	17	3	4	venta	27	82.54	2228.58
4547	104	33	1	2	4	compra	28	75.47	2113.16
4548	96	29	16	1	4	venta	14	67.98	951.72
4549	225	67	3	3	2	merma	23	96.57	2221.11
4550	313	37	7	2	2	merma	18	37.06	667.08
4551	241	5	13	1	4	compra	8	83.60	668.80
4552	291	76	14	2	3	compra	30	41.10	1233.00
4553	294	47	17	1	1	compra	30	96.08	2882.40
4554	109	5	17	2	1	compra	29	57.22	1659.38
4555	337	62	5	1	2	compra	18	12.28	221.04
4556	232	90	2	1	5	venta	16	65.13	1042.08
4557	91	61	10	1	2	merma	6	58.78	352.68
4558	319	57	1	2	3	venta	16	75.69	1211.04
4559	162	96	2	1	3	venta	30	15.89	476.70
4560	44	59	5	1	5	venta	20	74.09	1481.80
4561	165	78	14	1	3	venta	6	65.17	391.02
4562	177	88	2	3	4	compra	12	73.30	879.60
4563	179	6	7	1	2	compra	12	8.85	106.20
4564	90	14	15	1	4	venta	28	19.09	534.52
4565	248	9	7	3	4	venta	25	54.52	1363.00
4566	83	48	14	3	1	compra	23	50.58	1163.34
4567	144	26	8	3	3	venta	30	39.34	1180.20
4568	234	9	20	2	1	compra	8	85.41	683.28
4569	235	53	12	2	5	venta	10	29.09	290.90
4570	359	38	18	1	3	compra	6	59.00	354.00
4571	86	19	18	2	2	merma	29	6.50	188.50
4572	301	68	8	2	2	merma	15	26.13	391.95
4573	312	17	20	3	1	merma	6	5.03	30.18
4574	133	42	13	1	5	compra	2	70.78	141.56
4575	278	30	8	3	4	compra	8	20.52	164.16
4576	316	95	5	1	4	compra	30	62.20	1866.00
4577	284	67	17	1	2	merma	18	92.94	1672.92
4578	6	39	19	3	1	merma	27	80.62	2176.74
4579	240	26	6	2	4	merma	25	90.61	2265.25
4580	270	51	13	1	1	compra	6	54.24	325.44
4581	354	66	17	3	2	venta	9	66.34	597.06
4582	218	42	15	3	3	venta	14	50.56	707.84
4583	127	68	17	1	2	compra	4	25.75	103.00
4584	296	55	14	2	5	compra	5	69.47	347.35
4585	308	36	8	1	2	compra	9	84.83	763.47
4586	127	55	10	3	1	merma	20	77.60	1552.00
4587	174	70	6	1	3	compra	18	39.26	706.68
4588	40	42	15	2	4	merma	17	26.07	443.19
4589	282	96	10	2	1	venta	18	95.65	1721.70
4590	118	9	17	1	1	venta	24	18.43	442.32
4591	358	87	17	2	3	compra	20	44.06	881.20
4592	290	81	7	1	2	compra	27	54.95	1483.65
4593	41	37	1	3	4	merma	17	18.23	309.91
4594	11	7	15	1	2	merma	7	44.84	313.88
4595	51	59	15	3	2	venta	7	70.47	493.29
4596	91	70	12	1	1	venta	18	34.44	619.92
4597	190	8	6	1	1	venta	24	31.06	745.44
4598	50	41	11	3	5	compra	16	30.53	488.48
4599	233	44	2	1	3	compra	10	81.21	812.10
4600	33	24	12	3	5	venta	1	55.67	55.67
4601	302	5	6	3	1	venta	25	60.93	1523.25
4602	107	100	7	1	2	merma	24	37.21	893.04
4603	11	7	9	2	1	merma	19	17.09	324.71
4604	345	66	2	1	5	compra	9	47.45	427.05
4605	56	98	16	3	3	merma	9	93.76	843.84
4606	276	73	19	2	5	merma	19	94.08	1787.52
4607	25	51	15	1	2	merma	14	68.10	953.40
4608	315	29	3	3	4	compra	22	46.87	1031.14
4609	150	34	4	2	5	compra	20	14.26	285.20
4610	81	12	5	2	4	compra	8	29.21	233.68
4611	269	93	3	3	4	venta	16	27.70	443.20
4612	19	50	5	1	2	merma	10	66.93	669.30
4613	248	30	12	3	2	merma	21	65.80	1381.80
4614	356	20	12	2	5	merma	20	55.99	1119.80
4615	75	34	3	1	2	venta	4	79.09	316.36
4616	133	36	20	2	5	merma	3	81.60	244.80
4617	323	7	14	1	4	merma	3	70.47	211.41
4618	85	8	12	2	5	venta	20	61.73	1234.60
4619	32	57	20	1	2	compra	29	93.09	2699.61
4620	116	45	4	1	5	compra	12	68.76	825.12
4621	360	5	16	3	3	venta	30	86.65	2599.50
4622	30	46	12	1	3	merma	17	55.18	938.06
4623	139	2	13	3	3	venta	19	81.31	1544.89
4624	329	28	2	1	1	merma	10	40.77	407.70
4625	320	5	2	3	3	compra	5	72.11	360.55
4626	78	69	17	3	5	merma	15	64.80	972.00
4627	272	8	2	2	3	venta	3	90.48	271.44
4628	167	49	9	2	4	merma	7	53.34	373.38
4629	323	46	2	3	2	venta	3	95.56	286.68
4630	91	15	2	1	4	compra	3	78.20	234.60
4631	279	91	12	1	3	merma	9	70.50	634.50
4632	11	89	19	3	2	venta	8	32.50	260.00
4633	311	47	3	1	1	venta	19	48.68	924.92
4634	63	42	12	3	5	compra	13	52.26	679.38
4635	358	10	9	1	2	compra	27	27.47	741.69
4636	295	8	13	3	4	compra	8	83.75	670.00
4637	255	78	18	1	2	venta	26	71.76	1865.76
4638	37	48	6	1	4	merma	6	14.52	87.12
4639	56	37	14	2	1	venta	2	49.14	98.28
4640	297	41	15	1	5	compra	3	49.89	149.67
4641	53	65	14	1	2	venta	30	42.43	1272.90
4642	98	34	18	3	2	venta	16	32.49	519.84
4643	135	14	16	2	5	venta	30	61.65	1849.50
4644	151	37	10	3	3	compra	22	59.91	1318.02
4645	205	33	3	3	5	compra	9	68.76	618.84
4646	231	51	20	2	5	merma	22	88.74	1952.28
4647	190	93	5	2	4	merma	4	10.75	43.00
4648	193	28	6	1	2	venta	19	91.25	1733.75
4649	165	95	16	1	4	compra	17	25.87	439.79
4650	2	44	9	1	3	compra	30	84.40	2532.00
4651	3	90	14	3	2	merma	27	16.42	443.34
4652	102	79	11	1	2	merma	21	94.95	1993.95
4653	123	76	19	3	1	venta	2	95.58	191.16
4654	45	74	2	1	4	venta	19	34.43	654.17
4655	163	9	17	2	5	merma	21	58.32	1224.72
4656	354	32	15	2	1	compra	1	21.68	21.68
4657	110	73	19	1	2	merma	1	92.03	92.03
4658	245	35	20	3	1	compra	21	28.45	597.45
4659	288	17	20	1	3	venta	8	86.94	695.52
4660	298	52	1	2	1	merma	19	55.04	1045.76
4661	54	85	14	2	2	merma	11	17.50	192.50
4662	166	38	14	1	3	compra	21	70.66	1483.86
4663	305	67	14	2	4	venta	26	36.51	949.26
4664	276	87	1	1	5	merma	17	73.40	1247.80
4665	77	81	14	1	1	compra	22	74.28	1634.16
4666	51	20	15	2	4	merma	13	71.38	927.94
4667	158	90	11	1	5	venta	14	96.92	1356.88
4668	66	20	8	3	3	venta	17	56.63	962.71
4669	228	43	14	1	3	compra	18	27.73	499.14
4670	172	86	5	1	3	merma	7	98.31	688.17
4671	129	65	5	3	2	compra	15	52.70	790.50
4672	32	85	5	3	3	compra	14	91.99	1287.86
4673	129	50	11	3	3	venta	6	16.98	101.88
4674	347	30	3	3	3	merma	18	97.97	1763.46
4675	259	29	7	1	5	venta	29	68.76	1994.04
4676	283	14	5	3	3	compra	20	9.88	197.60
4677	186	23	12	1	2	compra	11	96.13	1057.43
4678	46	24	19	3	3	merma	22	24.74	544.28
4679	218	53	6	1	3	compra	21	35.93	754.53
4680	218	13	17	3	5	venta	12	13.14	157.68
4681	365	44	10	3	3	compra	19	41.08	780.52
4682	265	13	13	1	3	merma	12	87.88	1054.56
4683	180	53	11	1	4	compra	20	10.65	213.00
4684	254	78	11	1	4	merma	13	72.13	937.69
4685	76	34	11	3	3	compra	8	98.69	789.52
4686	113	46	17	3	2	merma	2	95.22	190.44
4687	74	18	6	3	4	venta	21	62.07	1303.47
4688	169	34	9	2	2	merma	2	78.29	156.58
4689	8	22	20	1	4	venta	7	35.50	248.50
4690	192	77	9	2	2	merma	19	82.73	1571.87
4691	344	33	9	1	4	merma	10	7.67	76.70
4692	119	87	13	2	2	venta	21	46.15	969.15
4693	172	9	15	3	2	merma	8	83.77	670.16
4694	270	33	20	3	1	merma	2	14.10	28.20
4695	56	64	16	3	2	venta	29	25.97	753.13
4696	149	93	4	3	4	compra	29	98.84	2866.36
4697	253	92	5	3	5	compra	12	5.67	68.04
4698	188	12	13	2	2	compra	15	58.94	884.10
4699	351	38	15	3	5	venta	9	56.97	512.73
4700	214	49	16	3	4	venta	22	82.89	1823.58
4701	145	81	20	3	4	compra	15	77.61	1164.15
4702	75	22	4	1	4	venta	13	28.99	376.87
4703	210	14	12	2	2	venta	18	33.91	610.38
4704	300	86	9	2	3	merma	25	48.22	1205.50
4705	226	16	4	1	1	venta	24	71.09	1706.16
4706	101	20	16	3	3	merma	10	39.29	392.90
4707	47	11	12	3	3	venta	23	15.27	351.21
4708	288	99	11	2	5	venta	25	46.12	1153.00
4709	57	65	18	1	4	venta	27	53.04	1432.08
4710	57	18	9	3	4	merma	1	62.70	62.70
4711	279	39	11	2	3	venta	28	83.34	2333.52
4712	310	4	11	2	3	compra	29	88.36	2562.44
4713	195	15	12	3	1	compra	23	68.53	1576.19
4714	119	4	10	3	4	venta	30	63.09	1892.70
4715	148	93	12	1	2	venta	21	96.57	2027.97
4716	5	8	16	3	4	venta	18	38.12	686.16
4717	212	4	6	3	1	compra	20	81.23	1624.60
4718	56	59	16	1	5	compra	4	30.59	122.36
4719	323	6	10	1	3	compra	13	55.41	720.33
4720	127	76	16	2	1	venta	7	8.61	60.27
4721	176	51	5	3	2	venta	21	49.18	1032.78
4722	177	6	10	3	5	compra	26	20.80	540.80
4723	292	44	4	3	2	compra	8	59.56	476.48
4724	259	70	10	1	4	merma	20	9.00	180.00
4725	148	26	3	1	2	venta	1	6.26	6.26
4726	162	72	13	2	4	merma	23	82.06	1887.38
4727	10	79	5	1	5	merma	18	5.13	92.34
4728	234	84	14	3	2	compra	19	15.18	288.42
4729	199	33	7	1	4	venta	7	70.87	496.09
4730	111	31	18	1	4	compra	28	16.16	452.48
4731	169	47	16	1	5	merma	27	44.34	1197.18
4732	83	52	13	2	4	compra	18	98.17	1767.06
4733	254	66	3	1	1	merma	15	80.30	1204.50
4734	56	45	15	3	1	merma	5	73.28	366.40
4735	291	4	11	1	4	merma	25	52.91	1322.75
4736	38	79	9	3	3	compra	29	46.00	1334.00
4737	250	52	9	3	2	merma	5	12.09	60.45
4738	333	31	20	1	1	merma	30	29.16	874.80
4739	258	34	8	3	3	merma	12	37.17	446.04
4740	362	21	15	3	2	merma	14	15.12	211.68
4741	156	2	2	1	4	venta	11	64.10	705.10
4742	17	62	18	2	3	venta	15	45.70	685.50
4743	9	10	19	3	3	merma	20	48.61	972.20
4744	86	32	19	2	3	merma	5	55.20	276.00
4745	130	2	16	1	3	venta	29	80.50	2334.50
4746	324	46	11	3	4	merma	2	51.41	102.82
4747	101	83	8	1	2	venta	12	81.19	974.28
4748	111	80	7	3	2	compra	11	56.77	624.47
4749	20	41	9	1	3	compra	10	80.12	801.20
4750	102	25	6	3	1	merma	16	71.29	1140.64
4751	51	50	3	1	5	compra	8	50.14	401.12
4752	232	71	19	3	5	venta	18	59.37	1068.66
4753	136	25	8	2	1	compra	16	70.31	1124.96
4754	49	9	7	2	4	compra	6	24.53	147.18
4755	178	97	16	1	2	compra	10	20.27	202.70
4756	183	99	10	3	4	merma	25	18.34	458.50
4757	284	73	3	1	3	venta	12	73.94	887.28
4758	209	65	16	1	3	merma	27	88.74	2395.98
4759	364	76	10	1	1	merma	30	88.95	2668.50
4760	230	64	16	2	2	venta	19	55.26	1049.94
4761	46	46	7	1	4	merma	12	29.24	350.88
4762	348	20	3	3	1	merma	30	22.19	665.70
4763	1	2	12	3	2	venta	19	29.42	558.98
4764	285	32	17	2	3	merma	14	87.98	1231.72
4765	93	33	16	1	4	venta	16	72.69	1163.04
4766	94	5	11	1	5	merma	15	58.76	881.40
4767	239	67	9	3	3	venta	10	60.08	600.80
4768	348	46	16	3	1	compra	5	55.87	279.35
4769	115	67	7	2	4	compra	27	33.14	894.78
4770	302	73	16	1	1	merma	9	85.47	769.23
4771	85	50	5	2	4	venta	23	8.68	199.64
4772	103	58	5	3	2	venta	5	67.02	335.10
4773	130	47	20	2	5	venta	20	57.68	1153.60
4774	337	14	4	2	2	merma	8	49.19	393.52
4775	191	74	8	3	2	compra	3	19.33	57.99
4776	324	55	17	3	5	merma	8	48.53	388.24
4777	121	97	18	3	3	venta	14	53.89	754.46
4778	83	36	2	3	1	venta	14	49.38	691.32
4779	194	1	3	1	5	venta	13	43.26	562.38
4780	180	25	18	2	3	merma	28	7.36	206.08
4781	96	32	12	3	5	venta	19	98.11	1864.09
4782	248	57	6	2	2	merma	24	77.89	1869.36
4783	116	98	15	3	4	compra	8	22.09	176.72
4784	144	2	3	2	3	venta	30	33.56	1006.80
4785	282	86	4	2	4	compra	28	79.18	2217.04
4786	100	4	6	2	3	venta	7	31.46	220.22
4787	299	73	15	3	3	venta	30	76.35	2290.50
4788	229	30	10	1	2	venta	28	85.62	2397.36
4789	213	6	12	3	3	venta	6	51.99	311.94
4790	323	64	10	2	3	merma	10	13.70	137.00
4791	70	82	8	2	1	merma	14	78.79	1103.06
4792	60	39	7	3	5	venta	21	11.92	250.32
4793	114	75	20	3	4	compra	22	91.19	2006.18
4794	336	23	8	3	5	merma	16	60.85	973.60
4795	318	26	18	3	4	venta	30	40.60	1218.00
4796	100	83	20	1	3	merma	1	88.74	88.74
4797	152	75	5	1	5	venta	15	70.13	1051.95
4798	14	33	14	1	1	merma	13	33.89	440.57
4799	39	70	12	1	5	merma	5	58.32	291.60
4800	140	45	9	1	4	venta	27	49.06	1324.62
4801	23	90	17	3	4	compra	2	57.47	114.94
4802	145	46	8	1	5	compra	2	60.71	121.42
4803	191	43	15	3	1	venta	21	32.95	691.95
4804	336	92	9	1	3	merma	16	27.65	442.40
4805	53	24	10	1	2	venta	6	87.74	526.44
4806	266	65	4	3	1	venta	11	94.84	1043.24
4807	132	99	12	1	5	venta	30	53.54	1606.20
4808	73	18	2	2	1	compra	2	47.17	94.34
4809	198	88	14	2	1	compra	21	38.65	811.65
4810	68	70	8	3	3	compra	7	8.49	59.43
4811	352	52	16	1	3	merma	18	80.65	1451.70
4812	344	35	5	1	4	compra	6	94.65	567.90
4813	337	52	19	3	1	merma	27	47.36	1278.72
4814	264	29	11	2	3	merma	19	7.82	148.58
4815	69	58	8	3	3	compra	24	83.25	1998.00
4816	336	79	9	1	2	merma	18	93.43	1681.74
4817	1	57	2	2	3	venta	19	93.05	1767.95
4818	183	77	1	3	2	merma	29	7.10	205.90
4819	148	29	14	3	4	compra	3	10.95	32.85
4820	18	20	13	1	4	venta	11	9.16	100.76
4821	6	77	20	1	4	merma	23	72.12	1658.76
4822	22	8	10	3	1	compra	13	32.00	416.00
4823	49	89	20	3	3	venta	15	44.81	672.15
4824	191	75	18	2	5	compra	19	81.68	1551.92
4825	290	79	1	1	4	merma	5	91.46	457.30
4826	226	94	19	2	2	compra	9	18.70	168.30
4827	222	36	14	1	3	venta	14	46.28	647.92
4828	82	31	4	1	3	venta	18	17.17	309.06
4829	200	85	8	1	1	venta	13	9.63	125.19
4830	357	43	13	2	5	merma	22	87.40	1922.80
4831	119	80	6	3	5	merma	22	22.81	501.82
4832	12	93	1	2	1	merma	9	60.75	546.75
4833	48	3	11	1	1	merma	2	58.36	116.72
4834	84	4	12	2	3	merma	11	66.52	731.72
4835	15	100	6	1	3	compra	6	78.58	471.48
4836	126	44	12	1	1	venta	21	96.81	2033.01
4837	271	71	6	1	1	compra	25	90.04	2251.00
4838	24	24	10	3	4	venta	1	82.50	82.50
4839	214	52	10	2	1	compra	1	31.22	31.22
4840	314	84	2	2	2	compra	5	15.90	79.50
4841	172	38	18	1	4	compra	28	8.59	240.52
4842	124	31	13	3	4	merma	4	88.12	352.48
4843	10	33	4	1	5	compra	26	17.17	446.42
4844	265	54	13	1	2	merma	18	8.97	161.46
4845	38	85	12	3	2	compra	16	34.25	548.00
4846	318	19	10	2	4	compra	4	43.05	172.20
4847	2	29	19	2	4	compra	6	36.43	218.58
4848	245	60	8	3	4	compra	27	40.50	1093.50
4849	192	39	9	3	5	venta	6	41.76	250.56
4850	249	5	8	3	1	compra	15	66.44	996.60
4851	125	14	13	1	5	venta	7	16.38	114.66
4852	73	42	6	1	4	venta	1	53.77	53.77
4853	300	77	14	3	4	merma	18	85.08	1531.44
4854	97	62	19	1	1	venta	17	15.74	267.58
4855	226	45	14	3	5	merma	21	79.91	1678.11
4856	321	71	16	3	1	venta	24	32.22	773.28
4857	329	19	11	1	4	compra	1	77.07	77.07
4858	319	88	6	1	1	compra	15	16.92	253.80
4859	183	74	3	2	5	compra	16	45.17	722.72
4860	280	15	1	2	1	merma	25	41.26	1031.50
4861	231	67	18	2	3	merma	15	30.99	464.85
4862	76	16	15	3	4	compra	2	20.71	41.42
4863	275	14	17	2	2	venta	3	93.29	279.87
4864	226	29	4	3	2	venta	11	62.28	685.08
4865	244	52	15	2	1	venta	23	45.27	1041.21
4866	258	31	4	3	5	merma	24	78.63	1887.12
4867	107	62	6	3	2	merma	3	73.46	220.38
4868	198	28	6	3	1	compra	16	69.21	1107.36
4869	24	58	17	2	2	merma	29	71.38	2070.02
4870	302	78	1	2	4	compra	18	22.75	409.50
4871	228	94	20	1	3	venta	6	87.46	524.76
4872	127	38	11	2	1	merma	15	55.42	831.30
4873	244	23	16	3	3	venta	19	41.83	794.77
4874	84	34	19	2	5	venta	17	57.34	974.78
4875	239	8	4	2	5	merma	20	77.84	1556.80
4876	248	20	8	1	3	merma	10	26.91	269.10
4877	83	97	7	1	5	compra	10	50.12	501.20
4878	99	91	18	2	4	merma	12	91.33	1095.96
4879	328	50	12	2	2	compra	26	90.48	2352.48
4880	321	36	20	2	4	venta	17	17.79	302.43
4881	230	48	6	2	5	compra	27	30.26	817.02
4882	220	99	2	2	2	venta	3	41.27	123.81
4883	318	53	5	2	4	venta	9	45.07	405.63
4884	247	2	8	2	3	compra	8	87.05	696.40
4885	34	75	14	2	5	venta	21	50.25	1055.25
4886	218	43	14	3	1	compra	1	6.15	6.15
4887	1	31	4	1	4	merma	26	62.69	1629.94
4888	316	71	13	3	4	venta	30	60.22	1806.60
4889	138	97	6	3	1	compra	15	37.72	565.80
4890	83	75	20	2	1	venta	9	91.16	820.44
4891	193	12	20	3	3	compra	9	57.46	517.14
4892	262	79	19	3	3	venta	18	52.70	948.60
4893	258	58	16	2	4	venta	14	41.88	586.32
4894	224	51	12	1	3	merma	21	98.80	2074.80
4895	149	24	8	3	3	merma	22	19.50	429.00
4896	151	10	7	2	2	compra	25	94.52	2363.00
4897	133	70	16	1	4	merma	29	81.67	2368.43
4898	164	67	7	3	1	compra	29	40.44	1172.76
4899	330	46	5	1	2	compra	29	68.84	1996.36
4900	45	30	1	2	5	venta	26	70.33	1828.58
4901	337	76	16	1	4	compra	7	52.12	364.84
4902	38	51	18	1	3	venta	6	98.98	593.88
4903	42	41	7	2	2	compra	12	93.10	1117.20
4904	357	25	18	1	3	compra	10	50.64	506.40
4905	154	11	3	2	3	compra	14	33.62	470.68
4906	158	75	13	3	2	compra	21	5.82	122.22
4907	42	5	6	2	3	venta	13	97.06	1261.78
4908	230	87	19	2	5	merma	30	88.36	2650.80
4909	273	87	9	1	4	venta	27	89.89	2427.03
4910	301	18	4	2	5	merma	11	40.63	446.93
4911	166	18	16	1	3	venta	16	37.87	605.92
4912	184	88	13	2	4	merma	12	36.56	438.72
4913	155	59	20	1	4	merma	2	47.88	95.76
4914	218	49	12	3	3	venta	12	68.53	822.36
4915	119	51	20	1	4	compra	17	12.82	217.94
4916	265	88	17	3	4	compra	28	26.96	754.88
4917	180	12	5	3	3	compra	9	6.35	57.15
4918	331	78	10	3	2	compra	20	24.02	480.40
4919	82	90	9	3	2	venta	4	83.23	332.92
4920	11	100	1	2	1	venta	8	23.11	184.88
4921	9	15	18	1	4	merma	14	94.40	1321.60
4922	257	12	11	1	2	compra	20	62.17	1243.40
4923	13	34	9	3	3	merma	25	34.23	855.75
4924	281	28	2	3	5	venta	16	31.30	500.80
4925	251	52	6	1	2	compra	1	26.25	26.25
4926	222	37	6	2	1	compra	17	25.08	426.36
4927	244	84	15	2	4	venta	16	44.73	715.68
4928	274	72	1	2	3	venta	4	32.32	129.28
4929	163	20	11	2	1	merma	19	60.27	1145.13
4930	68	46	13	3	3	venta	12	81.81	981.72
4931	327	75	9	1	5	merma	20	40.23	804.60
4932	290	43	18	3	2	compra	22	26.18	575.96
4933	150	13	7	2	3	merma	27	6.85	184.95
4934	353	49	14	3	5	venta	10	64.38	643.80
4935	105	63	13	3	5	compra	14	93.24	1305.36
4936	309	81	20	2	1	compra	19	77.19	1466.61
4937	358	82	12	1	5	merma	16	85.43	1366.88
4938	65	10	15	3	3	venta	30	9.83	294.90
4939	65	93	9	2	2	compra	11	75.98	835.78
4940	286	39	1	1	2	merma	29	9.13	264.77
4941	268	60	15	2	5	merma	12	69.45	833.40
4942	27	12	20	1	1	merma	26	69.20	1799.20
4943	17	66	17	1	3	venta	14	95.45	1336.30
4944	91	45	10	2	5	venta	8	79.35	634.80
4945	296	69	18	3	5	venta	15	94.96	1424.40
4946	203	81	12	2	2	compra	9	54.47	490.23
4947	198	18	9	1	1	merma	23	42.78	983.94
4948	53	77	14	2	1	venta	15	73.42	1101.30
4949	296	74	1	3	4	merma	2	41.77	83.54
4950	3	7	20	1	1	merma	27	60.49	1633.23
4951	346	25	18	3	1	venta	13	6.77	88.01
4952	258	95	17	1	2	merma	6	85.78	514.68
4953	344	37	8	2	2	merma	2	18.81	37.62
4954	237	47	9	3	3	venta	21	49.46	1038.66
4955	88	62	16	3	3	venta	14	20.17	282.38
4956	335	32	6	3	4	compra	14	34.51	483.14
4957	313	56	2	3	4	merma	2	92.48	184.96
4958	53	12	10	3	3	venta	29	49.93	1447.97
4959	59	46	11	2	1	compra	10	94.13	941.30
4960	319	97	4	1	3	venta	15	41.28	619.20
4961	176	36	16	1	4	merma	9	41.03	369.27
4962	95	54	13	2	4	compra	11	31.35	344.85
4963	219	70	1	1	4	compra	8	20.59	164.72
4964	346	6	11	2	3	compra	24	45.23	1085.52
4965	123	34	17	3	4	merma	26	40.13	1043.38
4966	321	39	8	1	3	venta	26	19.59	509.34
4967	354	90	12	2	5	merma	22	13.47	296.34
4968	143	60	20	3	2	venta	15	83.06	1245.90
4969	215	74	6	2	4	compra	6	20.81	124.86
4970	232	11	16	1	1	compra	6	10.75	64.50
4971	72	14	1	3	3	merma	15	54.11	811.65
4972	201	4	19	3	1	compra	14	38.56	539.84
4973	167	42	4	3	3	compra	25	65.04	1626.00
4974	37	89	19	2	4	venta	13	68.51	890.63
4975	13	47	3	3	3	merma	7	19.58	137.06
4976	302	61	6	1	4	compra	23	83.23	1914.29
4977	207	41	17	2	5	merma	15	17.79	266.85
4978	217	2	11	2	1	compra	1	42.45	42.45
4979	2	81	10	1	4	compra	27	70.29	1897.83
4980	230	39	11	1	3	merma	13	90.20	1172.60
4981	20	76	4	1	4	compra	22	32.92	724.24
4982	361	97	10	2	1	venta	9	23.90	215.10
4983	8	56	9	3	2	merma	27	43.87	1184.49
4984	36	38	14	3	1	compra	2	97.35	194.70
4985	305	31	14	1	4	venta	17	14.90	253.30
4986	83	75	9	1	5	compra	7	52.68	368.76
4987	109	18	19	2	2	compra	6	80.60	483.60
4988	217	90	9	1	1	compra	9	13.08	117.72
4989	221	66	18	2	4	venta	28	84.74	2372.72
4990	312	33	17	1	1	compra	2	64.82	129.64
4991	44	78	10	1	4	merma	7	36.37	254.59
4992	282	57	15	3	5	compra	15	48.46	726.90
4993	300	30	12	3	3	venta	29	15.90	461.10
4994	267	13	3	2	3	venta	25	54.01	1350.25
4995	236	79	11	1	4	compra	27	73.39	1981.53
4996	304	85	2	1	3	compra	4	29.65	118.60
4997	94	36	15	3	5	merma	30	99.89	2996.70
4998	5	11	18	3	2	venta	2	21.39	42.78
4999	89	90	1	3	1	merma	2	13.10	26.20
5000	6	46	6	3	4	venta	13	33.65	437.45
\.


--
-- Name: dim_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiendita_user
--

SELECT pg_catalog.setval('public.dim_empleado_id_seq', 5, true);


--
-- Name: dim_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiendita_user
--

SELECT pg_catalog.setval('public.dim_producto_id_seq', 100, true);


--
-- Name: dim_proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiendita_user
--

SELECT pg_catalog.setval('public.dim_proveedor_id_seq', 20, true);


--
-- Name: dim_tiempo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiendita_user
--

SELECT pg_catalog.setval('public.dim_tiempo_id_seq', 366, true);


--
-- Name: dim_tienda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiendita_user
--

SELECT pg_catalog.setval('public.dim_tienda_id_seq', 3, true);


--
-- Name: hecho_transaccion_inventario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tiendita_user
--

SELECT pg_catalog.setval('public.hecho_transaccion_inventario_id_seq', 5000, true);


--
-- Name: dim_empleado dim_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_empleado
    ADD CONSTRAINT dim_empleado_pkey PRIMARY KEY (id);


--
-- Name: dim_producto dim_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_producto
    ADD CONSTRAINT dim_producto_pkey PRIMARY KEY (id);


--
-- Name: dim_proveedor dim_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_proveedor
    ADD CONSTRAINT dim_proveedor_pkey PRIMARY KEY (id);


--
-- Name: dim_tiempo dim_tiempo_pkey; Type: CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (id);


--
-- Name: dim_tienda dim_tienda_pkey; Type: CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.dim_tienda
    ADD CONSTRAINT dim_tienda_pkey PRIMARY KEY (id);


--
-- Name: hecho_transaccion_inventario hecho_transaccion_inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario
    ADD CONSTRAINT hecho_transaccion_inventario_pkey PRIMARY KEY (id);


--
-- Name: hecho_transaccion_inventario hecho_transaccion_inventario_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario
    ADD CONSTRAINT hecho_transaccion_inventario_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES public.dim_empleado(id);


--
-- Name: hecho_transaccion_inventario hecho_transaccion_inventario_fecha_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario
    ADD CONSTRAINT hecho_transaccion_inventario_fecha_id_fkey FOREIGN KEY (fecha_id) REFERENCES public.dim_tiempo(id);


--
-- Name: hecho_transaccion_inventario hecho_transaccion_inventario_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario
    ADD CONSTRAINT hecho_transaccion_inventario_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.dim_producto(id);


--
-- Name: hecho_transaccion_inventario hecho_transaccion_inventario_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario
    ADD CONSTRAINT hecho_transaccion_inventario_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.dim_proveedor(id);


--
-- Name: hecho_transaccion_inventario hecho_transaccion_inventario_tienda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tiendita_user
--

ALTER TABLE ONLY public.hecho_transaccion_inventario
    ADD CONSTRAINT hecho_transaccion_inventario_tienda_id_fkey FOREIGN KEY (tienda_id) REFERENCES public.dim_tienda(id);


--
-- Name: TABLE dim_empleado; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON TABLE public.dim_empleado TO tiendita_user;


--
-- Name: SEQUENCE dim_empleado_id_seq; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON SEQUENCE public.dim_empleado_id_seq TO tiendita_user;


--
-- Name: TABLE dim_producto; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON TABLE public.dim_producto TO tiendita_user;


--
-- Name: SEQUENCE dim_producto_id_seq; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON SEQUENCE public.dim_producto_id_seq TO tiendita_user;


--
-- Name: TABLE dim_proveedor; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON TABLE public.dim_proveedor TO tiendita_user;


--
-- Name: SEQUENCE dim_proveedor_id_seq; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON SEQUENCE public.dim_proveedor_id_seq TO tiendita_user;


--
-- Name: TABLE dim_tiempo; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON TABLE public.dim_tiempo TO tiendita_user;


--
-- Name: SEQUENCE dim_tiempo_id_seq; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON SEQUENCE public.dim_tiempo_id_seq TO tiendita_user;


--
-- Name: TABLE dim_tienda; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON TABLE public.dim_tienda TO tiendita_user;


--
-- Name: SEQUENCE dim_tienda_id_seq; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON SEQUENCE public.dim_tienda_id_seq TO tiendita_user;


--
-- Name: TABLE hecho_transaccion_inventario; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON TABLE public.hecho_transaccion_inventario TO tiendita_user;


--
-- Name: SEQUENCE hecho_transaccion_inventario_id_seq; Type: ACL; Schema: public; Owner: tiendita_user
--

GRANT ALL ON SEQUENCE public.hecho_transaccion_inventario_id_seq TO tiendita_user;


--
-- PostgreSQL database dump complete
--

