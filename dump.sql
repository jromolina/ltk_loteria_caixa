--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: lotomania; Type: SCHEMA; Schema: -; Owner: ltk
--

CREATE SCHEMA lotomania;


ALTER SCHEMA lotomania OWNER TO ltk;

SET search_path = lotomania, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: lotomania_resultado_bolas; Type: TABLE; Schema: lotomania; Owner: ltk
--

CREATE TABLE lotomania_resultado_bolas (
    concurso numeric NOT NULL,
    b_1 numeric DEFAULT 0,
    b_2 numeric DEFAULT 0,
    b_3 numeric DEFAULT 0,
    b_4 numeric DEFAULT 0,
    b_5 numeric DEFAULT 0,
    b_6 numeric DEFAULT 0,
    b_7 numeric DEFAULT 0,
    b_8 numeric DEFAULT 0,
    b_9 numeric DEFAULT 0,
    b_10 numeric DEFAULT 0,
    b_11 numeric DEFAULT 0,
    b_12 numeric DEFAULT 0,
    b_13 numeric DEFAULT 0,
    b_14 numeric DEFAULT 0,
    b_15 numeric DEFAULT 0,
    b_16 numeric DEFAULT 0,
    b_17 numeric DEFAULT 0,
    b_18 numeric DEFAULT 0,
    b_19 numeric DEFAULT 0,
    b_20 numeric DEFAULT 0,
    CONSTRAINT lotomania_resultado_bolas_chk CHECK ((((((((((((((((((((b_1 < b_2) AND (b_2 < b_3)) AND (b_3 < b_4)) AND (b_4 < b_5)) AND (b_5 < b_6)) AND (b_6 < b_7)) AND (b_7 < b_8)) AND (b_8 < b_9)) AND (b_9 < b_10)) AND (b_10 < b_11)) AND (b_11 < b_12)) AND (b_12 < b_13)) AND (b_13 < b_14)) AND (b_14 < b_15)) AND (b_15 < b_16)) AND (b_16 < b_17)) AND (b_17 < b_18)) AND (b_18 < b_19)) AND (b_19 < b_20)))
);


ALTER TABLE lotomania_resultado_bolas OWNER TO ltk;

--
-- Name: lotomania_resultado_horizontal; Type: TABLE; Schema: lotomania; Owner: ltk
--

CREATE TABLE lotomania_resultado_horizontal (
    concurso numeric NOT NULL,
    hrz_1 numeric NOT NULL,
    hrz_2 numeric NOT NULL,
    hrz_3 numeric NOT NULL,
    hrz_4 numeric NOT NULL,
    hrz_5 numeric NOT NULL,
    CONSTRAINT lotomania_resultado_horizontal_chk CHECK ((((((hrz_1 + hrz_2) + hrz_3) + hrz_4) + hrz_5) = (20)::numeric))
);


ALTER TABLE lotomania_resultado_horizontal OWNER TO ltk;

--
-- Name: lotomania_resultado_num; Type: TABLE; Schema: lotomania; Owner: ltk
--

CREATE TABLE lotomania_resultado_num (
    concurso numeric NOT NULL,
    data date NOT NULL,
    num_0 numeric DEFAULT 0,
    num_1 numeric DEFAULT 0,
    num_2 numeric DEFAULT 0,
    num_3 numeric DEFAULT 0,
    num_4 numeric DEFAULT 0,
    num_5 numeric DEFAULT 0,
    num_6 numeric DEFAULT 0,
    num_7 numeric DEFAULT 0,
    num_8 numeric DEFAULT 0,
    num_9 numeric DEFAULT 0,
    num_10 numeric DEFAULT 0,
    num_11 numeric DEFAULT 0,
    num_12 numeric DEFAULT 0,
    num_13 numeric DEFAULT 0,
    num_14 numeric DEFAULT 0,
    num_15 numeric DEFAULT 0,
    num_16 numeric DEFAULT 0,
    num_17 numeric DEFAULT 0,
    num_18 numeric DEFAULT 0,
    num_19 numeric DEFAULT 0,
    num_20 numeric DEFAULT 0,
    num_21 numeric DEFAULT 0,
    num_22 numeric DEFAULT 0,
    num_23 numeric DEFAULT 0,
    num_24 numeric DEFAULT 0,
    num_25 numeric DEFAULT 0,
    num_26 numeric DEFAULT 0,
    num_27 numeric DEFAULT 0,
    num_28 numeric DEFAULT 0,
    num_29 numeric DEFAULT 0,
    num_30 numeric DEFAULT 0,
    num_31 numeric DEFAULT 0,
    num_32 numeric DEFAULT 0,
    num_33 numeric DEFAULT 0,
    num_34 numeric DEFAULT 0,
    num_35 numeric DEFAULT 0,
    num_36 numeric DEFAULT 0,
    num_37 numeric DEFAULT 0,
    num_38 numeric DEFAULT 0,
    num_39 numeric DEFAULT 0,
    num_40 numeric DEFAULT 0,
    num_41 numeric DEFAULT 0,
    num_42 numeric DEFAULT 0,
    num_43 numeric DEFAULT 0,
    num_44 numeric DEFAULT 0,
    num_45 numeric DEFAULT 0,
    num_46 numeric DEFAULT 0,
    num_47 numeric DEFAULT 0,
    num_48 numeric DEFAULT 0,
    num_49 numeric DEFAULT 0,
    num_50 numeric DEFAULT 0,
    num_51 numeric DEFAULT 0,
    num_52 numeric DEFAULT 0,
    num_53 numeric DEFAULT 0,
    num_54 numeric DEFAULT 0,
    num_55 numeric DEFAULT 0,
    num_56 numeric DEFAULT 0,
    num_57 numeric DEFAULT 0,
    num_58 numeric DEFAULT 0,
    num_59 numeric DEFAULT 0,
    num_60 numeric DEFAULT 0,
    num_61 numeric DEFAULT 0,
    num_62 numeric DEFAULT 0,
    num_63 numeric DEFAULT 0,
    num_64 numeric DEFAULT 0,
    num_65 numeric DEFAULT 0,
    num_66 numeric DEFAULT 0,
    num_67 numeric DEFAULT 0,
    num_68 numeric DEFAULT 0,
    num_69 numeric DEFAULT 0,
    num_70 numeric DEFAULT 0,
    num_71 numeric DEFAULT 0,
    num_72 numeric DEFAULT 0,
    num_73 numeric DEFAULT 0,
    num_74 numeric DEFAULT 0,
    num_75 numeric DEFAULT 0,
    num_76 numeric DEFAULT 0,
    num_77 numeric DEFAULT 0,
    num_78 numeric DEFAULT 0,
    num_79 numeric DEFAULT 0,
    num_80 numeric DEFAULT 0,
    num_81 numeric DEFAULT 0,
    num_82 numeric DEFAULT 0,
    num_83 numeric DEFAULT 0,
    num_84 numeric DEFAULT 0,
    num_85 numeric DEFAULT 0,
    num_86 numeric DEFAULT 0,
    num_87 numeric DEFAULT 0,
    num_88 numeric DEFAULT 0,
    num_89 numeric DEFAULT 0,
    num_90 numeric DEFAULT 0,
    num_91 numeric DEFAULT 0,
    num_92 numeric DEFAULT 0,
    num_93 numeric DEFAULT 0,
    num_94 numeric DEFAULT 0,
    num_95 numeric DEFAULT 0,
    num_96 numeric DEFAULT 0,
    num_97 numeric DEFAULT 0,
    num_98 numeric DEFAULT 0,
    num_99 numeric DEFAULT 0,
    CONSTRAINT lotomania_resultado_num_num_0_check CHECK ((num_0 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_10_check CHECK ((num_10 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_11_check CHECK ((num_11 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_12_check CHECK ((num_12 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_13_check CHECK ((num_13 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_14_check CHECK ((num_14 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_15_check CHECK ((num_15 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_16_check CHECK ((num_16 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_17_check CHECK ((num_17 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_18_check CHECK ((num_18 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_19_check CHECK ((num_19 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_1_check CHECK ((num_1 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_20_check CHECK ((num_20 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_21_check CHECK ((num_21 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_22_check CHECK ((num_22 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_23_check CHECK ((num_23 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_24_check CHECK ((num_24 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_25_check CHECK ((num_25 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_26_check CHECK ((num_26 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_27_check CHECK ((num_27 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_28_check CHECK ((num_28 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_29_check CHECK ((num_29 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_2_check CHECK ((num_2 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_30_check CHECK ((num_30 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_31_check CHECK ((num_31 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_32_check CHECK ((num_32 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_33_check CHECK ((num_33 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_34_check CHECK ((num_34 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_35_check CHECK ((num_35 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_36_check CHECK ((num_36 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_37_check CHECK ((num_37 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_38_check CHECK ((num_38 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_39_check CHECK ((num_39 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_3_check CHECK ((num_3 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_40_check CHECK ((num_40 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_41_check CHECK ((num_41 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_42_check CHECK ((num_42 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_43_check CHECK ((num_43 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_44_check CHECK ((num_44 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_45_check CHECK ((num_45 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_46_check CHECK ((num_46 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_47_check CHECK ((num_47 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_48_check CHECK ((num_48 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_49_check CHECK ((num_49 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_4_check CHECK ((num_4 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_50_check CHECK ((num_50 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_51_check CHECK ((num_51 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_52_check CHECK ((num_52 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_53_check CHECK ((num_53 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_54_check CHECK ((num_54 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_55_check CHECK ((num_55 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_56_check CHECK ((num_56 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_57_check CHECK ((num_57 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_58_check CHECK ((num_58 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_59_check CHECK ((num_59 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_5_check CHECK ((num_5 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_60_check CHECK ((num_60 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_61_check CHECK ((num_61 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_62_check CHECK ((num_62 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_63_check CHECK ((num_63 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_64_check CHECK ((num_64 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_65_check CHECK ((num_65 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_66_check CHECK ((num_66 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_67_check CHECK ((num_67 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_68_check CHECK ((num_68 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_69_check CHECK ((num_69 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_6_check CHECK ((num_6 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_70_check CHECK ((num_70 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_71_check CHECK ((num_71 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_72_check CHECK ((num_72 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_73_check CHECK ((num_73 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_74_check CHECK ((num_74 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_75_check CHECK ((num_75 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_76_check CHECK ((num_76 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_77_check CHECK ((num_77 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_78_check CHECK ((num_78 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_79_check CHECK ((num_79 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_7_check CHECK ((num_7 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_80_check CHECK ((num_80 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_81_check CHECK ((num_81 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_82_check CHECK ((num_82 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_83_check CHECK ((num_83 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_84_check CHECK ((num_84 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_85_check CHECK ((num_85 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_86_check CHECK ((num_86 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_87_check CHECK ((num_87 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_88_check CHECK ((num_88 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_89_check CHECK ((num_89 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_8_check CHECK ((num_8 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_90_check CHECK ((num_90 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_91_check CHECK ((num_91 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_92_check CHECK ((num_92 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_93_check CHECK ((num_93 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_94_check CHECK ((num_94 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_95_check CHECK ((num_95 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_96_check CHECK ((num_96 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_97_check CHECK ((num_97 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_98_check CHECK ((num_98 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_99_check CHECK ((num_99 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT lotomania_resultado_num_num_9_check CHECK ((num_9 = ANY (ARRAY[(0)::numeric, (1)::numeric]))),
    CONSTRAINT soma_0_a_99_check CHECK (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((num_1 + num_2) + num_3) + num_4) + num_5) + num_6) + num_7) + num_8) + num_9) + num_10) + num_11) + num_12) + num_13) + num_14) + num_15) + num_16) + num_17) + num_18) + num_19) + num_20) + num_21) + num_22) + num_23) + num_24) + num_25) + num_26) + num_27) + num_28) + num_29) + num_30) + num_31) + num_32) + num_33) + num_34) + num_35) + num_36) + num_37) + num_38) + num_39) + num_40) + num_41) + num_42) + num_43) + num_44) + num_45) + num_46) + num_47) + num_48) + num_49) + num_50) + num_51) + num_52) + num_53) + num_54) + num_55) + num_56) + num_57) + num_58) + num_59) + num_60) + num_61) + num_62) + num_63) + num_64) + num_65) + num_66) + num_67) + num_68) + num_69) + num_70) + num_71) + num_72) + num_73) + num_74) + num_75) + num_76) + num_77) + num_78) + num_79) + num_80) + num_81) + num_82) + num_83) + num_84) + num_85) + num_86) + num_87) + num_88) + num_89) + num_90) + num_91) + num_92) + num_93) + num_94) + num_95) + num_96) + num_97) + num_98) + num_99) + num_0) = (20)::numeric))
);


ALTER TABLE lotomania_resultado_num OWNER TO ltk;

--
-- Name: TABLE lotomania_resultado_num; Type: COMMENT; Schema: lotomania; Owner: ltk
--

COMMENT ON TABLE lotomania_resultado_num IS 'Esta é a tabela inicial, que são armazenados os resultados da lotomania, os campos num_0 a num_99 corresponde respectivamentes às bolas 0 a 99 do lotomania,o campo terá o valor 1, se a bola foi sorteada, 0 (zero) caso contrário.Tem que ser sorteado 20 números, senão a restrição de verificação não irá deixar inserir o registro.';


--
-- Name: lotomania_resultado_par_impar; Type: TABLE; Schema: lotomania; Owner: ltk
--

CREATE TABLE lotomania_resultado_par_impar (
    concurso numeric NOT NULL,
    qt_pares numeric NOT NULL,
    qt_impares numeric NOT NULL,
    CONSTRAINT lotomania_resultado_par_impar_chk CHECK (((qt_pares + qt_impares) = (20)::numeric))
);


ALTER TABLE lotomania_resultado_par_impar OWNER TO ltk;

--
-- Name: lotomania_resultado_vertical; Type: TABLE; Schema: lotomania; Owner: ltk
--

CREATE TABLE lotomania_resultado_vertical (
    concurso numeric NOT NULL,
    vrt_1 numeric NOT NULL,
    vrt_2 numeric NOT NULL,
    vrt_3 numeric NOT NULL,
    vrt_4 numeric NOT NULL,
    vrt_5 numeric NOT NULL,
    CONSTRAINT lotomania_resultado_vertical_chk CHECK ((((((vrt_1 + vrt_2) + vrt_3) + vrt_4) + vrt_5) = (20)::numeric))
);


ALTER TABLE lotomania_resultado_vertical OWNER TO ltk;

--
-- Data for Name: lotomania_resultado_bolas; Type: TABLE DATA; Schema: lotomania; Owner: ltk
--

COPY lotomania_resultado_bolas (concurso, b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13, b_14, b_15, b_16, b_17, b_18, b_19, b_20) FROM stdin;
\.


--
-- Data for Name: lotomania_resultado_horizontal; Type: TABLE DATA; Schema: lotomania; Owner: ltk
--

COPY lotomania_resultado_horizontal (concurso, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5) FROM stdin;
\.


--
-- Data for Name: lotomania_resultado_num; Type: TABLE DATA; Schema: lotomania; Owner: ltk
--

COPY lotomania_resultado_num (concurso, data, num_0, num_1, num_2, num_3, num_4, num_5, num_6, num_7, num_8, num_9, num_10, num_11, num_12, num_13, num_14, num_15, num_16, num_17, num_18, num_19, num_20, num_21, num_22, num_23, num_24, num_25, num_26, num_27, num_28, num_29, num_30, num_31, num_32, num_33, num_34, num_35, num_36, num_37, num_38, num_39, num_40, num_41, num_42, num_43, num_44, num_45, num_46, num_47, num_48, num_49, num_50, num_51, num_52, num_53, num_54, num_55, num_56, num_57, num_58, num_59, num_60, num_61, num_62, num_63, num_64, num_65, num_66, num_67, num_68, num_69, num_70, num_71, num_72, num_73, num_74, num_75, num_76, num_77, num_78, num_79, num_80, num_81, num_82, num_83, num_84, num_85, num_86, num_87, num_88, num_89, num_90, num_91, num_92, num_93, num_94, num_95, num_96, num_97, num_98, num_99) FROM stdin;
\.


--
-- Data for Name: lotomania_resultado_par_impar; Type: TABLE DATA; Schema: lotomania; Owner: ltk
--

COPY lotomania_resultado_par_impar (concurso, qt_pares, qt_impares) FROM stdin;
\.


--
-- Data for Name: lotomania_resultado_vertical; Type: TABLE DATA; Schema: lotomania; Owner: ltk
--

COPY lotomania_resultado_vertical (concurso, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5) FROM stdin;
\.


--
-- Name: lotomania_resultado_bolas_pk; Type: CONSTRAINT; Schema: lotomania; Owner: ltk
--

ALTER TABLE ONLY lotomania_resultado_bolas
    ADD CONSTRAINT lotomania_resultado_bolas_pk PRIMARY KEY (concurso);


--
-- Name: lotomania_resultado_pk; Type: CONSTRAINT; Schema: lotomania; Owner: ltk
--

ALTER TABLE ONLY lotomania_resultado_num
    ADD CONSTRAINT lotomania_resultado_pk PRIMARY KEY (concurso);


--
-- Name: lotomania_resultado_bolas_fk; Type: FK CONSTRAINT; Schema: lotomania; Owner: ltk
--

ALTER TABLE ONLY lotomania_resultado_bolas
    ADD CONSTRAINT lotomania_resultado_bolas_fk FOREIGN KEY (concurso) REFERENCES lotomania_resultado_num(concurso) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lotomania_resultado_horizontal_fk; Type: FK CONSTRAINT; Schema: lotomania; Owner: ltk
--

ALTER TABLE ONLY lotomania_resultado_horizontal
    ADD CONSTRAINT lotomania_resultado_horizontal_fk FOREIGN KEY (concurso) REFERENCES lotomania_resultado_num(concurso) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lotomania_resultado_par_impar_fk; Type: FK CONSTRAINT; Schema: lotomania; Owner: ltk
--

ALTER TABLE ONLY lotomania_resultado_par_impar
    ADD CONSTRAINT lotomania_resultado_par_impar_fk FOREIGN KEY (concurso) REFERENCES lotomania_resultado_num(concurso) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lotomania_resultado_vertical_fk; Type: FK CONSTRAINT; Schema: lotomania; Owner: ltk
--

ALTER TABLE ONLY lotomania_resultado_vertical
    ADD CONSTRAINT lotomania_resultado_vertical_fk FOREIGN KEY (concurso) REFERENCES lotomania_resultado_num(concurso) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

