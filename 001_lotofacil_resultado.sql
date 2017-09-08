/**
  Scripts sql de criação de tabelas pra análise do jogo da lotofacil da caixa.
  Eu já havia criado as tabelas, mas agora, está otimizada.

 */

/**
  Apaga as views, pois ela depende das tabelas deste arquivo.
 */
drop view if exists lotofacil.v_lotofacil_resultado_horizontal;
drop view if exists lotofacil.v_lotofacil_resultado_horizontal_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_vertical;
drop view if exists lotofacil.v_lotofacil_resultado_vertical_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_diagonal;
drop view if exists lotofacil.v_lotofacil_resultado_diagonal_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_cruzeta;
drop view if exists lotofacil.v_lotofacil_resultado_cruzeta_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_externo_interno;
drop view if exists lotofacil.v_lotofacil_resultado_externo_interno_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_quarteto;
drop view if exists lotofacil.v_lotofacil_resultado_quarteto_detalhado;



drop view if exists lotofacil.v_lotofacil_resultado_par_impar;
drop view if exists lotofacil.v_lotofacil_resultado_par_impar_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_b1;
drop view if exists lotofacil.v_lotofacil_resultado_b1_b15;
drop view if exists lotofacil.v_lotofacil_resultado_b1_b8_b15;
drop view if exists lotofacil.v_lotofacil_resultado_b1_b4_b8_b12_b15;

drop view if exists lotofacil.v_lotofacil_resultado_grupo2bolas;
drop view if exists lotofacil.v_lotofacil_resultado_grupo3bolas;
drop view if exists lotofacil.v_lotofacil_resultado_grupo4bolas;
drop view if exists lotofacil.v_lotofacil_resultado_grupo5bolas;

drop view if exists lotofacil.v_lotofacil_grupo_2bolas;
drop view if exists lotofacil.v_lotofacil_grupo_3bolas;
drop view if exists lotofacil.v_lotofacil_grupo_4bolas;
drop view if exists lotofacil.v_lotofacil_grupo_5bolas;

drop table if exists lotofacil.lotofacil_resultado_grupo_2bolas;
drop table if exists lotofacil.lotofacil_resultado_grupo_3bolas;
drop table if exists lotofacil.lotofacil_resultado_grupo_4bolas;
drop table if exists lotofacil.lotofacil_resultado_grupo_5bolas;


/**
  Apaga as tabelas de colunas b.
 */
drop table if exists lotofacil.lotofacil_resultado_b1;
drop table if exists lotofacil.lotofacil_resultado_b1_b15;
drop table if exists lotofacil.lotofacil_resultado_b1_b8_b15;
drop table if exists lotofacil.lotofacil_resultado_b1_b4_b8_b12_b15;


drop TABLE if exists lotofacil.lotofacil_resultado_bolas;
drop table if exists lotofacil.lotofacil_resultado_par_impar;
drop table if exists lotofacil.lotofacil_resultado_externo_interno;
drop table if exists lotofacil.lotofacil_resultado_horizontal;
drop table if exists lotofacil.lotofacil_resultado_vertical;
drop table if exists lotofacil.lotofacil_resultado_diagonal;
drop table if exists lotofacil.lotofacil_resultado_cruzeta;
drop table if exists lotofacil.lotofacil_resultado_quarteto;
drop table if exists lotofacil.lotofacil_resultado_num;

/**
  Esta é a tabela, onde os dados serão inseridos na tabela, as demais tabelas
  serão inseridos conforme os dados são inseridas aqui.
 */
drop table if exists lotofacil.lotofacil_resultado_num;
CREATE TABLE lotofacil.lotofacil_resultado_num (
  ltf_id          numeric default null,
  concurso         NUMERIC      NOT NULL,
  data             DATE         NOT NULL,

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

  CONSTRAINT lotofacil_resultado_num_chk check (
    (num_1 + num_2  + num_3  + num_4  + num_5  + num_6  + num_7  + num_8  + num_9  + num_10 +
    num_11 + num_12 + num_13 + num_14 + num_15 + num_16 + num_17 + num_18 + num_19 + num_20 +
    num_21 + num_22 + num_23 + num_24 + num_25 ) = 15),

  CONSTRAINT lotofacil_resultado_pk PRIMARY KEY (concurso),

  constraint lotofacil_resultado_fk FOREIGN KEY (ltf_id) references lotofacil.lotofacil_num(ltf_id)
);
comment on table lotofacil.lotofacil_resultado_num is
'Esta é a tabela inicial, que são armazenados os resultados da lotofacil, '
'os campos num_0 a num_99 corresponde respectivamentes às bolas 0 a 99 do lotofacil,'
'o campo terá o valor 1, se a bola foi sorteada, 0 (zero) caso contrário.'
'Tem que ser sorteado 20 números, senão a restrição de verificação não irá deixar inserir o registro.';

-- alter table lotofacil.lotofacil_resultado_num alter column ltf_id set default null;
-- ALTER TABLE lotofacil.lotofacil_resultado_bolas ALTER COLUMN ltf_id DROP NOT NULL;
alter table lotofacil.lotofacil_resultado_num drop CONSTRAINT lotofacil_resultado_fk;




drop TABLE if exists lotofacil.lotofacil_resultado_bolas;
create table lotofacil.lotofacil_resultado_bolas(
  ltf_id numeric default null,
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

  CONSTRAINT lotofacil_resultado_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_bolas_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on UPDATE cascade on DELETE cascade,
  CONSTRAINT lotofacil_resultado_bolas_chk CHECK (
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
    (b_14 < b_15)
  )
);

drop table if exists lotofacil.lotofacil_resultado_par_impar;
create table lotofacil.lotofacil_resultado_par_impar(
  concurso numeric not null,
  par_impar_id numeric not null,
  CONSTRAINT lotofacil_resultado_par_impar_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_par_impar_pk PRIMARY KEY (concurso, par_impar_id)
);

drop table if exists lotofacil.lotofacil_resultado_externo_interno;
create table lotofacil.lotofacil_resultado_externo_interno(
  concurso numeric not null,
  ext_id numeric not null,
  int_id numeric not null,
  CONSTRAINT lotofacil_resultado_externo_interno_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_externo_interno_pk PRIMARY KEY (concurso, ext_id, int_id)
);

drop table if exists lotofacil.lotofacil_resultado_horizontal;
create table lotofacil.lotofacil_resultado_horizontal(
  concurso numeric not null,
  hrz_id numeric not null,
  CONSTRAINT lotofacil_resultado_horizontal_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_horizontal_pk PRIMARY KEY (concurso, hrz_id)
);

drop table if exists lotofacil.lotofacil_resultado_vertical;
create table lotofacil.lotofacil_resultado_vertical(
  concurso numeric not null,
  vrt_id numeric not null,
  CONSTRAINT lotofacil_resultado_vertical_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_vertical_pk PRIMARY KEY (concurso, vrt_id)
);

drop table if exists lotofacil.lotofacil_resultado_diagonal;
create table lotofacil.lotofacil_resultado_diagonal(
  concurso numeric not null,
  dg_id numeric not null,
  CONSTRAINT lotofacil_resultado_diagonal_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_diagonal_pk PRIMARY KEY (concurso, dg_id)
);

drop table if exists lotofacil.lotofacil_resultado_cruzeta;
create table lotofacil.lotofacil_resultado_cruzeta(
  concurso numeric not null,
  crz_id numeric not null,
  CONSTRAINT lotofacil_resultado_cruzeta_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_cruzeta_pk PRIMARY KEY (concurso, crz_id)
);

/**
  Quarteto:
    São 4 bolas, por grupo, o último grupo tem 5.
 */

drop table if exists lotofacil.lotofacil_resultado_quarteto;
create table lotofacil.lotofacil_resultado_quarteto(
  concurso numeric not null,
  qrt_id numeric not null,
  CONSTRAINT lotofacil_resultado_quarteto_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_quarteto_pk PRIMARY KEY (concurso, qrt_id)
);


/**
  Coluna b1, indica a coluna com a menor bola.
  As bolas são disposta em ordem crescente.
 */
drop table if exists lotofacil.lotofacil_resultado_b1;
create table lotofacil.lotofacil_resultado_b1(
  concurso numeric not null,
  b1_id numeric not null,
  CONSTRAINT lotofacil_resultado_b1_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_b1_pk PRIMARY KEY (concurso, b1_id)
);

/**
  Coluna b1, indica a coluna com a menor bola.
  Coluna b15, indica a última coluna com a maior bola do concurso.
  As bolas são disposta em ordem crescente.
 */
drop table if exists lotofacil.lotofacil_resultado_b1_b15;
create table lotofacil.lotofacil_resultado_b1_b15(
  concurso numeric not null,
  b1_b15_id numeric not null,
  CONSTRAINT lotofacil_resultado_b1_b15_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_b1_b15_pk PRIMARY KEY (concurso, b1_b15_id)
);


drop table if exists lotofacil.lotofacil_resultado_b1_b8_b15;
create table lotofacil.lotofacil_resultado_b1_b8_b15(
  concurso numeric not null,
  b1_b8_b15_id numeric not null,
  CONSTRAINT lotofacil_resultado_b1_b8_b15_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_b1_b8_b15_pk PRIMARY KEY (concurso, b1_b8_b15_id)
);

drop table if exists lotofacil.lotofacil_resultado_b1_b4_b8_b12_b15;
create table lotofacil.lotofacil_resultado_b1_b4_b8_b12_b15(
  concurso numeric not null,
  b1_b4_b8_b12_b15_id numeric not null,
  CONSTRAINT lotofacil_resultado_b1_b4_b8_b12_b15_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_b1_b4_b8_b12_b15_pk PRIMARY KEY (concurso, b1_b4_b8_b12_b15_id)
);

/**
  Tabelas pra analisar os grupos.
 */

drop table if exists lotofacil.lotofacil_resultado_grupo_2bolas;
create table lotofacil.lotofacil_resultado_grupo_2bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_2bolas_pk PRIMARY KEY (concurso, grp_id),
  CONSTRAINT lotofacil_resultado_grupo_2bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_3bolas;
create table lotofacil.lotofacil_resultado_grupo_3bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_3bolas_pk PRIMARY KEY (concurso, grp_id),
  CONSTRAINT lotofacil_resultado_grupo_3bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_4bolas;
create table lotofacil.lotofacil_resultado_grupo_4bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_4bolas_pk PRIMARY KEY (concurso, grp_id),
  CONSTRAINT lotofacil_resultado_grupo_4bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_5bolas;
create table lotofacil.lotofacil_resultado_grupo_5bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_5bolas_pk PRIMARY KEY (concurso, grp_id),
  CONSTRAINT lotofacil_resultado_grupo_5bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_primo;
create table lotofacil.lotofacil_resultado_primo(
  concurso numeric not null,
  prm_id numeric not null,
  CONSTRAINT lotofacil_resultado_primo_pk PRIMARY KEY (concurso, prm_id),
  CONSTRAINT lotofacil_resultado_primo_unk UNIQUE (concurso, prm_id)
);

/**
  Novos, repetidos, ainda nao saiu, deixou de sair.
 *














