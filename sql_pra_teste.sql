Select num_83, count(*) as qt_vezes from lotomania.lotomania_resultado_num
  where num_83 = 1
GROUP BY num_83;


Delete from lotomania.lotomania_resultado_num;



copy lotomania.lotomania_resultado_num(concurso, data, num_0, num_1, num_2, num_3, num_4, num_5, num_6, num_7,
                                       num_8, num_9, num_10, num_11, num_12, num_13, num_14, num_15, num_16, num_17,
                                       num_18, num_19, num_20, num_21, num_22, num_23, num_24, num_25, num_26, num_27,
                                       num_28, num_29, num_30, num_31, num_32, num_33, num_34, num_35, num_36, num_37,
                                       num_38, num_39, num_40, num_41, num_42, num_43, num_44, num_45, num_46, num_47,
                                       num_48, num_49, num_50, num_51, num_52, num_53, num_54, num_55, num_56, num_57,
                                       num_58, num_59, num_60, num_61, num_62, num_63, num_64, num_65, num_66, num_67,
                                       num_68, num_69, num_70, num_71, num_72, num_73, num_74, num_75, num_76, num_77,
                                       num_78, num_79, num_80, num_81, num_82, num_83, num_84, num_85, num_86, num_87,
                                       num_88, num_89, num_90, num_91, num_92, num_93, num_94, num_95, num_96, num_97,
                                       num_98, num_99) FROM '/tmp/lotomania.csv'
with (FORMAT CSV, DELIMITER ';', HEADER true);


DELETE  from lotofacil.lotofacil_resultado_num;

copy lotofacil.lotofacil_resultado_num (concurso, data, num_1, num_2, num_3, num_4, num_5, num_6, num_7,
                                        num_8, num_9, num_10, num_11, num_12, num_13, num_14, num_15, num_16,
                                        num_17, num_18, num_19, num_20, num_21, num_22, num_23, num_24, num_25)  from
'/tmp/lotofacil_resultado.csv' with (format csv, DELIMITER ';', HEADER  true);


Select * from lotofacil.lotofacil_id_par_impar
order by lotofacil.lotofacil_id_par_impar.par_impar_id asc;

Select b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13, b_14, b_15, b_16, b_17, b_18
from lotofacil.lotofacil_bolas ltf_bolas, lotofacil.lotofacil_num ltf_num
where ltf_bolas.ltf_id = ltf_num.ltf_id and ltf_bolas.ltf_qt = ltf_num.ltf_qt
--and num_1 = 1 and num_2 = 1 and num_3 = 1 and num_4 = 1 and num_5 = 1 and num_6 = 1 and num_7 = 1
--and num_8 = 1 and num_9 = 1 and num_10 = 1 and num_11 = 1 and num_12 = 1 and num_13 = 1 and num_14 = 1
and num_7 = 1 and num_8 = 1 and num_9 = 1



