/**
  Scripts sql de criação de tabelas pra análise do jogo da lotofacil da caixa.
  Eu já havia criado as tabelas, mas agora, está otimizada.

 */

/**
  Apaga as views, pois ela depende das tabelas deste arquivo.
 */

drop view if exists lotofacil.v_lotofacil_resultado_par_impar;
drop view if exists lotofacil.v_lotofacil_resultado_par_impar_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_externo_interno;
drop view if exists lotofacil.v_lotofacil_resultado_externo_interno_detalhado;

drop view if exists lotofacil.v_lotofacil_resultado_primo;
drop view if exists lotofacil.v_lotofacil_resultado_primo_detalhado;

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

drop view if exists lotofacil.v_lotofacil_resultado_trio;
drop view if exists lotofacil.v_lotofacil_resultado_trio_detalhado;

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
drop TABLE if exists lotofacil.lotofacil_resultado_bolas;
drop table if exists lotofacil.lotofacil_resultado_par_impar;
drop table if exists lotofacil.lotofacil_resultado_externo_interno;
drop table if exists lotofacil.lotofacil_resultado_primo;
drop table if exists lotofacil.lotofacil_resultado_horizontal;
drop table if exists lotofacil.lotofacil_resultado_vertical;
drop table if exists lotofacil.lotofacil_resultado_diagonal;
drop table if exists lotofacil.lotofacil_resultado_cruzeta;
drop table if exists lotofacil.lotofacil_resultado_quarteto;
drop table if exists lotofacil.lotofacil_resultado_num;

drop table if exists lotofacil.lotofacil_resultado_b1;
drop table if exists lotofacil.lotofacil_resultado_b1_b15;
drop table if exists lotofacil.lotofacil_resultado_b1_b8_b15;
drop table if exists lotofacil.lotofacil_resultado_b1_b4_b8_b12_b15;

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
  ext_int_id numeric not null,
  CONSTRAINT lotofacil_resultado_externo_interno_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_externo_interno_pk PRIMARY KEY (concurso, ext_int_id)
);


drop table if exists lotofacil.lotofacil_resultado_primo;
create table lotofacil.lotofacil_resultado_primo(
  concurso numeric not null,
  prm_id numeric not null,
  CONSTRAINT lotofacil_resultado_primo_pk PRIMARY KEY (concurso, prm_id),
  CONSTRAINT lotofacil_resultado_primo_unk UNIQUE (concurso, prm_id)
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

drop table if exists lotofacil.lotofacil_resultado_trio;
create table lotofacil.lotofacil_resultado_trio(
  concurso numeric not null,
  trio_id numeric not null,
  CONSTRAINT lotofacil_resultado_trio_fk FOREIGN KEY (concurso) REFERENCES lotofacil.lotofacil_resultado_num(concurso)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_resultado_trio_pk PRIMARY KEY (concurso, trio_id)
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
  Novos, repetidos, ainda nao saiu, deixou de sair.
 */
drop table if exists lotofacil.lotofacil_resultado_novos_repetidos;
create table lotofacil.lotofacil_resultado_novos_repetidos(
  concurso numeric not null,
  novos_repetidos_id numeric not null,
  CONSTRAINT lotofacil_resultado_novos_repetidos_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_novos_repetidos_unk UNIQUE (concurso, novos_repetidos_id)
);

/**
  Tabelas pra analisar os grupos.
 */

drop table if exists lotofacil.lotofacil_resultado_grupo_2_bolas;
create table lotofacil.lotofacil_resultado_grupo_2bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_2_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_2_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_3_bolas;
create table lotofacil.lotofacil_resultado_grupo_3bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_3_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_3_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_4_bolas;
create table lotofacil.lotofacil_resultado_grupo_4bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_4_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_4_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_5_bolas;
create table lotofacil.lotofacil_resultado_grupo_5bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_5_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_5_bolas_unk UNIQUE (concurso, grp_id)
);


drop table if exists lotofacil.lotofacil_resultado_grupo_6_bolas;
create table lotofacil.lotofacil_resultado_grupo_6bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_6_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_6_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_7_bolas;
create table lotofacil.lotofacil_resultado_grupo_7bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_7_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_7_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_8_bolas;
create table lotofacil.lotofacil_resultado_grupo_8bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_8_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_8_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_9_bolas;
create table lotofacil.lotofacil_resultado_grupo_9bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_9_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_9_bolas_unk UNIQUE (concurso, grp_id)
);

drop table if exists lotofacil.lotofacil_resultado_grupo_10_bolas;
create table lotofacil.lotofacil_resultado_grupo_10bolas(
  concurso numeric not null,
  grp_id numeric not null,
  CONSTRAINT lotofacil_resultado_grupo_10_bolas_pk PRIMARY KEY (concurso),
  CONSTRAINT lotofacil_resultado_grupo_10_bolas_unk UNIQUE (concurso, grp_id)
);

/**
  Tabela de frequência, onde o valor:
  >> negativo, indica que a bola não saiu, ou ainda não saiu.
  >> positivo, indica que a bola saiu, ou está se repetindo.
  Se o campo tem o valor 1, que dizer, que a bola é nova, não estava no concurso anterior, mas
  apareceu no atual.
  Se o campo tem o valor maior que 1, quer dizer que a bola esta se repetindo desde os últimos jogos;
  Se o campo tem o valor negativo igual a -1, quer dizer que a bola estava no concurso anterior,
  mas não saiu no concurso atual.
  Se o campo tem o valor negativo menor  que -1, quer dizer que a bola ainda não saiu desde o último
  concurso e o atual.
 */
drop table if exists lotofacil.lotofacil_resultado_num_frequencia;
CREATE TABLE lotofacil.lotofacil_resultado_num_frequencia (
  concurso         NUMERIC      NOT NULL,

  num_1                    NUMERIC DEFAULT 0,
  num_2                    NUMERIC DEFAULT 0,
  num_3                    NUMERIC DEFAULT 0,
  num_4                    NUMERIC DEFAULT 0,
  num_5                    NUMERIC DEFAULT 0,
  num_6                    NUMERIC DEFAULT 0,
  num_7                    NUMERIC DEFAULT 0,
  num_8                    NUMERIC DEFAULT 0,
  num_9                    NUMERIC DEFAULT 0,
  num_10                   NUMERIC DEFAULT 0,
  num_11                   NUMERIC DEFAULT 0,
  num_12                   NUMERIC DEFAULT 0,
  num_13                   NUMERIC DEFAULT 0,
  num_14                   NUMERIC DEFAULT 0,
  num_15                   NUMERIC DEFAULT 0,
  num_16                   NUMERIC DEFAULT 0,
  num_17                   NUMERIC DEFAULT 0,
  num_18                   NUMERIC DEFAULT 0,
  num_19                   NUMERIC DEFAULT 0,
  num_20                   NUMERIC DEFAULT 0,
  num_21                   NUMERIC DEFAULT 0,
  num_22                   NUMERIC DEFAULT 0,
  num_23                   NUMERIC DEFAULT 0,
  num_24                   NUMERIC DEFAULT 0,
  num_25                   NUMERIC DEFAULT 0,

  CONSTRAINT lotofacil_resultado_num_frequencia_pk PRIMARY KEY (concurso),
  constraint lotofacil_resultado_num_frequencia_fk FOREIGN KEY (concurso) references lotofacil.lotofacil_resultado_num(concurso)
);

/**
  Esta função atualiza a tabela lotofacil.lotofacil_resultado_novos_repetidos.
 */
drop function if exists lotofacil.fn_lotofacil_resultado_atualizar_novos_repetidos();
create function lotofacil.fn_lotofacil_resultado_atualizar_novos_repetidos()
  returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
    reg_lotofacil_resultado_num lotofacil.lotofacil_resultado_num%ROWTYPE;

    total_registros_novos_repetidos numeric;

    total_registros_resultado_bolas_num numeric;

    -- Conta cada registro.
    contador_registro numeric;
    
    -- Conta a quantidade de bola encontrada, parando, quando atingir 15.
    contador_bolas numeric;
    
    -- Arranjo que armazena cada bola.
    -- O índice 0, tem o número do concurso.
    ltf_num numeric[26];
    ltf_num_anterior numeric[26];
    ltf_frequencia numeric [26];

    qt_novos numeric;
    qt_repetidos numeric;

  begin
    -- Verifica primeiro se há registro na tabela de resultados;
    Select count(*) into total_registros_resultado_bolas_num from lotofacil.lotofacil_resultado_num;

    if total_registros_resultado_bolas_num = 0 then
      Raise Notice 'Nenhum registro na tabela lotofacil_resultado_bolas';
      return;
    END IF;

    -- Devemos sempre deletar os dados da tabela lotofacil_resultado_novos_repetidos
    -- pois, não temos certeza se algum registro foi inserido fora da sequencia.
    delete from lotofacil.lotofacil_resultado_novos_repetidos;

    
    -- O loop abaixo é bem simples, ele compara cada campo de prefixo num_ 
    -- com o mesmo campo do registro anterior e realizar o seguinte procedimento:
    -- se o campo atual é 1
    contador_registro := 1;
    for reg_lotofacil_resultado_num in
      Select * from lotofacil.lotofacil_resultado_num
      order by concurso
    LOOP
      if contador_registro = 1 then
        ltf_num_anterior[0] = reg_lotofacil_resultado_num.concurso;
        ltf_num_anterior[1] = reg_lotofacil_resultado_num.num_1;
        ltf_num_anterior[2] = reg_lotofacil_resultado_num.num_2;
        ltf_num_anterior[3] = reg_lotofacil_resultado_num.num_3;
        ltf_num_anterior[4] = reg_lotofacil_resultado_num.num_4;
        ltf_num_anterior[5] = reg_lotofacil_resultado_num.num_5;
        ltf_num_anterior[6] = reg_lotofacil_resultado_num.num_6;
        ltf_num_anterior[7] = reg_lotofacil_resultado_num.num_7;
        ltf_num_anterior[8] = reg_lotofacil_resultado_num.num_8;
        ltf_num_anterior[9] = reg_lotofacil_resultado_num.num_9;
        ltf_num_anterior[10] = reg_lotofacil_resultado_num.num_10;
        ltf_num_anterior[11] = reg_lotofacil_resultado_num.num_11;
        ltf_num_anterior[12] = reg_lotofacil_resultado_num.num_12;
        ltf_num_anterior[13] = reg_lotofacil_resultado_num.num_13;
        ltf_num_anterior[14] = reg_lotofacil_resultado_num.num_14;
        ltf_num_anterior[15] = reg_lotofacil_resultado_num.num_15;
        ltf_num_anterior[16] = reg_lotofacil_resultado_num.num_16;
        ltf_num_anterior[17] = reg_lotofacil_resultado_num.num_17;
        ltf_num_anterior[18] = reg_lotofacil_resultado_num.num_18;
        ltf_num_anterior[19] = reg_lotofacil_resultado_num.num_19;
        ltf_num_anterior[20] = reg_lotofacil_resultado_num.num_20;
        ltf_num_anterior[21] = reg_lotofacil_resultado_num.num_21;
        ltf_num_anterior[22] = reg_lotofacil_resultado_num.num_22;
        ltf_num_anterior[23] = reg_lotofacil_resultado_num.num_23;
        ltf_num_anterior[24] = reg_lotofacil_resultado_num.num_24;
        ltf_num_anterior[25] = reg_lotofacil_resultado_num.num_25;

        Insert into lotofacil.lotofacil_resultado_novos_repetidos (concurso, novos_repetidos_id)
          SELECT reg_lotofacil_resultado_num.concurso, novos_repetidos_id FROM lotofacil.lotofacil_id_novos_repetidos
        where novos = 0 and repetidos = 15;

        contador_registro := contador_registro + 1;
        continue;
      END IF;
      
      -- Armazena os novos registros pra realizar a comparação
        ltf_num[0] = reg_lotofacil_resultado_num.concurso;
        ltf_num[1] = reg_lotofacil_resultado_num.num_1;
        ltf_num[2] = reg_lotofacil_resultado_num.num_2;
        ltf_num[3] = reg_lotofacil_resultado_num.num_3;
        ltf_num[4] = reg_lotofacil_resultado_num.num_4;
        ltf_num[5] = reg_lotofacil_resultado_num.num_5;
        ltf_num[6] = reg_lotofacil_resultado_num.num_6;
        ltf_num[7] = reg_lotofacil_resultado_num.num_7;
        ltf_num[8] = reg_lotofacil_resultado_num.num_8;
        ltf_num[9] = reg_lotofacil_resultado_num.num_9;
        ltf_num[10] = reg_lotofacil_resultado_num.num_10;
        ltf_num[11] = reg_lotofacil_resultado_num.num_11;
        ltf_num[12] = reg_lotofacil_resultado_num.num_12;
        ltf_num[13] = reg_lotofacil_resultado_num.num_13;
        ltf_num[14] = reg_lotofacil_resultado_num.num_14;
        ltf_num[15] = reg_lotofacil_resultado_num.num_15;
        ltf_num[16] = reg_lotofacil_resultado_num.num_16;
        ltf_num[17] = reg_lotofacil_resultado_num.num_17;
        ltf_num[18] = reg_lotofacil_resultado_num.num_18;
        ltf_num[19] = reg_lotofacil_resultado_num.num_19;
        ltf_num[20] = reg_lotofacil_resultado_num.num_20;
        ltf_num[21] = reg_lotofacil_resultado_num.num_21;
        ltf_num[22] = reg_lotofacil_resultado_num.num_22;
        ltf_num[23] = reg_lotofacil_resultado_num.num_23;
        ltf_num[24] = reg_lotofacil_resultado_num.num_24;
        ltf_num[25] = reg_lotofacil_resultado_num.num_25;

        -- Agora, iremos realizar a comparação do registro atual com o anterior.
        qt_repetidos := 0;
        qt_novos := 0;
        contador_bolas := 0;

        -- No loop abaixo, iremos comparar cada campo de prefixo num_ do registro
        -- atual com cada campo de prefixo num_ do registro anterior.
        -- Se o campo atual tiver o valor 1, então:
        -- Se o campo anterior tiver o valor 0, quer dizer, que a bola que corresponde
        -- àquele campo é nova, senão, se o valor fo 1, quer dizer, que a bola está
        -- se repetindo.
        -- Resumindo, iremos contabilizar, a quantidade de novos e repetidos, comparando
        -- sempre com o registro anterior.

        for uA in 1..25 LOOP


          if ltf_num[uA] = 1 then
            contador_bolas := contador_bolas + 1;

            -- Se o campo atual do registro atual e o campo do registro anterior
            -- for 1, quer dizer, que são repetidos.

            if ltf_num_anterior[uA] = 1 THEN
              qt_repetidos := qt_repetidos + 1;
            ELSE
              qt_novos := qt_novos + 1;
            end if;
          end if;

          ltf_num_anterior[uA] := ltf_num[uA];
        END LOOP;

        -- Insere um novo registro.
        Insert into lotofacil.lotofacil_resultado_novos_repetidos (concurso, novos_repetidos_id)
          SELECT reg_lotofacil_resultado_num.concurso, novos_repetidos_id FROM lotofacil.lotofacil_id_novos_repetidos
        where novos = qt_novos and repetidos = qt_repetidos;

      
    END LOOP;

  end;
  $$;

Select from lotofacil.fn_lotofacil_resultado_atualizar_novos_repetidos();



-- Select from lotofacil.fn_lotofacil_atualizar_novos_repetidos(1516);














