/**
  Scripts sql de criação de tabelas pra análise do jogo da lotofacil da caixa.
  Eu já havia criado as tabelas, mas agora, está otimizada.

 */

/**
  Apaga as views, pois ela depende das tabelas deste arquivo.
 */
drop view if exists lotofacil.v_lotofacil_par_impar;
drop view if exists lotofacil.v_lotofacil_par_impar_detalhado;

drop view if exists lotofacil.v_lotofacil_externo_interno;
drop view if exists lotofacil.v_lotofacil_externo_interno_detalhado;

drop view if exists lotofacil.v_lotofacil_primo;
drop view if exists lotofacil.v_lotofacil_primo_detalhado;

drop view if exists lotofacil.v_lotofacil_horizontal;
drop view if exists lotofacil.v_lotofacil_horizontal_detalhado;

drop view if exists lotofacil.v_lotofacil_vertical;
drop view if exists lotofacil.v_lotofacil_vertical_detalhado;

drop view if exists lotofacil.v_lotofacil_diagonal;
drop view if exists lotofacil.v_lotofacil_diagonal_detalhado;

drop view if exists lotofacil.v_lotofacil_cruzeta;
drop view if exists lotofacil.v_lotofacil_cruzeta_detalhado;

drop view if exists lotofacil.v_lotofacil_quarteto;
drop view if exists lotofacil.v_lotofacil_quarteto_detalhado;

drop view if exists lotofacil.v_lotofacil_trio;
drop view if exists lotofacil.v_lotofacil_trio_detalhado;


drop view if exists lotofacil.v_lotofacil_b1;
drop view if exists lotofacil.v_lotofacil_b1_b15;
drop view if exists lotofacil.v_lotofacil_b1_b8_b15;
drop view if exists lotofacil.v_lotofacil_b1_b4_b8_b12_b15;

drop table if exists lotofacil.lotofacil_grupo_2bolas;
drop table if exists lotofacil.lotofacil_grupo_3bolas;
drop table if exists lotofacil.lotofacil_grupo_4bolas;
drop table if exists lotofacil.lotofacil_grupo_5bolas;

/**
  Apaga as tabelas de colunas b.
 */
drop table if exists lotofacil.lotofacil_b1;
drop table if exists lotofacil.lotofacil_b1_b15;
drop table if exists lotofacil.lotofacil_b1_b8_b15;
drop table if exists lotofacil.lotofacil_b1_b4_b8_b12_b15;


drop TABLE if exists lotofacil.lotofacil_bolas;
drop table if exists lotofacil.lotofacil_par_impar;
drop table if exists lotofacil.lotofacil_externo_interno;
drop table if exists lotofacil.lotofacil_horizontal;
drop table if exists lotofacil.lotofacil_vertical;
drop table if exists lotofacil.lotofacil_diagonal;
drop table if exists lotofacil.lotofacil_cruzeta;
drop table if exists lotofacil.lotofacil_quarteto;
drop table if exists lotofacil.lotofacil_primo;

drop table if exists lotofacil.lotofacil_id;

drop table if exists lotofacil.lotofacil_novos_repetidos;

drop table if exists lotofacil.lotofacil_num;


/**
  Esta é a tabela, onde os dados serão inseridos na tabela, as demais tabelas
  serão inseridos conforme os dados são inseridas aqui.
 */

CREATE TABLE lotofacil.lotofacil_num (
  ltf_id         NUMERIC      NOT NULL,
  ltf_qt         numeric         NOT NULL check (ltf_qt in (15, 16, 17, 18)),

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

  CONSTRAINT lotofacil_num_chk check (
    (num_1 + num_2  + num_3  + num_4  + num_5  + num_6  + num_7  + num_8  + num_9  + num_10 +
    num_11 + num_12 + num_13 + num_14 + num_15 + num_16 + num_17 + num_18 + num_19 + num_20 +
    num_21 + num_22 + num_23 + num_24 + num_25 ) = ltf_qt
  ),

  CONSTRAINT lotofacil_unk unique (num_1, num_2 , num_3 , num_4 , num_5 , num_6 , num_7 , num_8 , num_9 , num_10,
    num_11, num_12, num_13, num_14, num_15, num_16, num_17, num_18, num_19, num_20, 
    num_21, num_22, num_23, num_24, num_25 ),

  CONSTRAINT lotofacil_pk PRIMARY KEY (ltf_id)
);
comment on table lotofacil.lotofacil_num is
'Esta é a tabela inicial, que são armazenados os resultados da lotofacil, '
'os campos num_0 a num_99 corresponde respectivamentes às bolas 0 a 99 do lotofacil,'
'o campo terá o valor 1, se a bola foi sorteada, 0 (zero) caso contrário.'
'Tem que ser sorteado 20 números, senão a restrição de verificação não irá deixar inserir o registro.';

--alter table lotofacil.lotofacil_resultado_num add CONSTRAINT lotofacil_resultado_fk FOREIGN KEY (ltf_id) references lotofacil.lotofacil_num(ltf_id);




drop TABLE if exists lotofacil.lotofacil_bolas;
create table lotofacil.lotofacil_bolas(
  ltf_id numeric not null,
  ltf_qt numeric not null,

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
  b_16                   NUMERIC DEFAULT null ,
  b_17                   NUMERIC DEFAULT null ,
  b_18                   NUMERIC DEFAULT null ,

  CONSTRAINT lotofacil_bolas_pk PRIMARY KEY (ltf_id),
  CONSTRAINT lotofacil_bolas_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on UPDATE cascade on DELETE cascade,

  CONSTRAINT lotofacil_bolas_chk CHECK (
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

/**
  Analisando aqui, achei mais preferível ter uma outra, tabela, que tem os campos ltf_id, ltf_qt
  e todos os ids, de pares x impares, externos x internos, ao invés de ter tabelas separadas pra cada
  assunto neste caso.
  No caso das tabelas, de grupos, é que haverá tabelas separadas:
  lotofacil_grupo_2_bolas, lotofacil_grupo_3_bolas e assim por diante.
  Pois, quando for realizar a consulta, eu não precisaremos realizar muitos joins.
 */
drop table if exists lotofacil.lotofacil_par_impar;
create table lotofacil.lotofacil_par_impar(
  ltf_id numeric not null,
  ltf_qt numeric not null check (ltf_qt in (15, 16, 17, 18)),
  
  par_impar_id numeric not null,

  CONSTRAINT lotofacil_par_impar_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_par_impar_pk PRIMARY KEY (ltf_id)
);

drop table if exists lotofacil.lotofacil_externo_interno;
create table lotofacil.lotofacil_externo_interno(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  ext_id numeric not null,
  int_id numeric not null,
  CONSTRAINT lotofacil_externo_interno_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_externo_interno_pk PRIMARY KEY (ltf_id, ext_id, int_id)
);
comment on TABLE lotofacil.lotofacil_externo_interno IS
'Esta tabela armazena o id único referente a externo e interno de cada jogo.'
'cada combinação da lotofacil, terá um único id, este id, é recuperado da tabela lotofacil.lotofacil_id_externo_interno';
comment on column lotofacil.lotofacil_externo_interno.ext_id is
'Id referente à combinação de externo e interno';
comment on column lotofacil.lotofacil_externo_interno.int_id IS
'Praticamente este id é igual a quantidade de bolas na região interna, ou seja,'
'nas combinações de 15, 16, 17 e 18 bolas, sempre haverá no mínimo 0 e no máximo 9 bolas';

drop table if exists lotofacil.lotofacil_primo;
create table lotofacil.lotofacil_primo(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),

  prm_id numeric not null,
  CONSTRAINT lotofacil_primo_pk PRIMARY KEY (ltf_id, prm_id),
  CONSTRAINT lotofacil_primo_unk UNIQUE (ltf_id, prm_id)
);

drop table if exists lotofacil.lotofacil_horizontal;
create table lotofacil.lotofacil_horizontal(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  hrz_id numeric not null,
  CONSTRAINT lotofacil_horizontal_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_horizontal_pk PRIMARY KEY (ltf_id)
);

drop table if exists lotofacil.lotofacil_vertical;
create table lotofacil.lotofacil_vertical(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  vrt_id numeric not null,
  CONSTRAINT lotofacil_vertical_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_vertical_pk PRIMARY KEY (ltf_id)
);

drop table if exists lotofacil.lotofacil_diagonal;
create table lotofacil.lotofacil_diagonal(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  dg_id numeric not null,
  CONSTRAINT lotofacil_diagonal_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_diagonal_pk PRIMARY KEY (ltf_id)
);

drop table if exists lotofacil.lotofacil_cruzeta;
create table lotofacil.lotofacil_cruzeta(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  crz_id numeric not null,
  CONSTRAINT lotofacil_cruzeta_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_cruzeta_pk PRIMARY KEY (ltf_id)
);

/**
  Quarteto:
    São 4 bolas, por grupo, o último grupo tem 5.
 */

drop table if exists lotofacil.lotofacil_quarteto;
create table lotofacil.lotofacil_quarteto(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  qrt_id numeric not null,
  CONSTRAINT lotofacil_quarteto_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_quarteto_pk PRIMARY KEY (ltf_id)
);


/**
  Coluna b1, indica a coluna com a menor bola.
  As bolas são disposta em ordem crescente.
 */
drop table if exists lotofacil.lotofacil_b1;
create table lotofacil.lotofacil_b1(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  b1_id numeric not null,
  CONSTRAINT lotofacil_b1_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_b1_pk PRIMARY KEY (ltf_id),
  CONSTRAINT lotofacil_b1_unk unique (ltf_id, b1_id)
);

/**
  Coluna b1, indica a coluna com a menor bola.
  Coluna b15, indica a última coluna com a maior bola do ltf_id.
  As bolas são disposta em ordem crescente.
 */
drop table if exists lotofacil.lotofacil_b1_b15;
create table lotofacil.lotofacil_b1_b15(
  ltf_id numeric not null,
  ltf_qt numeric not null check(ltf_qt in (15, 16, 17, 18)),
  
  b1_b15_id numeric not null,
  CONSTRAINT lotofacil_b1_b15_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_b1_b15_pk PRIMARY KEY (ltf_id),
  CONSTRAINT lotofacil_b1_b15_unk unique (ltf_id, b1_b15_id)
);


drop table if exists lotofacil.lotofacil_b1_b8_b15;
create table lotofacil.lotofacil_b1_b8_b15(
  ltf_id numeric not null,
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  
  b1_b8_b15_id numeric not null,
  CONSTRAINT lotofacil_b1_b8_b15_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_b1_b8_b15_pk PRIMARY KEY (ltf_id),
  CONSTRAINT lotofacil_b1_b8_b15_unk UNIQUE (ltf_id, b1_b8_b15_id)
);

drop table if exists lotofacil.lotofacil_b1_b4_b8_b12_b15;
create table lotofacil.lotofacil_b1_b4_b8_b12_b15(
  ltf_id numeric not null,
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  
  b1_b4_b8_b12_b15_id numeric not null,
  CONSTRAINT lotofacil_b1_b4_b8_b12_b15_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade,
  CONSTRAINT lotofacil_b1_b4_b8_b12_b15_pk PRIMARY KEY (ltf_id),
  CONSTRAINT lotofacil_b1_b4_b8_b12_b15_unk UNIQUE (ltf_id, b1_b4_b8_b12_b15_id)
);

/**
  Em um único jogo, há vários grupos, então, a chave primária, que é uma chave
  que identifica um registro como único naõ será considerado o campo ltf_id e sim
  outro campo de nome 'grupoX_id', onde o X, será 2, se grupo de 2 bolas,
  será 3, se grupo de 3 bolas, e assim por diante.
 */

drop table if exists lotofacil.lotofacil_grupo_2bolas;
create table lotofacil.lotofacil_grupo_2bolas(
  ltf_id numeric not null,
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  
  grp_id numeric not null,
  CONSTRAINT lotofacil_grupo_2bolas_pk PRIMARY KEY (ltf_id, grp_id),
  CONSTRAINT lotofacil_grupo_2bolas_unk UNIQUE (ltf_id, grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_3bolas;
create table lotofacil.lotofacil_grupo_3bolas(
  ltf_id numeric not null,
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  
  grp_id numeric not null,
  CONSTRAINT lotofacil_grupo_3bolas_pk PRIMARY KEY (ltf_id, grp_id),
  CONSTRAINT lotofacil_grupo_3bolas_unk UNIQUE (ltf_id, grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_4bolas;
create table lotofacil.lotofacil_grupo_4bolas(
  ltf_id numeric not null,
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  
  grp_id numeric not null,
  CONSTRAINT lotofacil_grupo_4bolas_pk PRIMARY KEY (ltf_id, grp_id),
  CONSTRAINT lotofacil_grupo_4bolas_unk UNIQUE (ltf_id, grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_5bolas;
create table lotofacil.lotofacil_grupo_5bolas(
  ltf_id numeric not null,
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  
  grp_id numeric not null,
  CONSTRAINT lotofacil_grupo_5bolas_pk PRIMARY KEY (ltf_id, grp_id),
  CONSTRAINT lotofacil_grupo_5bolas_unk UNIQUE (ltf_id, grp_id)
);

/**
  As tabelas que tem o final do nome com a palavra consolidado.
  quer dizer, que são tabelas consolidadas, consolidados.
  Haverá duas tabelas consolidados, uma por identificador do grupo, e,
  outra, consolidado por quantidade de bolas e pelo identificador do grupo.
  
  Tabelas, onde o agrupamento é a quantidade de bolas e o id do grupo
  terão o sufixo _consolidado_qt no final do nome da tabela.
  
 */
drop table if exists lotofacil.lotofacil_grupo_2bolas_consolidado_por_bolas;
create table lotofacil.lotofacil_grupo_2bolas_consolidado_qt(
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_2bolas_consolidado_qt_pk PRIMARY KEY (ltf_qt, grp_id),
  CONSTRAINT lotofacil_grupo_2bolas_consolidado_qt_unk UNIQUE (ltf_qt, grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_3bolas_consolidado_por_bolas;
create table lotofacil.lotofacil_grupo_3bolas_consolidado_qt(
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_3bolas_consolidado_qt_pk PRIMARY KEY (ltf_qt, grp_id),
  CONSTRAINT lotofacil_grupo_3bolas_consolidado_qt_unk UNIQUE (ltf_qt, grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_4bolas_consolidado_por_bolas;
create table lotofacil.lotofacil_grupo_4bolas_consolidado_qt(
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_4bolas_consolidado_qt_pk PRIMARY KEY (ltf_qt, grp_id),
  CONSTRAINT lotofacil_grupo_4bolas_consolidado_qt_unk UNIQUE (ltf_qt, grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_5bolas_consolidado_por_bolas;
create table lotofacil.lotofacil_grupo_5bolas_consolidado_qt(
  ltf_qt numeric not null  check(ltf_qt in (15, 16, 17, 18)),
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_5bolas_consolidado_qt_pk PRIMARY KEY (ltf_qt, grp_id),
  CONSTRAINT lotofacil_grupo_5bolas_consolidado_qt_unk UNIQUE (ltf_qt, grp_id)
);


/**
  As tabelas que tem o final do nome com a palavra agrupada.
  quer dizer, que são tabelas consolidadas, agrupadas.
  Haverá duas tabelas agrupadas, uma por identificador do grupo, e,
  outra, agrupada por quantidade de bolas e pelo identificador do grupo.
  
  Tabelas, onde o agrupamento é a quantidade de bolas e o id do grupo
  terão o sufixo _agrupada_qt no nome da tabela.
  Tabelas, onde o agrupamento é o id do grupo terão o sufixo
  _agrupada no nome do arquivo no nome da tabela.
  
 */

drop table if exists lotofacil.lotofacil_grupo_2bolas_agrupada;
create table lotofacil.lotofacil_grupo_2bolas_agrupada(
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_2bolas_agrupada_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_2bolas_agrupada_unk UNIQUE (grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_3bolas_agrupada;
create table lotofacil.lotofacil_grupo_3bolas_agrupada(
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_3bolas_agrupada_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_3bolas_agrupada_unk UNIQUE (grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_4bolas_agrupada;
create table lotofacil.lotofacil_grupo_4bolas_agrupada(
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_4bolas_agrupada_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_4bolas_agrupada_unk UNIQUE (grp_id)
);

drop table if exists lotofacil.lotofacil_grupo_5bolas_agrupada;
create table lotofacil.lotofacil_grupo_5bolas_agrupada(
  grp_id numeric not null,
  qt_vezes numeric not null,

  CONSTRAINT lotofacil_grupo_5bolas_agrupada_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_5bolas_agrupada_unk UNIQUE (grp_id)
);















/**
  Haverá uma tabela somente com id únicos, o que isto quer dizer,

  As tabelas lotofacil_horizontal, lotofacil_vertical, lotofacil_diagonal, lotofacil_cruzeta,
  lotofacil_quarteto, lotofacil_par_impar, lotofacil_externo_interno, todas, tem um único id,
  para um único jogo.


  No caso das tabelas grupo e colunas_b, haverá uma tabela separada pois, pode haver vários
  id, para um único jogo, por exemplo, no grupo de 2 bolas, haverá 300 id, para um único jogo.
 */
drop table if exists lotofacil.lotofacil_id;
create table lotofacil.lotofacil_id(
  ltf_id numeric not null,
  ltf_qt numeric not null,
  par_impar_id numeric not null,
  ext_id numeric not null,
  int_id numeric not null,
  prm_id numeric not null,
  hrz_id numeric not null,
  vrt_id numeric not null,
  dg_id numeric not null,
  crz_id numeric not null,
  qrt_id numeric not null,  
  b1_id numeric not null,
  b1_b4_b8_b12_b15_id numeric not null,
  b1_b8_b15_id numeric not null,
  b1_b15_id numeric not null,
  novos numeric default null,
  repetidos numeric default null,
  ultimo_concurso numeric default null
);


drop function if exists lotofacil.fn_lotofacil_id();
create function lotofacil.fn_lotofacil_id()
  returns VOID
  language plpgsql
  as $$
  DECLARE
  begin
    Insert Into lotofacil.lotofacil_id(
      ltf_id, ltf_qt, par_impar_id, ext_id,  int_id, prm_id, hrz_id, vrt_id, dg_id, crz_id, qrt_id,
      b1_id, b1_b4_b8_b12_b15_id, b1_b8_b15_id, b1_b15_id)
      Select lotofacil.lotofacil_par_impar.ltf_id, 
        lotofacil.lotofacil_par_impar.ltf_qt, 
        par_impar_id, ext_id,  int_id, prm_id, hrz_id, vrt_id, dg_id, crz_id, qrt_id,
        b1_id, b1_b4_b8_b12_b15_id, b1_b8_b15_id, b1_b15_id FRom

        lotofacil.lotofacil_par_impar,
        lotofacil.lotofacil_externo_interno,
        lotofacil.lotofacil_primo,
        lotofacil.lotofacil_horizontal,
        lotofacil.lotofacil_vertical,
        lotofacil.lotofacil_diagonal,
        lotofacil.lotofacil_cruzeta,
        lotofacil.lotofacil_quarteto,
        lotofacil.lotofacil_b1,
        lotofacil.lotofacil_b1_b4_b8_b12_b15,
        lotofacil.lotofacil_b1_b8_b15,
        lotofacil.lotofacil_b1_b15
    where lotofacil.lotofacil_par_impar.ltf_id = lotofacil.lotofacil_externo_interno.ltf_id
    AND lotofacil.lotofacil_externo_interno.ltf_id = lotofacil.lotofacil_primo.ltf_id
    and lotofacil.lotofacil_primo.ltf_id = lotofacil.lotofacil_horizontal.ltf_id
    and lotofacil.lotofacil_horizontal.ltf_id = lotofacil.lotofacil_vertical.ltf_id
    and lotofacil.lotofacil_vertical.ltf_id = lotofacil.lotofacil_diagonal.ltf_id
    and lotofacil.lotofacil_diagonal.ltf_id = lotofacil.lotofacil_cruzeta.ltf_id
    and lotofacil.lotofacil_cruzeta.ltf_id = lotofacil.lotofacil_quarteto.ltf_id
    and lotofacil.lotofacil_quarteto.ltf_id = lotofacil.lotofacil_b1.ltf_id
    and lotofacil.lotofacil_b1.ltf_id = lotofacil.lotofacil_b1_b4_b8_b12_b15.ltf_id
    and lotofacil.lotofacil_b1_b4_b8_b12_b15.ltf_id = lotofacil.lotofacil_b1_b8_b15.ltf_id
    and lotofacil.lotofacil_b1_b8_b15.ltf_id = lotofacil.lotofacil_b1_b15.ltf_id;

  END;$$;




/**
  Após criar as tabelas, iremos criar funções pra popular os dados destas tabelas.
 */

drop function if EXISTS lotofacil.fn_lotofacil_num();
create function lotofacil.fn_lotofacil_num()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    col_1                    NUMERIC DEFAULT 0;
    col_2                    NUMERIC DEFAULT 0;
    col_3                    NUMERIC DEFAULT 0;
    col_4                    NUMERIC DEFAULT 0;
    col_5                    NUMERIC DEFAULT 0;
    col_6                    NUMERIC DEFAULT 0;
    col_7                    NUMERIC DEFAULT 0;
    col_8                    NUMERIC DEFAULT 0;
    col_9                    NUMERIC DEFAULT 0;
    col_10                   NUMERIC DEFAULT 0;
    col_11                   NUMERIC DEFAULT 0;
    col_12                   NUMERIC DEFAULT 0;
    col_13                   NUMERIC DEFAULT 0;
    col_14                   NUMERIC DEFAULT 0;
    col_15                   NUMERIC DEFAULT 0;
    col_16                   NUMERIC DEFAULT 0;
    col_17                   NUMERIC DEFAULT 0;
    col_18                   NUMERIC DEFAULT 0;
    
    lotofacil_num           numeric[26];
    indiceRegistro          numeric default 0;
  begin
    indiceRegistro := 0;    
    
    for col_1 in 1..25 LOOP 
      for col_2 in (col_1 + 1)..25 LOOP
        for col_3 in (col_2 + 1)..25 LOOP 
          for col_4 in (col_3 + 1)..25 LOOP
            for col_5 in (col_4 + 1)..25 LOOP 
              for col_6 in (col_5 + 1)..25 LOOP 
                for col_7 in (col_6 + 1)..25 LOOP 
                  for col_8 in (col_7 + 1)..25 LOOP 
                    for col_9 in (col_8 + 1)..25 LOOP 
                      for col_10 in (col_9 + 1)..25 LOOP 
                        for col_11 in (col_10 + 1)..25 LOOP 
                          for col_12 in (col_11 + 1)..25 LOOP 
                            for col_13 in (col_12 + 1)..25 LOOP 
                              for col_14 in (col_13 + 1)..25 LOOP 
                                for col_15 in (col_14 + 1)..25 LOOP
                                  lotofacil_num[1] := 0; lotofacil_num[2] := 0; lotofacil_num[3] := 0; lotofacil_num[4] := 0;
                                  lotofacil_num[5] := 0; lotofacil_num[6] := 0; lotofacil_num[7] := 0; lotofacil_num[8] := 0;
                                  lotofacil_num[9] := 0; lotofacil_num[10] := 0; lotofacil_num[11] := 0; lotofacil_num[12] := 0;
                                  lotofacil_num[13] := 0; lotofacil_num[14] := 0; lotofacil_num[15] := 0; lotofacil_num[16] := 0;
                                  lotofacil_num[17] := 0; lotofacil_num[18] := 0; lotofacil_num[19] := 0; lotofacil_num[20] := 0;
                                  lotofacil_num[21] := 0; lotofacil_num[22] := 0; lotofacil_num[23] := 0; lotofacil_num[24] := 0;
                                  lotofacil_num[25] := 0;

                                  lotofacil_num[col_1] := 1; lotofacil_num[col_2] := 1; lotofacil_num[col_3] := 1;
                                  lotofacil_num[col_4] := 1; lotofacil_num[col_5] := 1; lotofacil_num[col_6] := 1;
                                  lotofacil_num[col_7] := 1; lotofacil_num[col_8] := 1; lotofacil_num[col_9] := 1;
                                  lotofacil_num[col_10] := 1; lotofacil_num[col_11] := 1; lotofacil_num[col_12] := 1;
                                  lotofacil_num[col_13] := 1; lotofacil_num[col_14] := 1; lotofacil_num[col_15] := 1;

                                  indiceRegistro := indiceRegistro + 1;

                                  Insert into lotofacil.lotofacil_num(ltf_id, ltf_qt, num_1, num_2, num_3, num_4, num_5,
                                                                      num_6, num_7, num_8, num_9, num_10, num_11, num_12,
                                                                      num_13, num_14, num_15, num_16, num_17, num_18,
                                                                      num_19, num_20, num_21, num_22, num_23, num_24,
                                                                      num_25) VALUES (
                                    indiceRegistro, 15, lotofacil_num[1], lotofacil_num[2], lotofacil_num[3], lotofacil_num[4],
                                    lotofacil_num[5], lotofacil_num[6], lotofacil_num[7], lotofacil_num[8], lotofacil_num[9],
                                    lotofacil_num[10], lotofacil_num[11], lotofacil_num[12], lotofacil_num[13], lotofacil_num[14],
                                    lotofacil_num[15], lotofacil_num[16], lotofacil_num[17], lotofacil_num[18], lotofacil_num[19],
                                    lotofacil_num[20], lotofacil_num[21], lotofacil_num[22], lotofacil_num[23], lotofacil_num[24],
                                    lotofacil_num[25]
                                  );


                                  for col_16 in (col_15 + 1)..25 LOOP
                                    lotofacil_num[1] := 0; lotofacil_num[2] := 0; lotofacil_num[3] := 0; lotofacil_num[4] := 0;
                                    lotofacil_num[5] := 0; lotofacil_num[6] := 0; lotofacil_num[7] := 0; lotofacil_num[8] := 0;
                                    lotofacil_num[9] := 0; lotofacil_num[10] := 0; lotofacil_num[11] := 0; lotofacil_num[12] := 0;
                                    lotofacil_num[13] := 0; lotofacil_num[14] := 0; lotofacil_num[15] := 0; lotofacil_num[16] := 0;
                                    lotofacil_num[17] := 0; lotofacil_num[18] := 0; lotofacil_num[19] := 0; lotofacil_num[20] := 0;
                                    lotofacil_num[21] := 0; lotofacil_num[22] := 0; lotofacil_num[23] := 0; lotofacil_num[24] := 0;
                                    lotofacil_num[25] := 0;

                                    lotofacil_num[col_1] := 1; lotofacil_num[col_2] := 1; lotofacil_num[col_3] := 1;
                                    lotofacil_num[col_4] := 1; lotofacil_num[col_5] := 1; lotofacil_num[col_6] := 1;
                                    lotofacil_num[col_7] := 1; lotofacil_num[col_8] := 1; lotofacil_num[col_9] := 1;
                                    lotofacil_num[col_10] := 1; lotofacil_num[col_11] := 1; lotofacil_num[col_12] := 1;
                                    lotofacil_num[col_13] := 1; lotofacil_num[col_14] := 1; lotofacil_num[col_15] := 1;
                                    lotofacil_num[col_16] := 1;

                                    indiceRegistro := indiceRegistro + 1;

                                    Insert into lotofacil.lotofacil_num(ltf_id, ltf_qt, num_1, num_2, num_3, num_4, num_5,
                                                                        num_6, num_7, num_8, num_9, num_10, num_11, num_12,
                                                                        num_13, num_14, num_15, num_16, num_17, num_18,
                                                                        num_19, num_20, num_21, num_22, num_23, num_24,
                                                                        num_25) VALUES (
                                      indiceRegistro, 16, lotofacil_num[1], lotofacil_num[2], lotofacil_num[3], lotofacil_num[4],
                                      lotofacil_num[5], lotofacil_num[6], lotofacil_num[7], lotofacil_num[8], lotofacil_num[9],
                                      lotofacil_num[10], lotofacil_num[11], lotofacil_num[12], lotofacil_num[13], lotofacil_num[14],
                                      lotofacil_num[15], lotofacil_num[16], lotofacil_num[17], lotofacil_num[18], lotofacil_num[19],
                                      lotofacil_num[20], lotofacil_num[21], lotofacil_num[22], lotofacil_num[23], lotofacil_num[24],
                                      lotofacil_num[25]
                                    );

                                    for col_17 in (col_16 + 1)..25 LOOP
                                      lotofacil_num[1] := 0; lotofacil_num[2] := 0; lotofacil_num[3] := 0; lotofacil_num[4] := 0;
                                      lotofacil_num[5] := 0; lotofacil_num[6] := 0; lotofacil_num[7] := 0; lotofacil_num[8] := 0;
                                      lotofacil_num[9] := 0; lotofacil_num[10] := 0; lotofacil_num[11] := 0; lotofacil_num[12] := 0;
                                      lotofacil_num[13] := 0; lotofacil_num[14] := 0; lotofacil_num[15] := 0; lotofacil_num[16] := 0;
                                      lotofacil_num[17] := 0; lotofacil_num[18] := 0; lotofacil_num[19] := 0; lotofacil_num[20] := 0;
                                      lotofacil_num[21] := 0; lotofacil_num[22] := 0; lotofacil_num[23] := 0; lotofacil_num[24] := 0;
                                      lotofacil_num[25] := 0;

                                      lotofacil_num[col_1] := 1; lotofacil_num[col_2] := 1; lotofacil_num[col_3] := 1;
                                      lotofacil_num[col_4] := 1; lotofacil_num[col_5] := 1; lotofacil_num[col_6] := 1;
                                      lotofacil_num[col_7] := 1; lotofacil_num[col_8] := 1; lotofacil_num[col_9] := 1;
                                      lotofacil_num[col_10] := 1; lotofacil_num[col_11] := 1; lotofacil_num[col_12] := 1;
                                      lotofacil_num[col_13] := 1; lotofacil_num[col_14] := 1; lotofacil_num[col_15] := 1;
                                      lotofacil_num[col_16] := 1; lotofacil_num[col_17] := 1;

                                      indiceRegistro := indiceRegistro + 1;

                                      Insert into lotofacil.lotofacil_num(ltf_id, ltf_qt, num_1, num_2, num_3, num_4, num_5,
                                                                          num_6, num_7, num_8, num_9, num_10, num_11, num_12,
                                                                          num_13, num_14, num_15, num_16, num_17, num_18,
                                                                          num_19, num_20, num_21, num_22, num_23, num_24,
                                                                          num_25) VALUES (
                                        indiceRegistro, 17, lotofacil_num[1], lotofacil_num[2], lotofacil_num[3], lotofacil_num[4],
                                        lotofacil_num[5], lotofacil_num[6], lotofacil_num[7], lotofacil_num[8], lotofacil_num[9],
                                        lotofacil_num[10], lotofacil_num[11], lotofacil_num[12], lotofacil_num[13], lotofacil_num[14],
                                        lotofacil_num[15], lotofacil_num[16], lotofacil_num[17], lotofacil_num[18], lotofacil_num[19],
                                        lotofacil_num[20], lotofacil_num[21], lotofacil_num[22], lotofacil_num[23], lotofacil_num[24],
                                        lotofacil_num[25]
                                      );

                                        for col_18 in (col_17 + 1)..25 LOOP
                                          lotofacil_num[1] := 0; lotofacil_num[2] := 0; lotofacil_num[3] := 0; lotofacil_num[4] := 0;
                                          lotofacil_num[5] := 0; lotofacil_num[6] := 0; lotofacil_num[7] := 0; lotofacil_num[8] := 0;
                                          lotofacil_num[9] := 0; lotofacil_num[10] := 0; lotofacil_num[11] := 0; lotofacil_num[12] := 0;
                                          lotofacil_num[13] := 0; lotofacil_num[14] := 0; lotofacil_num[15] := 0; lotofacil_num[16] := 0;
                                          lotofacil_num[17] := 0; lotofacil_num[18] := 0; lotofacil_num[19] := 0; lotofacil_num[20] := 0;
                                          lotofacil_num[21] := 0; lotofacil_num[22] := 0; lotofacil_num[23] := 0; lotofacil_num[24] := 0;
                                          lotofacil_num[25] := 0;

                                          lotofacil_num[col_1] := 1; lotofacil_num[col_2] := 1; lotofacil_num[col_3] := 1;
                                          lotofacil_num[col_4] := 1; lotofacil_num[col_5] := 1; lotofacil_num[col_6] := 1;
                                          lotofacil_num[col_7] := 1; lotofacil_num[col_8] := 1; lotofacil_num[col_9] := 1;
                                          lotofacil_num[col_10] := 1; lotofacil_num[col_11] := 1; lotofacil_num[col_12] := 1;
                                          lotofacil_num[col_13] := 1; lotofacil_num[col_14] := 1; lotofacil_num[col_15] := 1;
                                          lotofacil_num[col_16] := 1; lotofacil_num[col_17] := 1; lotofacil_num[col_18] := 1;

                                          indiceRegistro := indiceRegistro + 1;

                                          Insert into lotofacil.lotofacil_num(ltf_id, ltf_qt, num_1, num_2, num_3, num_4, num_5,
                                                                              num_6, num_7, num_8, num_9, num_10, num_11, num_12,
                                                                              num_13, num_14, num_15, num_16, num_17, num_18,
                                                                              num_19, num_20, num_21, num_22, num_23, num_24,
                                                                              num_25) VALUES (
                                            indiceRegistro, 18, lotofacil_num[1], lotofacil_num[2], lotofacil_num[3], lotofacil_num[4],
                                            lotofacil_num[5], lotofacil_num[6], lotofacil_num[7], lotofacil_num[8], lotofacil_num[9],
                                            lotofacil_num[10], lotofacil_num[11], lotofacil_num[12], lotofacil_num[13], lotofacil_num[14],
                                            lotofacil_num[15], lotofacil_num[16], lotofacil_num[17], lotofacil_num[18], lotofacil_num[19],
                                            lotofacil_num[20], lotofacil_num[21], lotofacil_num[22], lotofacil_num[23], lotofacil_num[24],
                                            lotofacil_num[25]
                                          );

                                          Raise Notice 'Lotofacil_num %', indiceRegistro;
                                        END LOOP;
                                    END LOOP;
                                  END LOOP;
                                END LOOP;
                              END LOOP;
                            END LOOP;
                          END LOOP;
                        END LOOP;
                      END LOOP;
                    END LOOP;
                  END LOOP;
                END LOOP;
              END LOOP;
            END LOOP;            
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
  end $$;

drop function if EXISTS lotofacil.fn_lotofacil_bolas();
create function lotofacil.fn_lotofacil_bolas()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    col_1                    NUMERIC DEFAULT 0;
    col_2                    NUMERIC DEFAULT 0;
    col_3                    NUMERIC DEFAULT 0;
    col_4                    NUMERIC DEFAULT 0;
    col_5                    NUMERIC DEFAULT 0;
    col_6                    NUMERIC DEFAULT 0;
    col_7                    NUMERIC DEFAULT 0;
    col_8                    NUMERIC DEFAULT 0;
    col_9                    NUMERIC DEFAULT 0;
    col_10                   NUMERIC DEFAULT 0;
    col_11                   NUMERIC DEFAULT 0;
    col_12                   NUMERIC DEFAULT 0;
    col_13                   NUMERIC DEFAULT 0;
    col_14                   NUMERIC DEFAULT 0;
    col_15                   NUMERIC DEFAULT 0;
    col_16                   NUMERIC DEFAULT 0;
    col_17                   NUMERIC DEFAULT 0;
    col_18                   NUMERIC DEFAULT 0;

    lotofacil_num           numeric[26];
    indiceRegistro          numeric default 0;
  begin
    indiceRegistro := 0;

    for col_1 in 1..25 LOOP
    for col_2 in (col_1 + 1)..25 LOOP
    for col_3 in (col_2 + 1)..25 LOOP
    for col_4 in (col_3 + 1)..25 LOOP
    for col_5 in (col_4 + 1)..25 LOOP
    for col_6 in (col_5 + 1)..25 LOOP
    for col_7 in (col_6 + 1)..25 LOOP
    for col_8 in (col_7 + 1)..25 LOOP
    for col_9 in (col_8 + 1)..25 LOOP
    for col_10 in (col_9 + 1)..25 LOOP
    for col_11 in (col_10 + 1)..25 LOOP
    for col_12 in (col_11 + 1)..25 LOOP
    for col_13 in (col_12 + 1)..25 LOOP
    for col_14 in (col_13 + 1)..25 LOOP
    for col_15 in (col_14 + 1)..25 LOOP

      indiceRegistro := indiceRegistro + 1;
      Insert into lotofacil.lotofacil_bolas
      (ltf_id, ltf_qt, b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13, b_14, b_15)
      values(indiceRegistro, 15, col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8, col_9, col_10,
      col_11, col_12, col_13, col_14, col_15);
      Raise Notice 'id: %', indiceRegistro;

      for col_16 in (col_15 + 1)..25 LOOP
        indiceRegistro := indiceRegistro + 1;
        Insert into lotofacil.lotofacil_bolas
        (ltf_id, ltf_qt, b_1, b_2, b_3, b_4, b_5,
        b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13, b_14, b_15, b_16)
        VALUES (indiceRegistro, 16, col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8, col_9, col_10,
        col_11, col_12, col_13, col_14, col_15, col_16);
        Raise Notice 'id: %', indiceRegistro;

        for col_17 in (col_16 + 1)..25 LOOP
          indiceRegistro := indiceRegistro + 1;
          Insert into lotofacil.lotofacil_bolas
          (ltf_id, ltf_qt, b_1, b_2, b_3, b_4, b_5,b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13,
          b_14, b_15, b_16, b_17)
          values(indiceRegistro, 17, col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8, col_9, col_10,
          col_11, col_12, col_13, col_14, col_15, col_16, col_17);
          Raise Notice 'id: %', indiceRegistro;

          for col_18 in (col_17 + 1)..25 LOOP

            indiceRegistro := indiceRegistro + 1;

            Insert into lotofacil.lotofacil_bolas (ltf_id, ltf_qt, b_1, b_2, b_3, b_4,
                                                   b_5,b_6, b_7, b_8, b_9, b_10, b_11,
                                                   b_12, b_13,b_14, b_15, b_16, b_17, b_18)
            values(indiceRegistro, 18, col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8, col_9, col_10,
            col_11, col_12, col_13, col_14, col_15, col_16, col_17, col_18);
            Raise Notice 'id: %', indiceRegistro;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
      END LOOP;
  end $$;

drop function if EXISTS lotofacil.fn_lotofacil_inserir();
create function lotofacil.fn_lotofacil_inserir()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    lotofacil_num numeric[26];
    reg_lotofacil_num lotofacil.lotofacil_num%ROWtype;
    lotofacil_id numeric;
    lotofacil_qt numeric;
  begin

    for reg_lotofacil_num IN
      Select *
        from lotofacil.lotofacil_num
      order by ltf_id ASC
    LOOP
      lotofacil_id := reg_lotofacil_num.ltf_id;
      lotofacil_qt := reg_lotofacil_num.ltf_qt;

      lotofacil_num [1] := reg_lotofacil_num.num_1;
      lotofacil_num [2] := reg_lotofacil_num.num_2;
      lotofacil_num [3] := reg_lotofacil_num.num_3;
      lotofacil_num [4] := reg_lotofacil_num.num_4;
      lotofacil_num [5] := reg_lotofacil_num.num_5;
      lotofacil_num [6] := reg_lotofacil_num.num_6;
      lotofacil_num [7] := reg_lotofacil_num.num_7;
      lotofacil_num [8] := reg_lotofacil_num.num_8;
      lotofacil_num [9] := reg_lotofacil_num.num_9;
      lotofacil_num [10] := reg_lotofacil_num.num_10;
      lotofacil_num [11] := reg_lotofacil_num.num_11;
      lotofacil_num [12] := reg_lotofacil_num.num_12;
      lotofacil_num [13] := reg_lotofacil_num.num_13;
      lotofacil_num [14] := reg_lotofacil_num.num_14;
      lotofacil_num [15] := reg_lotofacil_num.num_15;
      lotofacil_num [16] := reg_lotofacil_num.num_16;
      lotofacil_num [17] := reg_lotofacil_num.num_17;
      lotofacil_num [18] := reg_lotofacil_num.num_18;
      lotofacil_num [19] := reg_lotofacil_num.num_19;
      lotofacil_num [20] := reg_lotofacil_num.num_20;
      lotofacil_num [21] := reg_lotofacil_num.num_21;
      lotofacil_num [22] := reg_lotofacil_num.num_22;
      lotofacil_num [23] := reg_lotofacil_num.num_23;
      lotofacil_num [24] := reg_lotofacil_num.num_24;
      lotofacil_num [25] := reg_lotofacil_num.num_25;

      Raise Notice 'lotofacil_id %', lotofacil_id;
      Execute lotofacil.fn_lotofacil_par_impar(lotofacil_id, lotofacil_qt, lotofacil_num);
      Execute lotofacil.fn_lotofacil_externo_interno (lotofacil_id, lotofacil_qt, lotofacil_num);
      Execute lotofacil.fn_lotofacil_primo(lotofacil_id, lotofacil_qt, lotofacil_num);

      Execute lotofacil.fn_lotofacil_horizontal(lotofacil_id, lotofacil_qt, lotofacil_num);
      Execute lotofacil.fn_lotofacil_vertical(lotofacil_id, lotofacil_qt, lotofacil_num);
      Execute lotofacil.fn_lotofacil_diagonal(lotofacil_id, lotofacil_qt, lotofacil_num);
      Execute lotofacil.fn_lotofacil_cruzeta(lotofacil_id, lotofacil_qt, lotofacil_num);
      Execute lotofacil.fn_lotofacil_quarteto(lotofacil_id, lotofacil_qt, lotofacil_num);

    END LOOP;
  end $$;

drop function if exists lotofacil.fn_lotofacil_par_impar(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_par_impar(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
    qt_pares numeric default 0;
    qt_impares numeric default 0;
  BEGIN
    qt_pares := resultado_num[2] + resultado_num[4] + resultado_num[6] + resultado_num[8] +
                resultado_num[10] + resultado_num[12] + resultado_num[14] + resultado_num[16] + resultado_num[18] +
                resultado_num[20] + resultado_num[22] + resultado_num[24];
    qt_impares := resultado_num[1] + resultado_num[3] + resultado_num[5] + resultado_num[7] + resultado_num[9] +
                 resultado_num[11] + resultado_num[13] + resultado_num[15] + resultado_num[17] + resultado_num[19] +
                 resultado_num[21] + resultado_num[23] + resultado_num[25];

    Raise Notice 'Registro: %, Par: %, Impar: %', lotofacil_id, qt_pares, qt_impares;

    Insert into lotofacil.lotofacil_par_impar (ltf_id, ltf_qt, par_impar_id)
      Select lotofacil_id, lotofacil_qt, par_impar_id from lotofacil.lotofacil_id_par_impar
    where par = qt_pares and impar = qt_impares;
  END;$$;


drop function if exists lotofacil.fn_lotofacil_externo_interno(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_externo_interno(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_externo numeric default 0;
  qt_interno numeric default 0;
begin
  qt_externo := 0;
  qt_externo := qt_externo + resultado_num[1] + resultado_num[2] + resultado_num[3] + resultado_num[4] + resultado_num[5];
  qt_externo := qt_externo + resultado_num[6] + resultado_num[10];
  qt_externo := qt_externo + resultado_num[11] + resultado_num[15];
  qt_externo := qt_externo + resultado_num[16] + resultado_num[20];
  qt_externo := qt_externo + resultado_num[21] + resultado_num[22] +
                resultado_num[23] + resultado_num[24] + resultado_num[25];

  qt_interno := 0;
  qt_interno := qt_interno + resultado_num[7] + resultado_num[8] + resultado_num[9];
  qt_interno := qt_interno + resultado_num[12] + resultado_num[13] + resultado_num[14];
  qt_interno := qt_interno + resultado_num[17] + resultado_num[18] + resultado_num[19];

  Raise Notice 'Externo x Interno: %', lotofacil_id;

  Insert into lotofacil.lotofacil_externo_interno (ltf_id, ltf_qt, ext_id, int_id)
    Select lotofacil_id, lotofacil_qt, ext_id, int_id from lotofacil.lotofacil_id_externo_interno
  where externo = qt_externo and interno = qt_interno
  and ext_int_qt = lotofacil_qt;

end $$;

drop function if exists lotofacil.fn_lotofacil_primo(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_primo(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_primo numeric default 0;
  qt_nao_primo numeric default 0;
begin
  qt_primo := resultado_num[2] + resultado_num[3] + resultado_num[5] + resultado_num[7] + resultado_num[11] +
              resultado_num[13] + resultado_num[17] + resultado_num[19] + resultado_num[23];
  qt_nao_primo := resultado_num[1] + resultado_num[4] + resultado_num[6] + resultado_num[8] +
              resultado_num[9] + resultado_num[10] + resultado_num[12] + resultado_num[14] + resultado_num[15] +
              resultado_num[16] + resultado_num[18] + resultado_num[20] + resultado_num[21] + resultado_num[22] +
              resultado_num[24] + resultado_num[25];

  if not (qt_primo + qt_nao_primo in (15, 16, 17, 18)) THEN
    Raise EXCEPTION 'Erro, primo, total de bolas diferente de 15, 16, 17 e 18';
    exit;
  END IF;


  Raise Notice 'Primo: %', lotofacil_id;

  Insert into lotofacil.lotofacil_primo(ltf_id, ltf_qt, prm_id)
    Select lotofacil_id, lotofacil_qt, prm_id from lotofacil.lotofacil_id_primo
  where primo = qt_primo and nao_primo = qt_nao_primo;

end;$$;


drop function if exists lotofacil.fn_lotofacil_horizontal(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_horizontal(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_hrz_1 numeric default 0;
  qt_hrz_2 numeric default 0;
  qt_hrz_3 numeric default 0;
  qt_hrz_4 numeric default 0;
  qt_hrz_5 numeric default 0;
begin
  qt_hrz_1 := resultado_num[1] + resultado_num[2] + resultado_num[3] + resultado_num[4] + resultado_num[5];
  qt_hrz_2 := resultado_num[6] + resultado_num[7] + resultado_num[8] + resultado_num[9] + resultado_num[10];
  qt_hrz_3 := resultado_num[11] + resultado_num[12] + resultado_num[13] + resultado_num[14] + resultado_num[15];
  qt_hrz_4 := resultado_num[16] + resultado_num[17] + resultado_num[18] + resultado_num[19] + resultado_num[20];
  qt_hrz_5 := resultado_num[21] + resultado_num[22] + resultado_num[23] + resultado_num[24] + resultado_num[25];

  Raise Notice 'Horizonta: %', lotofacil_id;


  Insert into lotofacil.lotofacil_horizontal (ltf_id, ltf_qt, hrz_id)
    Select lotofacil_id, lotofacil_qt, hrz_id from lotofacil.lotofacil_id_horizontal
  where hrz_1 = qt_hrz_1 and hrz_2 = qt_hrz_2 and hrz_3 = qt_hrz_3 and hrz_4 = qt_hrz_4 and hrz_5 = qt_hrz_5
  and hrz_qt = lotofacil_qt;

end $$;


drop function if exists lotofacil.fn_lotofacil_vertical(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_vertical(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_vrt_1 numeric default 0;
  qt_vrt_2 numeric default 0;
  qt_vrt_3 numeric default 0;
  qt_vrt_4 numeric default 0;
  qt_vrt_5 numeric default 0;
begin

  qt_vrt_1 := resultado_num[1] + resultado_num[6] + resultado_num[11] + resultado_num[16] + resultado_num[21];
  qt_vrt_2 := resultado_num[2] + resultado_num[7] + resultado_num[12] + resultado_num[17] + resultado_num[22];
  qt_vrt_3 := resultado_num[3] + resultado_num[8] + resultado_num[13] + resultado_num[18] + resultado_num[23];
  qt_vrt_4 := resultado_num[4] + resultado_num[9] + resultado_num[14] + resultado_num[19] + resultado_num[24];
  qt_vrt_5 := resultado_num[5] + resultado_num[10] + resultado_num[15] + resultado_num[20] + resultado_num[25];

  raise NOTICE 'Vertical: %', lotofacil_id;
  Insert into lotofacil.lotofacil_vertical (ltf_id, ltf_qt, vrt_id)
    Select lotofacil_id, lotofacil_qt, vrt_id from lotofacil.lotofacil_id_vertical
  where vrt_1 = qt_vrt_1 and vrt_2 = qt_vrt_2 and vrt_3 = qt_vrt_3 and vrt_4 = qt_vrt_4 and vrt_5 = qt_vrt_5;

end $$;

drop function if exists lotofacil.fn_lotofacil_diagonal(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_diagonal(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_dg_1 numeric default 0;
  qt_dg_2 numeric default 0;
  qt_dg_3 numeric default 0;
  qt_dg_4 numeric default 0;
  qt_dg_5 numeric default 0;
begin
  qt_dg_1 := resultado_num[1] + resultado_num[7] + resultado_num[13] + resultado_num[19] + resultado_num[25];
  qt_dg_2 := resultado_num[2] + resultado_num[8] + resultado_num[14] + resultado_num[20] + resultado_num[21];
  qt_dg_3 := resultado_num[3] + resultado_num[9] + resultado_num[15] + resultado_num[16] + resultado_num[22];
  qt_dg_4 := resultado_num[4] + resultado_num[10] + resultado_num[11] + resultado_num[17] + resultado_num[23];
  qt_dg_5 := resultado_num[5] + resultado_num[6] + resultado_num[12] + resultado_num[18] + resultado_num[24];

  raise NOTICE 'Vertical: %', lotofacil_id;
  Insert into lotofacil.lotofacil_diagonal (ltf_id, ltf_qt, dg_id)
    Select lotofacil_id, lotofacil_qt, dg_id from lotofacil.lotofacil_id_diagonal
  where dg_1 = qt_dg_1 and dg_2 = qt_dg_2 and dg_3 = qt_dg_3 and dg_4 = qt_dg_4 and dg_5 = qt_dg_5;
end $$;


drop function if exists lotofacil.fn_lotofacil_cruzeta(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_cruzeta(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_crz_1 numeric default 0;
  qt_crz_2 numeric default 0;
  qt_crz_3 numeric default 0;
  qt_crz_4 numeric default 0;
  qt_crz_5 numeric default 0;
begin
  qt_crz_1 := resultado_num[1] + resultado_num[2] + resultado_num[6] + resultado_num[7] + resultado_num[11];
  qt_crz_2 := resultado_num[4] + resultado_num[5] + resultado_num[9] + resultado_num[10] + resultado_num[15];
  qt_crz_3 := resultado_num[3] + resultado_num[8] + resultado_num[13] + resultado_num[18] + resultado_num[23];
  qt_crz_4 := resultado_num[12] + resultado_num[16] + resultado_num[17] + resultado_num[21] + resultado_num[22];
  qt_crz_5 := resultado_num[14] + resultado_num[19] + resultado_num[20] + resultado_num[24] + resultado_num[25];

  raise NOTICE 'Vertical: %', lotofacil_id;
  Insert into lotofacil.lotofacil_cruzeta (ltf_id, ltf_qt, crz_id)
    Select lotofacil_id, lotofacil_qt, crz_id from lotofacil.lotofacil_id_cruzeta
  where crz_1 = qt_crz_1 and crz_2 = qt_crz_2 and crz_3 = qt_crz_3 and crz_4 = qt_crz_4 and crz_5 = qt_crz_5;
end $$;

drop function if exists lotofacil.fn_lotofacil_quarteto(numeric, numeric, numeric[]);
create function lotofacil.fn_lotofacil_quarteto(lotofacil_id numeric, lotofacil_qt numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_qrt_1 numeric default 0;
  qt_qrt_2 numeric default 0;
  qt_qrt_3 numeric default 0;
  qt_qrt_4 numeric default 0;
  qt_qrt_5 numeric default 0;
  qt_qrt_6 numeric default 0;
begin
  qt_qrt_1 := resultado_num[1] + resultado_num[2] + resultado_num[13] + resultado_num[14];
  qt_qrt_2 := resultado_num[3] + resultado_num[4] + resultado_num[15] + resultado_num[16];
  qt_qrt_3 := resultado_num[5] + resultado_num[6] + resultado_num[17] + resultado_num[18];
  qt_qrt_4 := resultado_num[7] + resultado_num[8] + resultado_num[19] + resultado_num[20];
  qt_qrt_5 := resultado_num[9] + resultado_num[10] + resultado_num[21] + resultado_num[22];
  qt_qrt_6 := resultado_num[11] + resultado_num[12] + resultado_num[23] + resultado_num[24] + resultado_num[25];

  raise NOTICE 'Vertical: %', lotofacil_id;
  Insert into lotofacil.lotofacil_quarteto (ltf_id, ltf_qt, qrt_id)
    Select lotofacil_id, lotofacil_qt, qrt_id from lotofacil.lotofacil_id_quarteto
  where qrt_1 = qt_qrt_1 and qrt_2 = qt_qrt_2 and qrt_3 = qt_qrt_3 and
        qrt_4 = qt_qrt_4 and qrt_5 = qt_qrt_5 and qrt_6 = qt_qrt_6;
end $$;


drop function if exists lotofacil.fn_lotofacil_gerar_grupos();
create function lotofacil.fn_lotofacil_gerar_grupos()
  returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
    regLotofacil_Bolas lotofacil.lotofacil_bolas%ROWTYPE;
    ltf_bolas numeric[26];
  BEGIN
    for regLotofacil_Bolas in 
      Select * from lotofacil.lotofacil_bolas
      order by ltf_id LOOP 
        ltf_bolas[1] := regLotofacil_Bolas.b_1;
        ltf_bolas[2] := regLotofacil_Bolas.b_2;
        ltf_bolas[3] := regLotofacil_Bolas.b_3;
        ltf_bolas[4] := regLotofacil_Bolas.b_4;
        ltf_bolas[5] := regLotofacil_Bolas.b_5;
        ltf_bolas[6] := regLotofacil_Bolas.b_6;
        ltf_bolas[7] := regLotofacil_Bolas.b_7;
        ltf_bolas[8] := regLotofacil_Bolas.b_8;
        ltf_bolas[9] := regLotofacil_Bolas.b_9;
        ltf_bolas[10] := regLotofacil_Bolas.b_10;
        ltf_bolas[11] := regLotofacil_Bolas.b_11;
        ltf_bolas[12] := regLotofacil_Bolas.b_12;
        ltf_bolas[13] := regLotofacil_Bolas.b_13;
        ltf_bolas[14] := regLotofacil_Bolas.b_14;
        ltf_bolas[15] := regLotofacil_bolas.b_15;
        ltf_bolas[16] := regLotofacil_Bolas.b_16;
        ltf_bolas[17] := regLotofacil_bolas.b_17;
        ltf_bolas[18] := regLotofacil_bolas.b_18;

      Raise Notice 'grupos: %', regLotofacil_Bolas.ltf_id;
      Execute lotofacil.fn_lotofacil_grupos(regLotofacil_Bolas.ltf_id, regLotofacil_Bolas.ltf_qt, ltf_bolas);
      
    END LOOP;
  END $$;


drop function if exists lotofacil.fn_lotofacil_grupos(numeric, numeric,  numeric[]);
create function lotofacil.fn_lotofacil_grupos(lotofacil_id numeric, lotofacil_qt numeric, lotofacil_bolas numeric[])
  returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
    uA numeric default 0;
    uB numeric default 0;
    uC numeric default 0;
    uD numeric default 0;
    uE numeric default 0;
  BEGIN

    for uA in 1..lotofacil_qt LOOP
      for uB in (uA + 1)..lotofacil_qt loop
        Insert into lotofacil.lotofacil_grupo_2bolas(ltf_id, ltf_qt, grp_id)
          Select lotofacil_id, lotofacil_qt, grp_id from lotofacil.lotofacil_id_grupo_2bolas
            where bola1 = lotofacil_bolas[uA] AND
              bola2 = lotofacil_bolas[uB];
      END LOOP;
    END LOOP;

    for uA in 1..lotofacil_qt LOOP
      for uB in (uA + 1)..lotofacil_qt loop
        for uC in (uB + 1)..lotofacil_qt loop
          Insert into lotofacil.lotofacil_grupo_3bolas(ltf_id,ltf_qt, grp_id)
            Select lotofacil_id, lotofacil_qt, grp_id from lotofacil.lotofacil_id_grupo_3bolas
            where bola1 = lotofacil_bolas[uA] AND
              bola2 = lotofacil_bolas[uB] AND
              bola3 = lotofacil_bolas[uC];
        END LOOP ;
      END LOOP;
    END LOOP;

    for uA in 1..lotofacil_qt LOOP
      for uB in (uA + 1)..lotofacil_qt loop
        for uC in (uB + 1)..lotofacil_qt loop
          for uD in (uC + 1)..lotofacil_qt loop
            Insert into lotofacil.lotofacil_grupo_4bolas(ltf_id, ltf_qt, grp_id)
            Select lotofacil_id, lotofacil_qt, grp_id from lotofacil.lotofacil_id_grupo_4bolas
            where bola1 = lotofacil_bolas[uA] AND
              bola2 = lotofacil_bolas[uB] AND
              bola3 = lotofacil_bolas[uC] and
              bola4 = lotofacil_bolas[uD];

          END LOOP;
        END LOOP ;
      END LOOP;
    END LOOP;


    for uA in 1..lotofacil_qt LOOP
      for uB in (uA + 1)..lotofacil_qt loop
        for uC in (uB + 1)..lotofacil_qt loop
          for uD in (uC + 1)..lotofacil_qt loop
            for uE in (uD + 1)..lotofacil_qt loop
              Insert into lotofacil.lotofacil_grupo_5bolas(ltf_id, ltf_qt, grp_id)
              Select lotofacil_id, lotofacil_qt, grp_id from lotofacil.lotofacil_id_grupo_5bolas
              where bola1 = lotofacil_bolas[uA] AND
                bola2 = lotofacil_bolas[uB] AND
                bola3 = lotofacil_bolas[uC] and
                bola4 = lotofacil_bolas[uD] AND
                bola5 = lotofacil_bolas[uE];
            END LOOP;
          END LOOP;
        END LOOP ;
      END LOOP;
    END LOOP;
  END;$$;
comment on table lotofacil.lotofacil_grupo_2bolas IS
'Cada jogo, tem vários grupos, se fosse criar uma tabela, com cada campo, exemplo, bola1, bola2, '
' para o grupo 2, pra recuperar tais grupos, devemos criar um campo separado com o sql, coisa que já '
' feita antes e não é nada produtivo.'
' O que foi feito, foi criar uma tabela, com todas as combinações de 2 bolas, 3 bolas, até chegar a '
' 5 bolas, ou seja, grupos de 2 bolas, grupos de 3 bolas, grupos de 4 bolas e grupos de 5 bolas'
' nesta tabela, há um campo com um id único pra cada combinação possível.'
' O que esta função faz simplesmente, é pegar cada grupo que está em um jogo específico e inserir um '
' id, este id identifica cada combinação.'
' Então, na hora de analisar, simplesmente, pega o id de cada combinação pra realizar a estatística.';

/**
  Função pra gerar o agrupamento de todas as combinações dos grupos de 2, 3, 4 e 5 bolas.
  O objetivo disto é ter tabelas com os valores agrupados, pois não precisaremos realizar
  consultas de agrupamento toda vez que precisamos destas informações agrupadas, pois
  a tabela terá valores fixos sempre.
 */
drop function if exists lotofacil.fn_lotofacil_agrupada();
create function lotofacil.fn_lotofacil_agrupada()
  returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
  BEGIN
    Delete from lotofacil.lotofacil_grupo_2bolas_agrupada;
    Delete from lotofacil.lotofacil_grupo_3bolas_agrupada;
    Delete from lotofacil.lotofacil_grupo_4bolas_agrupada;
    Delete from lotofacil.lotofacil_grupo_5bolas_agrupada;

    Insert into lotofacil.lotofacil_grupo_2bolas_agrupada (grp_id, qt_vezes)
      SELECT grp_id, count(*) as qt_vezes
        from lotofacil_grupo_2bolas
      group by grp_id
      order by grp_id;

    Insert into lotofacil.lotofacil_grupo_3bolas_agrupada (grp_id, qt_vezes)
      SELECT grp_id, count(*) as qt_vezes
        from lotofacil_grupo_3bolas
      group by grp_id
      order by grp_id;

    Insert into lotofacil.lotofacil_grupo_4bolas_agrupada (grp_id, qt_vezes)
      SELECT grp_id, count(*) as qt_vezes
        from lotofacil_grupo_4bolas
      group by grp_id
      order by grp_id;

    Insert into lotofacil.lotofacil_grupo_5bolas_agrupada (grp_id, qt_vezes)
      SELECT grp_id, count(*) as qt_vezes
        from lotofacil_grupo_5bolas
      group by grp_id
      order by grp_id;
  END;$$;

drop function if exists lotofacil.fn_lotofacil_agrupada_qt();
create function lotofacil.fn_lotofacil_agrupada_qt()
  returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
  BEGIN
    Delete from lotofacil.lotofacil_grupo_2bolas_agrupada_qt;
    Delete from lotofacil.lotofacil_grupo_3bolas_agrupada_qt;
    Delete from lotofacil.lotofacil_grupo_4bolas_agrupada_qt;
    Delete from lotofacil.lotofacil_grupo_5bolas_agrupada_qt;

    Insert into lotofacil.lotofacil_grupo_2bolas_agrupada_qt (grp_id, ltf_qt, qt_vezes)
      Select grp_id, ltf_qt,  count(*) as qt_vezes
        from lotofacil_grupo_2bolas
      group by grp_id, ltf_qt 
      order by grp_id;

    Insert into lotofacil.lotofacil_grupo_3bolas_agrupada_qt (grp_id, ltf_qt, qt_vezes)
      Select grp_id, ltf_qt,  count(*) as qt_vezes
        from lotofacil_grupo_3bolas
      group by grp_id, ltf_qt 
      order by grp_id;

    Insert into lotofacil.lotofacil_grupo_4bolas_agrupada_qt (grp_id, ltf_qt, qt_vezes)
      Select grp_id, ltf_qt,  count(*) as qt_vezes
        from lotofacil_grupo_4bolas
      group by grp_id, ltf_qt 
      order by grp_id;

    Insert into lotofacil.lotofacil_grupo_5bolas_agrupada_qt (grp_id, ltf_qt, qt_vezes)
      Select grp_id, ltf_qt,  count(*) as qt_vezes
        from lotofacil_grupo_5bolas
      group by grp_id, ltf_qt 
      order by grp_id;
  END;$$;

-- Aqui, executa todas as funções:
drop function if exists lotofacil.fn_executarFuncoes();
create function lotofacil.fn_executarFuncoes() returns VOID
  LANGUAGE plpgsql
  as $$
  declare
  begin
    Execute lotofacil.fn_lotofacil_num();
    Execute lotofacil.fn_lotofacil_bolas();
    Execute lotofacil.fn_lotofacil_inserir();
    Execute lotofacil.fn_lotofacil_gerar_grupos();
    Execute lotofacil.fn_lotofacil_agrupada();
    Execute lotofacil.fn_lotofacil_agrupada_qt();
  end; $$;



drop table if exists lotofacil.lotofacil_novos_repetidos;
create table lotofacil.lotofacil_novos_repetidos(
  ltf_id numeric not null,
  ltf_qt numeric not null,
  nvrpt_id numeric not null,
  concurso numeric not null,
  CONSTRAINT lotofacil_novos_repetidos_pk PRIMARY KEY (ltf_id),
  CONSTRAINT lotofacil_novos_repetidos_fk FOREIGN KEY (ltf_id) REFERENCES lotofacil.lotofacil_num(ltf_id)
  on update cascade on delete cascade
);
comment on column lotofacil.lotofacil_novos_repetidos.concurso IS
'Indica de qual concurso da tabela lotofacil.lotofacil_resultado_num, a quantidade de novos e reptidos é baseada.';

/**
  Esta função é similar à função: lotofacil.fn_lotofacil_resultado_atualizar_novos_repetidos,
  entretanto, aqui, iremos comparar todas as combinações da lotofacil com a combinação
  atual do resultado da lotofacil que queremos.
 */

drop function if exists lotofacil.fn_lotofacil_atualizar_novos_repetidos(numeric);
create function lotofacil.fn_lotofacil_atualizar_novos_repetidos(concurso_analisar numeric)
  returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
    reg_lotofacil_num         lotofacil.lotofacil_num%ROWTYPE;
    reg_lotofacil_resultado_num  lotofacil.lotofacil_resultado_num%ROWTYPE;

    total_registros_resultado_bolas_num numeric;

    -- Conta cada registro.
    contador_registro numeric;

    -- Conta a quantidade de bola encontrada, parando, quando atingir 15.
    contador_bolas numeric;

    -- Arranjo que armazena cada bola.
    -- O índice 0, tem o número do concurso.
    lotofacil_resultado_num numeric[26];
    lotofacil_num numeric[26];

    qt_novos numeric;
    qt_repetidos numeric;

  begin

    Select * from lotofacil.lotofacil_resultado_num
      where concurso = concurso_analisar
    into reg_lotofacil_resultado_num;

    if reg_lotofacil_resultado_num is null THEN
      Raise Notice 'Nenhum registro encontrado';
      return;
    END IF;

    /* Deleta os registros */
    Delete from lotofacil.lotofacil_novos_repetidos;

    /* Aqui, não precisaremos de copiar o registro atual para ser um registro anterior
      pois a comparação sempre será com o registro da tabela lotofacil.lotofacil_concurso_num
      fornecido pelo usuário.
     */
    lotofacil_resultado_num[0] = reg_lotofacil_num.ltf_id;
    lotofacil_resultado_num[1] = reg_lotofacil_num.num_1;
    lotofacil_resultado_num[2] = reg_lotofacil_num.num_2;
    lotofacil_resultado_num[3] = reg_lotofacil_num.num_3;
    lotofacil_resultado_num[4] = reg_lotofacil_num.num_4;
    lotofacil_resultado_num[5] = reg_lotofacil_num.num_5;
    lotofacil_resultado_num[6] = reg_lotofacil_num.num_6;
    lotofacil_resultado_num[7] = reg_lotofacil_num.num_7;
    lotofacil_resultado_num[8] = reg_lotofacil_num.num_8;
    lotofacil_resultado_num[9] = reg_lotofacil_num.num_9;
    lotofacil_resultado_num[10] = reg_lotofacil_num.num_10;
    lotofacil_resultado_num[11] = reg_lotofacil_num.num_11;
    lotofacil_resultado_num[12] = reg_lotofacil_num.num_12;
    lotofacil_resultado_num[13] = reg_lotofacil_num.num_13;
    lotofacil_resultado_num[14] = reg_lotofacil_num.num_14;
    lotofacil_resultado_num[15] = reg_lotofacil_num.num_15;
    lotofacil_resultado_num[16] = reg_lotofacil_num.num_16;
    lotofacil_resultado_num[17] = reg_lotofacil_num.num_17;
    lotofacil_resultado_num[18] = reg_lotofacil_num.num_18;
    lotofacil_resultado_num[19] = reg_lotofacil_num.num_19;
    lotofacil_resultado_num[20] = reg_lotofacil_num.num_20;
    lotofacil_resultado_num[21] = reg_lotofacil_num.num_21;
    lotofacil_resultado_num[22] = reg_lotofacil_num.num_22;
    lotofacil_resultado_num[23] = reg_lotofacil_num.num_23;
    lotofacil_resultado_num[24] = reg_lotofacil_num.num_24;
    lotofacil_resultado_num[25] = reg_lotofacil_num.num_25;

    for reg_lotofacil_num in
      Select * from lotofacil.lotofacil_num
      order by ltf_id
    LOOP
      lotofacil_num[0] = reg_lotofacil_num.ltf_id;
      lotofacil_num[1] = reg_lotofacil_num.num_1;
      lotofacil_num[2] = reg_lotofacil_num.num_2;
      lotofacil_num[3] = reg_lotofacil_num.num_3;
      lotofacil_num[4] = reg_lotofacil_num.num_4;
      lotofacil_num[5] = reg_lotofacil_num.num_5;
      lotofacil_num[6] = reg_lotofacil_num.num_6;
      lotofacil_num[7] = reg_lotofacil_num.num_7;
      lotofacil_num[8] = reg_lotofacil_num.num_8;
      lotofacil_num[9] = reg_lotofacil_num.num_9;
      lotofacil_num[10] = reg_lotofacil_num.num_10;
      lotofacil_num[11] = reg_lotofacil_num.num_11;
      lotofacil_num[12] = reg_lotofacil_num.num_12;
      lotofacil_num[13] = reg_lotofacil_num.num_13;
      lotofacil_num[14] = reg_lotofacil_num.num_14;
      lotofacil_num[15] = reg_lotofacil_num.num_15;
      lotofacil_num[16] = reg_lotofacil_num.num_16;
      lotofacil_num[17] = reg_lotofacil_num.num_17;
      lotofacil_num[18] = reg_lotofacil_num.num_18;
      lotofacil_num[19] = reg_lotofacil_num.num_19;
      lotofacil_num[20] = reg_lotofacil_num.num_20;
      lotofacil_num[21] = reg_lotofacil_num.num_21;
      lotofacil_num[22] = reg_lotofacil_num.num_22;
      lotofacil_num[23] = reg_lotofacil_num.num_23;
      lotofacil_num[24] = reg_lotofacil_num.num_24;
      lotofacil_num[25] = reg_lotofacil_num.num_25;

      -- Iremos comparar cada combinação possível da lotofacil
      -- com a combinação fornecida pelo usuário através do número
      -- do concurso.
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

        if lotofacil_num[uA] = 1 then

          -- Se o campo atual do registro atual e o campo do registro anterior
          -- for 1, quer dizer, que são repetidos.

          if lotofacil_resultado_num[uA] = 1 THEN
            qt_repetidos := qt_repetidos + 1;
          ELSE
            qt_novos := qt_novos + 1;
          end if;
        end if;

      END LOOP;

      Raise Notice '%', reg_lotofacil_num.ltf_id;

      -- Insere um novo registro.
      Insert into lotofacil.lotofacil_novos_repetidos (ltf_id, ltf_qt, nvrpt_id, concurso)
        SELECT reg_lotofacil_num.ltf_id, reg_lotofacil_num.ltf_qt, nvrpt_id, concurso_analisar
          FROM lotofacil.lotofacil_id_novos_repetidos
      where novos = qt_novos and repetidos = qt_repetidos;
    END LOOP;
  end;
  $$;


/**
  Cria uma view onde, pegaremos todos os valores de novos e repetimos e compararmos com a tabela
  de resultados.

 */
drop view if exists lotofacil.v_lotofacil_novos_repetidos;
create view lotofacil.v_lotofacil_novos_repetidos
  as select ltf_num.novos_repetidos_id, novos, repetidos, ltf_qt, res_qt FROM
    (Select novos_repetidos_id, count(*) as ltf_qt
      from lotofacil.lotofacil_novos_repetidos
      group by novos_repetidos_id
    ) ltf_num,
    (
      Select novos_repetidos_id, count(*) as res_qt from lotofacil.lotofacil_resultado_novos_repetidos
      group by nvrpt_id
    ) ltf_res,
    lotofacil.lotofacil_id_novos_repetidos ltf_id_novos
  where ltf_num.novos_repetidos_id = ltf_id_novos.novos_repetidos_id
  and ltf_res.novos_repetidos_id = ltf_id_novos.novos_repetidos_id;









/*
  Tabelas de grupo consolidada.
 */
drop table if exists lotofacil.lotofacil_grupo_14bolas_consolidado;
create table lotofacil.lotofacil_grupo_14bolas_consolidado(
  grp_id numeric not null,
  qt_vezes numeric not null,
  
  constraint lotofacil_grupo_14bolas_consolidado_pk PRIMARY KEY (grp_id),
  constraint lotofacil_grupo_14bolas_consolidado_fk FOREIGN KEY (grp_id) REFERENCES 
    lotofacil.lotofacil_id_grupo_14bolas on update cascade on delete cascade
);

drop table if exists lotofacil.lotofacil_grupo_14bolas_consolidado_por_bolas;
create table lotofacil.lotofacil_grupo_14bolas_consolidado_por_bolas(
  grp_id numeric not null,
  ltf_qt numeric not null,
  qt_vezes numeric not null,
  
  constraint lotofacil_grupo_14bolas_consolidado_por_bolas_pk PRIMARY KEY (grp_id, ltf_qt),
  constraint lotofacil_grupo_14bolas_consolidado_por_bolas_fk FOREIGN KEY (grp_id) REFERENCES 
    lotofacil.lotofacil_id_grupo_14bolas on update cascade on delete cascade,
  constraint lotofacil_grupo_14bolas_consolidado_por_bolas_unk UNIQUE (grp_id, ltf_qt, qt_vezes)
);







