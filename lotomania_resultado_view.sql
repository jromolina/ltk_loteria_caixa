Drop view if exists lotomania.v_lotomania_resultado_par_impar;
Create View lotomania.v_lotomania_resultado_par_impar as
  Select qt_pares, qt_impares, count(*) as qt_vezes FROM lotomania.lotomania_resultado_par_impar
  group by qt_pares, qt_impares
  order by qt_vezes desc, qt_pares, qt_impares;

Drop view if exists lotomania.v_lotomania_resultado_quadrante;
Create View lotomania.v_lotomania_resultado_quadrante AS
  Select qd_1, qd_2, qd_3, qd_4, count(*) as qt_vezes from lotomania.lotomania_resultado_quadrante
  group by qd_1, qd_2, qd_3, qd_4
  order by qt_vezes desc, qd_1, qd_2, qd_3, qd_4;

Drop view if exists lotomania.v_lotomania_resultado_grupo_com_4;
Create View lotomania.v_lotomania_resultado_grupo_com_4 AS
  Select grp_1, grp_2, grp_3, grp_4, grp_5,grp_6, grp_7, grp_8, grp_9, grp_10, grp_11,
    grp_12, grp_13, grp_14, grp_15, grp_16, grp_17,
    grp_18, grp_19, grp_20, grp_21, grp_22, grp_23,
    grp_24, grp_25, count(*) as qt_vezes    from lotomania.lotomania_resultado_grupo_com_4
  group by grp_1, grp_2, grp_3, grp_4, grp_5,grp_6, grp_7, grp_8, grp_9, grp_10, grp_11,
    grp_12, grp_13, grp_14, grp_15, grp_16, grp_17,
    grp_18, grp_19, grp_20, grp_21, grp_22, grp_23,
    grp_24, grp_25
  order by qt_vezes desc, grp_1, grp_2, grp_3, grp_4, grp_5,grp_6, grp_7, grp_8, grp_9, grp_10, grp_11,
    grp_12, grp_13, grp_14, grp_15, grp_16, grp_17,
    grp_18, grp_19, grp_20, grp_21, grp_22, grp_23,
    grp_24, grp_25;

Drop view if exists lotomania.v_lotomania_resultado_grupo_com_4_agrupado;
Create View lotomania.v_lotomania_resultado_grupo_com_4_agrupado AS
  (SELECT
     'grp_1' AS grupo,
     grp_1,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_1
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_2' AS grupo,
     grp_2,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_2
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_3' AS grupo,
     grp_3,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_3
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_4' AS grupo,
     grp_4,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_4
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_5' AS grupo,
     grp_5,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_5
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_6' AS grupo,
     grp_6,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_6
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_7' AS grupo,
     grp_7,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_7
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_8' AS grupo,
     grp_8,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_8
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_9' AS grupo,
     grp_9,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_9
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_10' AS grupo,
     grp_10,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_10
   ORDER BY qt_vezes
   
  ) union ALL 
    (SELECT
     'grp_11' AS grupo,
     grp_11,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_11
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_12' AS grupo,
     grp_12,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_12
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_13' AS grupo,
     grp_13,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_13
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_14' AS grupo,
     grp_14,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_14
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_15' AS grupo,
     grp_15,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_15
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_16' AS grupo,
     grp_16,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_16
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_17' AS grupo,
     grp_17,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_17
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_18' AS grupo,
     grp_18,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_18
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_19' AS grupo,
     grp_19,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_19
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_20' AS grupo,
     grp_20,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_20
   ORDER BY qt_vezes
   
  ) union ALL 
       (SELECT
     'grp_21' AS grupo,
     grp_21,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_21
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_22' AS grupo,
     grp_22,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_22
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_23' AS grupo,
     grp_23,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_23
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_24' AS grupo,
     grp_24,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_24
   ORDER BY qt_vezes
   
  ) union ALL 
   (SELECT
     'grp_25' AS grupo,
     grp_25,
     count(*)   qt_vezes
   FROM lotomania.v_lotomania_resultado_grupo_com_4
   GROUP BY grupo, grp_25
   ORDER BY qt_vezes
  );


      
  

