/**
  Scripts sql de criação de tabelas pra análise do jogo da lotofacil da caixa.
  Eu já havia criado as tabelas, mas agora, está otimizada.

 */
drop TABLE if exists lotofacil.lotofacil_resultado_bolas;
drop table if exists lotofacil.lotofacil_resultado_par_impar;
drop table if exists lotofacil.lotofacil_resultado_externo_interno;
drop table if exists lotofacil.lotofacil_resultado_horizontal;
drop table if exists lotofacil.lotofacil_resultado_vertical;
drop table if exists lotofacil.lotofacil_resultado_diagonal;
drop table if exists lotofacil.lotofacil_resultado_cruzeta;
drop table if exists lotofacil.lotofacil_resultado_num;
CREATE TABLE lotofacil.lotofacil_resultado_num (
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

  CONSTRAINT lotofacil_resultado_pk PRIMARY KEY (concurso)
);
comment on table lotofacil.lotofacil_resultado_num is
'Esta é a tabela inicial, que são armazenados os resultados da lotofacil, '
'os campos num_0 a num_99 corresponde respectivamentes às bolas 0 a 99 do lotofacil,'
'o campo terá o valor 1, se a bola foi sorteada, 0 (zero) caso contrário.'
'Tem que ser sorteado 20 números, senão a restrição de verificação não irá deixar inserir o registro.';

drop TABLE if exists lotofacil.lotofacil_resultado_bolas;
create table lotofacil.lotofacil_resultado_bolas(
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
create TABLE lotofacil.lotofacil_resultado_par_impar(
  concurso numeric not null,
  par numeric not null,
  impar numeric not null,

  CONSTRAINT lotofacil_resultado_par_impar_chk check((par + impar) = 15),
  CONSTRAINT lotofacil_resultado_par_impar_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on UPDATE cascade on DELETE cascade
);

drop table if exists lotofacil.lotofacil_resultado_externo_interno;
create TABLE lotofacil.lotofacil_resultado_externo_interno(
  concurso numeric not null,
  externo numeric not null,
  interno numeric not null,

  CONSTRAINT lotofacil_resultado_externo_interno_chk check((externo + interno) = 15),
  CONSTRAINT lotofacil_resultado_externo_interno_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on UPDATE cascade on DELETE cascade
);

drop table if exists lotofacil.lotofacil_resultado_horizontal;
create table lotofacil.lotofacil_resultado_horizontal(
  concurso numeric not null,
  hrz_id numeric not null,
  CONSTRAINT lotofacil_resultado_horizontal_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_horizontal_unk UNIQUE (concurso, hrz_id)
);

drop table if exists lotofacil.lotofacil_resultado_vertical;
create table lotofacil.lotofacil_resultado_vertical(
  concurso numeric not null,
  vrt_id numeric not null,
  CONSTRAINT lotofacil_resultado_vertical_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_vertical_unk UNIQUE (concurso, vrt_id)
);

drop table if exists lotofacil.lotofacil_resultado_diagonal;
create table lotofacil.lotofacil_resultado_diagonal(
  concurso numeric not null,
  dg_id numeric not null,
  CONSTRAINT lotofacil_resultado_diagonal_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_diagonal_unk UNIQUE (concurso, dg_id)
);

drop table if exists lotofacil.lotofacil_resultado_cruzeta;
create table lotofacil.lotofacil_resultado_cruzeta(
  concurso numeric not null,
  crz_id numeric not null,
  CONSTRAINT lotofacil_resultado_cruzeta_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_cruzeta_unk UNIQUE (concurso, crz_id)
);

drop table if exists lotofacil.lotofacil_resultado_externo_interno;
create table lotofacil.lotofacil_resultado_externo_interno(
  concurso numeric not null,
  ext_id numeric not null,
  CONSTRAINT lotofacil_resultado_externo_interno_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_externo_interno_unk UNIQUE (concurso, ext_id)
);










