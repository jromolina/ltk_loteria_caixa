/**
  Scripts de criação das tabelas, triggers e função necessários para analisar jogo da loteria da caixa de nome Lotomania.
  Autor: Fábio Moura de Oliveira.
  Data: 28/08/2017
  Toda as tabelas tem restrições, evitando que a mesma tenha dados que torna a relação entre tabelas inválidas.

  O nome das tabelas é baseado na descrição dentro do arquivo lotomania.xlsx.
 */
drop table if exists lotomania.lotomania_resultado_num;
CREATE TABLE lotomania.lotomania_resultado_num (
  concurso         NUMERIC      NOT NULL,
  data             DATE         NOT NULL,

  num_0                    NUMERIC DEFAULT 0 check (num_0 in (0, 1)),
  num_1                    NUMERIC DEFAULT 0 check (num_1 in (0, 1)),
  num_2                    NUMERIC DEFAULT 0 check (num_2 in (0, 1)),
  num_3                    NUMERIC DEFAULT 0 check (num_3 in (0, 1)),
  num_4                    NUMERIC DEFAULT 0 check (num_4 in (0, 1)),
  num_5                    NUMERIC DEFAULT 0 check (num_5 in (0, 1)),
  num_6                    NUMERIC DEFAULT 0 check (num_6 in (0, 1)),
  num_7                    NUMERIC DEFAULT 0 check (num_7 in (0, 1)),
  num_8                    NUMERIC DEFAULT 0 check (num_8 in (0, 1)),
  num_9                    NUMERIC DEFAULT 0 check (num_9 in (0, 1)),
  num_10                   NUMERIC DEFAULT 0 check (num_10 in (0, 1)),
  num_11                   NUMERIC DEFAULT 0 check (num_11 in (0, 1)),
  num_12                   NUMERIC DEFAULT 0 check (num_12 in (0, 1)),
  num_13                   NUMERIC DEFAULT 0 check (num_13 in (0, 1)),
  num_14                   NUMERIC DEFAULT 0 check (num_14 in (0, 1)),
  num_15                   NUMERIC DEFAULT 0 check (num_15 in (0, 1)),
  num_16                   NUMERIC DEFAULT 0 check (num_16 in (0, 1)),
  num_17                   NUMERIC DEFAULT 0 check (num_17 in (0, 1)),
  num_18                   NUMERIC DEFAULT 0 check (num_18 in (0, 1)),
  num_19                   NUMERIC DEFAULT 0 check (num_19 in (0, 1)),
  num_20                   NUMERIC DEFAULT 0 check (num_20 in (0, 1)),
  num_21                   NUMERIC DEFAULT 0 check (num_21 in (0, 1)),
  num_22                   NUMERIC DEFAULT 0 check (num_22 in (0, 1)),
  num_23                   NUMERIC DEFAULT 0 check (num_23 in (0, 1)),
  num_24                   NUMERIC DEFAULT 0 check (num_24 in (0, 1)),
  num_25                   NUMERIC DEFAULT 0 check (num_25 in (0, 1)),
  num_26                   NUMERIC DEFAULT 0 check (num_26 in (0, 1)),
  num_27                   NUMERIC DEFAULT 0 check (num_27 in (0, 1)),
  num_28                   NUMERIC DEFAULT 0 check (num_28 in (0, 1)),
  num_29                   NUMERIC DEFAULT 0 check (num_29 in (0, 1)),
  num_30                   NUMERIC DEFAULT 0 check (num_30 in (0, 1)),
  num_31                   NUMERIC DEFAULT 0 check (num_31 in (0, 1)),
  num_32                   NUMERIC DEFAULT 0 check (num_32 in (0, 1)),
  num_33                   NUMERIC DEFAULT 0 check (num_33 in (0, 1)),
  num_34                   NUMERIC DEFAULT 0 check (num_34 in (0, 1)),
  num_35                   NUMERIC DEFAULT 0 check (num_35 in (0, 1)),
  num_36                   NUMERIC DEFAULT 0 check (num_36 in (0, 1)),
  num_37                   NUMERIC DEFAULT 0 check (num_37 in (0, 1)),
  num_38                   NUMERIC DEFAULT 0 check (num_38 in (0, 1)),
  num_39                   NUMERIC DEFAULT 0 check (num_39 in (0, 1)),
  num_40                   NUMERIC DEFAULT 0 check (num_40 in (0, 1)),
  num_41                   NUMERIC DEFAULT 0 check (num_41 in (0, 1)),
  num_42                   NUMERIC DEFAULT 0 check (num_42 in (0, 1)),
  num_43                   NUMERIC DEFAULT 0 check (num_43 in (0, 1)),
  num_44                   NUMERIC DEFAULT 0 check (num_44 in (0, 1)),
  num_45                   NUMERIC DEFAULT 0 check (num_45 in (0, 1)),
  num_46                   NUMERIC DEFAULT 0 check (num_46 in (0, 1)),
  num_47                   NUMERIC DEFAULT 0 check (num_47 in (0, 1)),
  num_48                   NUMERIC DEFAULT 0 check (num_48 in (0, 1)),
  num_49                   NUMERIC DEFAULT 0 check (num_49 in (0, 1)),
  num_50                   NUMERIC DEFAULT 0 check (num_50 in (0, 1)),
  num_51                   NUMERIC DEFAULT 0 check (num_51 in (0, 1)),
  num_52                   NUMERIC DEFAULT 0 check (num_52 in (0, 1)),
  num_53                   NUMERIC DEFAULT 0 check (num_53 in (0, 1)),
  num_54                   NUMERIC DEFAULT 0 check (num_54 in (0, 1)),
  num_55                   NUMERIC DEFAULT 0 check (num_55 in (0, 1)),
  num_56                   NUMERIC DEFAULT 0 check (num_56 in (0, 1)),
  num_57                   NUMERIC DEFAULT 0 check (num_57 in (0, 1)),
  num_58                   NUMERIC DEFAULT 0 check (num_58 in (0, 1)),
  num_59                   NUMERIC DEFAULT 0 check (num_59 in (0, 1)),
  num_60                   NUMERIC DEFAULT 0 check (num_60 in (0, 1)),
  num_61                   NUMERIC DEFAULT 0 check (num_61 in (0, 1)),
  num_62                   NUMERIC DEFAULT 0 check (num_62 in (0, 1)),
  num_63                   NUMERIC DEFAULT 0 check (num_63 in (0, 1)),
  num_64                   NUMERIC DEFAULT 0 check (num_64 in (0, 1)),
  num_65                   NUMERIC DEFAULT 0 check (num_65 in (0, 1)),
  num_66                   NUMERIC DEFAULT 0 check (num_66 in (0, 1)),
  num_67                   NUMERIC DEFAULT 0 check (num_67 in (0, 1)),
  num_68                   NUMERIC DEFAULT 0 check (num_68 in (0, 1)),
  num_69                   NUMERIC DEFAULT 0 check (num_69 in (0, 1)),
  num_70                   NUMERIC DEFAULT 0 check (num_70 in (0, 1)),
  num_71                   NUMERIC DEFAULT 0 check (num_71 in (0, 1)),
  num_72                   NUMERIC DEFAULT 0 check (num_72 in (0, 1)),
  num_73                   NUMERIC DEFAULT 0 check (num_73 in (0, 1)),
  num_74                   NUMERIC DEFAULT 0 check (num_74 in (0, 1)),
  num_75                   NUMERIC DEFAULT 0 check (num_75 in (0, 1)),
  num_76                   NUMERIC DEFAULT 0 check (num_76 in (0, 1)),
  num_77                   NUMERIC DEFAULT 0 check (num_77 in (0, 1)),
  num_78                   NUMERIC DEFAULT 0 check (num_78 in (0, 1)),
  num_79                   NUMERIC DEFAULT 0 check (num_79 in (0, 1)),
  num_80                   NUMERIC DEFAULT 0 check (num_80 in (0, 1)),
  num_81                   NUMERIC DEFAULT 0 check (num_81 in (0, 1)),
  num_82                   NUMERIC DEFAULT 0 check (num_82 in (0, 1)),
  num_83                   NUMERIC DEFAULT 0 check (num_83 in (0, 1)),
  num_84                   NUMERIC DEFAULT 0 check (num_84 in (0, 1)),
  num_85                   NUMERIC DEFAULT 0 check (num_85 in (0, 1)),
  num_86                   NUMERIC DEFAULT 0 check (num_86 in (0, 1)),
  num_87                   NUMERIC DEFAULT 0 check (num_87 in (0, 1)),
  num_88                   NUMERIC DEFAULT 0 check (num_88 in (0, 1)),
  num_89                   NUMERIC DEFAULT 0 check (num_89 in (0, 1)),
  num_90                   NUMERIC DEFAULT 0 check (num_90 in (0, 1)),
  num_91                   NUMERIC DEFAULT 0 check (num_91 in (0, 1)),
  num_92                   NUMERIC DEFAULT 0 check (num_92 in (0, 1)),
  num_93                   NUMERIC DEFAULT 0 check (num_93 in (0, 1)),
  num_94                   NUMERIC DEFAULT 0 check (num_94 in (0, 1)),
  num_95                   NUMERIC DEFAULT 0 check (num_95 in (0, 1)),
  num_96                   NUMERIC DEFAULT 0 check (num_96 in (0, 1)),
  num_97                   NUMERIC DEFAULT 0 check (num_97 in (0, 1)),
  num_98                   NUMERIC DEFAULT 0 check (num_98 in (0, 1)),
  num_99                   NUMERIC DEFAULT 0 check (num_99 in (0, 1)),

  CONSTRAINT soma_0_a_99_check check (
    (num_1 + num_2  + num_3  + num_4  + num_5  + num_6  + num_7  + num_8  + num_9  + num_10 +
    num_11 + num_12 + num_13 + num_14 + num_15 + num_16 + num_17 + num_18 + num_19 + num_20 +
    num_21 + num_22 + num_23 + num_24 + num_25 + num_26 + num_27 + num_28 + num_29 + num_30 +
    num_31 + num_32 + num_33 + num_34 + num_35 + num_36 + num_37 + num_38 + num_39 + num_40 +
    num_41 + num_42 + num_43 + num_44 + num_45 + num_46 + num_47 + num_48 + num_49 + num_50 +
    num_51 + num_52 + num_53 + num_54 + num_55 + num_56 + num_57 + num_58 + num_59 + num_60 +
    num_61 + num_62 + num_63 + num_64 + num_65 + num_66 + num_67 + num_68 + num_69 + num_70 +
    num_71 + num_72 + num_73 + num_74 + num_75 + num_76 + num_77 + num_78 + num_79 + num_80 +
    num_81 + num_82 + num_83 + num_84 + num_85 + num_86 + num_87 + num_88 + num_89 + num_90 +
    num_91 + num_92 + num_93 + num_94 + num_95 + num_96 + num_97 + num_98 + num_99 + num_0) = 20),

  CONSTRAINT lotomania_resultado_pk PRIMARY KEY (concurso)
);
comment on table lotomania.lotomania_resultado_num is
'Esta é a tabela inicial, que são armazenados os resultados da lotomania, '
'os campos num_0 a num_99 corresponde respectivamentes às bolas 0 a 99 do lotomania,'
'o campo terá o valor 1, se a bola foi sorteada, 0 (zero) caso contrário.'
'Tem que ser sorteado 20 números, senão a restrição de verificação não irá deixar inserir o registro.';

drop TABLE if exists lotomania.lotomania_resultado_bolas;
create table lotomania.lotomania_resultado_bolas(
  concurso numeric not null,
  
  b_1                    NUMERIC DEFAULT 0 ,
  b_2                    NUMERIC DEFAULT 0 ,
  b_3                    NUMERIC DEFAULT 0 ,
  b_4                    NUMERIC DEFAULT 0 ,
  b_5                    NUMERIC DEFAULT 0 ,
  b_6                    NUMERIC DEFAULT 0 ,
  b_7                    NUMERIC DEFAULT 0 ,
  b_8                    NUMERIC DEFAULT 0 ,
  b_9                    NUMERIC DEFAULT 0 ,
  b_10                   NUMERIC DEFAULT 0 ,
  b_11                   NUMERIC DEFAULT 0 ,
  b_12                   NUMERIC DEFAULT 0 ,
  b_13                   NUMERIC DEFAULT 0 ,
  b_14                   NUMERIC DEFAULT 0 ,
  b_15                   NUMERIC DEFAULT 0 ,
  b_16                   NUMERIC DEFAULT 0 ,
  b_17                   NUMERIC DEFAULT 0 ,
  b_18                   NUMERIC DEFAULT 0 ,
  b_19                   NUMERIC DEFAULT 0 ,
  b_20                   NUMERIC DEFAULT 0 ,

  CONSTRAINT lotomania_resultado_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotomania_resultado_bolas_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on UPDATE cascade on DELETE cascade,
  CONSTRAINT lotomania_resultado_bolas_chk CHECK (
    (b_1 < b_2) AND
    (b_2 < b_3) AND
    (b_3 < b_4) AND
    (b_4 < b_5) AND
    (b_5 < b_6) AND
    (b_6 < b_7) AND
    (b_7 < b_8) AND
    (b_8 < b_9) AND
    (b_9 < b_10) AND
    (b_10 < b_11) AND
    (b_11 < b_12) AND
    (b_12 < b_13) AND
    (b_13 < b_14) AND
    (b_14 < b_15) AND
    (b_15 < b_16) AND
    (b_16 < b_17) AND
    (b_17 < b_18) AND
    (b_18 < b_19) AND
    (b_19 < b_20)
  )
);

drop table if exists lotomania.lotomania_resultado_par_impar;
create TABLE lotomania.lotomania_resultado_par_impar(
  concurso numeric not null,
  qt_pares numeric not null,
  qt_impares numeric not null, 
  
  CONSTRAINT lotomania_resultado_par_impar_chk check((qt_pares + qt_impares) = 20),
  CONSTRAINT lotomania_resultado_par_impar_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on UPDATE cascade on DELETE cascade
);

drop table if exists lotomania.lotomania_resultado_horizontal;
create table lotomania.lotomania_resultado_horizontal(
  concurso numeric not null,
  hrz_1 numeric not null,
  hrz_2 numeric not null,
  hrz_3 numeric not null,
  hrz_4 numeric not null,
  hrz_5 numeric not null,

  CONSTRAINT lotomania_resultado_horizontal_chk check((hrz_1 + hrz_2 + hrz_3 + hrz_4 + hrz_5) = 20),
  CONSTRAINT lotomania_resultado_horizontal_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if exists lotomania.lotomania_resultado_vertical;
create table lotomania.lotomania_resultado_vertical(
  concurso numeric not null,
  vrt_1 numeric not null,
  vrt_2 numeric not null,
  vrt_3 numeric not null,
  vrt_4 numeric not null,
  vrt_5 numeric not null,

  CONSTRAINT lotomania_resultado_vertical_chk check((vrt_1 + vrt_2 + vrt_3 + vrt_4 + vrt_5) = 20),
  CONSTRAINT lotomania_resultado_vertical_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if exists lotomania.lotomania_resultado_metade_horizontal;
create table lotomania.lotomania_resultado_metade_horizontal(
  concurso numeric not null,
  met_hrz_1 numeric not null,
  met_hrz_2 numeric not null,

  CONSTRAINT lotomania_resultado_metade_horizontal_chk check((met_hrz_1 + met_hrz_2) = 20),
  CONSTRAINT lotomania_resultado_metade_horizontal_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if exists lotomania.lotomania_resultado_metade_vertical;
create table lotomania.lotomania_resultado_metade_vertical(
  concurso numeric not null,
  met_vrt_1 numeric not null,
  met_vrt_2 numeric not null,

  CONSTRAINT lotomania_resultado_metade_vertical_chk check((met_vrt_1 + met_vrt_2) = 20),
  CONSTRAINT lotomania_resultado_metade_vertical_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if exists lotomania.lotomania_resultado_grupo_com_4;
create table lotomania.lotomania_resultado_grupo_com_4(
  concurso numeric not null,
  grp_1                    NUMERIC DEFAULT 0 check (grp_1 in (0, 1, 2, 3, 4)),
  grp_2                    NUMERIC DEFAULT 0 check (grp_2 in (0, 1, 2, 3, 4)),
  grp_3                    NUMERIC DEFAULT 0 check (grp_3 in (0, 1, 2, 3, 4)),
  grp_4                    NUMERIC DEFAULT 0 check (grp_4 in (0, 1, 2, 3, 4)),
  grp_5                    NUMERIC DEFAULT 0 check (grp_5 in (0, 1, 2, 3, 4)),
  grp_6                    NUMERIC DEFAULT 0 check (grp_6 in (0, 1, 2, 3, 4)),
  grp_7                    NUMERIC DEFAULT 0 check (grp_7 in (0, 1, 2, 3, 4)),
  grp_8                    NUMERIC DEFAULT 0 check (grp_8 in (0, 1, 2, 3, 4)),
  grp_9                    NUMERIC DEFAULT 0 check (grp_9 in (0, 1, 2, 3, 4)),
  grp_10                   NUMERIC DEFAULT 0 check (grp_10 in (0, 1, 2, 3, 4)),
  grp_11                   NUMERIC DEFAULT 0 check (grp_11 in (0, 1, 2, 3, 4)),
  grp_12                   NUMERIC DEFAULT 0 check (grp_12 in (0, 1, 2, 3, 4)),
  grp_13                   NUMERIC DEFAULT 0 check (grp_13 in (0, 1, 2, 3, 4)),
  grp_14                   NUMERIC DEFAULT 0 check (grp_14 in (0, 1, 2, 3, 4)),
  grp_15                   NUMERIC DEFAULT 0 check (grp_15 in (0, 1, 2, 3, 4)),
  grp_16                   NUMERIC DEFAULT 0 check (grp_16 in (0, 1, 2, 3, 4)),
  grp_17                   NUMERIC DEFAULT 0 check (grp_17 in (0, 1, 2, 3, 4)),
  grp_18                   NUMERIC DEFAULT 0 check (grp_18 in (0, 1, 2, 3, 4)),
  grp_19                   NUMERIC DEFAULT 0 check (grp_19 in (0, 1, 2, 3, 4)),
  grp_20                   NUMERIC DEFAULT 0 check (grp_20 in (0, 1, 2, 3, 4)),
  grp_21                   NUMERIC DEFAULT 0 check (grp_21 in (0, 1, 2, 3, 4)),
  grp_22                   NUMERIC DEFAULT 0 check (grp_22 in (0, 1, 2, 3, 4)),
  grp_23                   NUMERIC DEFAULT 0 check (grp_23 in (0, 1, 2, 3, 4)),
  grp_24                   NUMERIC DEFAULT 0 check (grp_24 in (0, 1, 2, 3, 4)),
  grp_25                   NUMERIC DEFAULT 0 check (grp_25 in (0, 1, 2, 3, 4)),
  
  CONSTRAINT lotomania_resultado_grupo_com_4_pk PRIMARY KEY (concurso),
  CONSTRAINT lotomania_resultado_grupo_com_4_chk CHECK (grp_1 + grp_2  + grp_3  + grp_4  + grp_5  + grp_6  + grp_7  +
                                                         grp_8  + grp_9  + grp_10 +
    grp_11 + grp_12 + grp_13 + grp_14 + grp_15 + grp_16 + grp_17 + grp_18 + grp_19 + grp_20 +
    grp_21 + grp_22 + grp_23 + grp_24 + grp_25 = 20),
  CONSTRAINT lotomania_resultado_grupo_com_4_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num (concurso)
);
comment on table lotomania.lotomania_resultado_grupo_com_4 IS
'Armazena a quantidade de bolas que foram sorteados em cada grupo';


drop table if exists lotomania.lotomania_resultado_quadrante;
create table lotomania.lotomania_resultado_quadrante(
  concurso numeric not null,
  qd_1 numeric not null,
  qd_2 numeric not null,
  qd_3 numeric not null,
  qd_4 numeric not null,

  CONSTRAINT lotomania_resultado_quadrante_chk check((qd_1 + qd_2 + qd_3 + qd_4) = 20),
  CONSTRAINT lotomania_resultado_quadrante_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if exists lotomania.lotomania_resultado_triangular;
create table lotomania.lotomania_resultado_triangular(
  concurso numeric not null,
  tr_1 numeric not null,
  tr_2 numeric not null,
  tr_3 numeric not null,
  tr_4 numeric not null,

  CONSTRAINT lotomania_resultado_triangular_chk check((tr_1 + tr_2 + tr_3 + tr_4) = 20),
  CONSTRAINT lotomania_resultado_triangular_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if EXISTS lotomania.lotomania_resultado_losangular;
create table lotomania.lotomania_resultado_losangular(
  concurso numeric not null,
  ls_1 numeric not null,
  ls_2 numeric not null,
  ls_3 numeric not null,
  ls_4 numeric not null,
  ls_5 numeric not null,
  ls_6 numeric not null,

  CONSTRAINT lotomania_resultado_losangular_chk check((ls_1 + ls_2 + ls_3 + ls_4 + ls_5 + ls_6) = 20),
  CONSTRAINT lotomania_resultado_losangular_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);

drop table if exists lotomania.lotomania_resultado_estrelar;
create table lotomania.lotomania_resultado_estrelar(
  concurso numeric not null,
  st_1 numeric not null,
  st_2 numeric not null,
  st_3 numeric not null,
  st_4 numeric not null,
  st_5 numeric not null,
  st_6 numeric not null,
  st_7 numeric not null,
  st_8 numeric not null,

  CONSTRAINT lotomania_resultado_estrelar_chk check((st_1 + st_2 + st_3 + st_4 + st_5 + st_6 + st_7 + st_8) = 20),
  CONSTRAINT lotomania_resultado_estrelar_fk FOREIGN KEY (concurso) REFERENCES lotomania.lotomania_resultado_num(concurso)
  on update cascade on delete cascade
);





