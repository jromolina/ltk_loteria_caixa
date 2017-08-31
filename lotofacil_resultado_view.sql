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
    lotofacil.lotofacil_resultado_horizontal ltf_res, lotofacil.lotofacil_horizontal_id ltf_id
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
    lotofacil.lotofacil_resultado_vertical ltf_res, lotofacil.lotofacil_vertical_id ltf_id
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
    lotofacil.lotofacil_resultado_diagonal ltf_res, lotofacil.lotofacil_diagonal_id ltf_id
    where ltf_res.dg_id = ltf_id.dg_id
  group by ltf_res.dg_id, dg_1, dg_2, dg_3, dg_4, dg_5
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
    lotofacil.lotofacil_resultado_cruzeta ltf_res, lotofacil.lotofacil_cruzeta_id ltf_id
    where ltf_res.crz_id = ltf_id.crz_id
  group by ltf_res.crz_id, crz_1, crz_2, crz_3, crz_4, crz_5
  order by qt_vezes desc;


drop view if exists lotofacil.v_lotofacil_resultado_externo_interno;
create view lotofacil.v_lotofacil_resultado_externo_interno AS
  Select ltf_res.ext_id, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_externo_interno ltf_res
  group by ltf_res.ext_id
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_externo_interno_detalhado;
create view lotofacil.v_lotofacil_resultado_externo_interno_detalhado AS
  Select ltf_res.ext_id, externo, interno, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_externo_interno ltf_res, lotofacil.lotofacil_externo_interno_id ltf_id
    where ltf_res.ext_id = ltf_id.ext_id
  group by ltf_res.ext_id, externo, interno
  order by qt_vezes desc;

drop view if exists lotofacil.v_lotofacil_resultado_par_impar;
create view lotofacil.v_lotofacil_resultado_par_impar AS
  Select ltf_res.par, ltf_res.impar, count(*) qt_vezes FROM
    lotofacil.lotofacil_resultado_par_impar ltf_res
  group by ltf_res.par, ltf_res.impar
  order by qt_vezes desc;




