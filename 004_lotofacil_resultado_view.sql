/**
  Apaga toda as tabelas, que serão usadas no view.
 */
drop view if exists lotofacil.v_lotofacil_resultado_horizontal;
drop view if exists lotofacil.v_lotofacil_resultado_horizontal_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_vertical;
drop view if exists lotofacil.v_lotofacil_resultado_vertical_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_diagonal;
drop view if exists lotofacil.v_lotofacil_resultado_diagonal_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_cruzeta;
drop view if exists lotofacil.v_lotofacil_resultado_cruzeta_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_quarteto;


drop view if exists lotofacil.v_lotofacil_resultado_externo_interno;
drop view if exists lotofacil.v_lotofacil_resultado_externo_interno_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_par_impar;
drop view if exists lotofacil.v_lotofacil_resultado_par_impar_detalhado;

/**
  Externo x Interno
 */
drop view if exists lotofacil.v_lotofacil_resultado_externo_interno;
create view lotofacil.v_lotofacil_resultado_externo_interno AS
  Select ltf_res.ext_int_id, ltf_res.int_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_externo_interno ltf_res
  group by ltf_res.ext_int_id, ltf_res.int_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_externo_interno_detalhado;
create view lotofacil.v_lotofacil_resultado_externo_interno_detalhado AS
  Select ltf_res.ext_int_id, ltf_res.int_id, externo, interno, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_externo_interno ltf_res, lotofacil.lotofacil_id_externo_interno ltf_id
    where ltf_res.ext_int_id = ltf_id.ext_int_id
  group by ltf_res.ext_int_id, ltf_res.int_id, externo, interno
  order by qt_vezes desc;

/**
  Par x Impar.
 */
drop view if exists lotofacil.v_lotofacil_resultado_par_impar;
create view lotofacil.v_lotofacil_resultado_par_impar AS
  Select ltf_res.par_impar_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_par_impar ltf_res
  group by ltf_res.par_impar_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_par_impar_detalhado;
create view lotofacil.v_lotofacil_resultado_par_impar_detalhado AS
  Select ltf_res.par_impar_id, par, impar, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_par_impar ltf_res, lotofacil.lotofacil_id_par_impar ltf_id
    where ltf_res.par_impar_id = ltf_id.par_impar_id
  group by ltf_res.par_impar_id, par, impar
  order by qt_vezes desc;

/**
  Primo x Não-primo.
 */
drop view if exists lotofacil.v_lotofacil_resultado_primo;
create view lotofacil.v_lotofacil_resultado_primo AS
  Select ltf_res.prm_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_primo ltf_res
  group by ltf_res.prm_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_primo_detalhado;
create view lotofacil.v_lotofacil_resultado_primo_detalhado AS
  Select ltf_res.prm_id, primo, nao_primo, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_primo ltf_res, lotofacil.lotofacil_id_primo ltf_id
    where ltf_res.prm_id = ltf_id.prm_id
  group by ltf_res.prm_id, primo, nao_primo
  order by qt_vezes desc;


/**
  Horizontal.
 */

drop view if exists lotofacil.v_lotofacil_resultado_horizontal;
create view lotofacil.v_lotofacil_resultado_horizontal AS
  Select ltf_res.hrz_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_horizontal ltf_res
  group by ltf_res.hrz_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_horizontal_detalhado;
create view lotofacil.v_lotofacil_resultado_horizontal_detalhado AS
  Select ltf_res.hrz_id, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_horizontal ltf_res, lotofacil.lotofacil_id_horizontal ltf_id
    where ltf_res.hrz_id = ltf_id.hrz_id
  group by ltf_res.hrz_id, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5
  order by qt_vezes desc;


/**
  Vertical
 */

drop view if exists lotofacil.v_lotofacil_resultado_vertical;
create view lotofacil.v_lotofacil_resultado_vertical AS
  Select ltf_res.vrt_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_vertical ltf_res
  group by ltf_res.vrt_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_vertical_detalhado;
create view lotofacil.v_lotofacil_resultado_vertical_detalhado AS
  Select ltf_res.vrt_id, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_vertical ltf_res, lotofacil.lotofacil_id_vertical ltf_id
    where ltf_res.vrt_id = ltf_id.vrt_id
  group by ltf_res.vrt_id, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5
  order by qt_vezes desc;

/**
  Diagonal.
 */

drop view if exists lotofacil.v_lotofacil_resultado_diagonal;
create view lotofacil.v_lotofacil_resultado_diagonal AS
  Select ltf_res.dg_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_diagonal ltf_res
  group by ltf_res.dg_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_diagonal_detalhado;
create view lotofacil.v_lotofacil_resultado_diagonal_detalhado AS
  Select ltf_res.dg_id, dg_1, dg_2, dg_3, dg_4, dg_5, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_diagonal ltf_res, lotofacil.lotofacil_id_diagonal ltf_id
    where ltf_res.dg_id = ltf_id.dg_id
  group by ltf_res.dg_id, dg_1, dg_2, dg_3, dg_4, dg_5
  order by qt_vezes desc;

/**
  Diagonal.
 */
drop view if exists lotofacil.v_lotofacil_resultado_quarteto;
create view lotofacil.v_lotofacil_resultado_quarteto AS
  Select ltf_res.qrt_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_quarteto ltf_res
  group by ltf_res.qrt_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_quarteto_detalhado;
create view lotofacil.v_lotofacil_resultado_quarteto_detalhado AS
  Select ltf_res.qrt_id, qrt_1, qrt_2, qrt_3, qrt_4, qrt_5, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_quarteto ltf_res, lotofacil.lotofacil_id_quarteto ltf_id
    where ltf_res.qrt_id = ltf_id.qrt_id
  group by ltf_res.qrt_id, qrt_1, qrt_2, qrt_3, qrt_4, qrt_5
  order by qt_vezes desc;


/**
  Cruzeta
 */

drop view if exists lotofacil.v_lotofacil_resultado_cruzeta;
create view lotofacil.v_lotofacil_resultado_cruzeta AS
  Select ltf_res.crz_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_cruzeta ltf_res
  group by ltf_res.crz_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_cruzeta_detalhado;
create view lotofacil.v_lotofacil_resultado_cruzeta_detalhado AS
  Select ltf_res.crz_id, crz_1, crz_2, crz_3, crz_4, crz_5, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_cruzeta ltf_res, lotofacil.lotofacil_id_cruzeta ltf_id
    where ltf_res.crz_id = ltf_id.crz_id
  group by ltf_res.crz_id, crz_1, crz_2, crz_3, crz_4, crz_5
  order by qt_vezes desc;



/**
  Coluna b1
 */
Drop view if exists lotofacil.v_lotofacil_resultado_b1;
create view lotofacil.v_lotofacil_resultado_b1 AS
  Select ltf_res.b1_id, count(*) as qt_vezes from lotofacil.lotofacil_resultado_b1 ltf_res, lotofacil.lotofacil_id_b1 ltf_id
  where ltf_res.b1_id = ltf_id.b1_id
  group by ltf_res.b1_id
  order by qt_vezes desc;

Drop view if exists lotofacil.v_lotofacil_resultado_b1_b15;
create view lotofacil.v_lotofacil_resultado_b1_b15 AS
  Select ltf_res.b1_b15_id, count(*) as qt_vezes from lotofacil.lotofacil_resultado_b1_b15 ltf_res, lotofacil.lotofacil_id_b1_b15 ltf_id
  where ltf_res.b1_b15_id = ltf_id.b1_b15_id
  group by ltf_res.b1_b15_id
  order by qt_vezes desc;

Drop view if exists lotofacil.v_lotofacil_resultado_b1_b8_b15;
create view lotofacil.v_lotofacil_resultado_b1_b8_b15 AS
  Select ltf_res.b1_b8_b15_id, count(*) as qt_vezes from lotofacil.lotofacil_resultado_b1_b8_b15 ltf_res, lotofacil.lotofacil_id_b1_b8_b15 ltf_id
  where ltf_res.b1_b8_b15_id = ltf_id.b1_b8_b15_id
  group by ltf_res.b1_b8_b15_id
  order by qt_vezes desc;

Drop view if exists lotofacil.v_lotofacil_resultado_b1_b4_b8_b12_b15;
create view lotofacil.v_lotofacil_resultado_b1_b4_b8_b12_b15 AS
  Select ltf_res.b1_b4_b8_b12_b15_id, count(*) as qt_vezes from lotofacil.lotofacil_resultado_b1_b4_b8_b12_b15 ltf_res, lotofacil.lotofacil_id_b1_b4_b8_b12_b15 ltf_id
  where ltf_res.b1_b4_b8_b12_b15_id = ltf_id.b1_b4_b8_b12_b15_id
  group by ltf_res.b1_b4_b8_b12_b15_id
  order by qt_vezes desc;



/**
  Grupo 2
 */
Drop view if exists lotofacil.v_lotofacil_resultado_grupo_2bolas;
Create View lotofacil.v_lotofacil_resultado_grupo_2bolas AS
  Select bola1, bola2, count(*) as qt_vezes
    FROM lotofacil.lotofacil_id_grupo_2bolas ltf_grupo , lotofacil.lotofacil_resultado_grupo_2bolas ltf_res
  where ltf_res.grp_id = ltf_grupo.grp_id
  group by bola1, bola2
  order by qt_vezes desc;

Drop view if exists lotofacil.v_lotofacil_resultado_grupo_3bolas;
Create View lotofacil.v_lotofacil_resultado_grupo_3bolas AS
  Select bola1, bola2, bola3, count(*) as qt_vezes
    FROM lotofacil.lotofacil_id_grupo_3bolas ltf_grupo , lotofacil.lotofacil_resultado_grupo_3bolas ltf_res
  where ltf_res.grp_id = ltf_grupo.grp_id
  group by bola1, bola2, bola3
  order by qt_vezes desc;

Drop view if exists lotofacil.v_lotofacil_resultado_grupo_4bolas;
Create View lotofacil.v_lotofacil_resultado_grupo_4bolas AS
  Select bola1, bola2, bola3, bola4, count(*) as qt_vezes
    FROM lotofacil.lotofacil_id_grupo_4bolas ltf_grupo , lotofacil.lotofacil_resultado_grupo_4bolas ltf_res
  where ltf_res.grp_id = ltf_grupo.grp_id
  group by bola1, bola2, bola3, bola4
  order by qt_vezes desc;

Drop view if exists lotofacil.v_lotofacil_resultado_grupo_5bolas;
Create View lotofacil.v_lotofacil_resultado_grupo_5bolas AS
  Select bola1, bola2, bola3, bola4, bola5, count(*) as qt_vezes
    FROM lotofacil.lotofacil_id_grupo_5bolas ltf_grupo , lotofacil.lotofacil_resultado_grupo_5bolas ltf_res
  where ltf_res.grp_id = ltf_grupo.grp_id
  group by bola1, bola2, bola3, bola4, bola5
  order by qt_vezes desc;










