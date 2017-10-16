/**
  Neste arquivo, irei criar as tabelas com id, por que disto,
  pois quando realizar a análise, não irei considerar a analisar de um único
  campo da tabela isolada, por exemplo, na tabela par_impar,
  cada combinação terá um id, pois, fica mais fácil realizar o filtro, utilizando
  um único id, do que pegar e fazer um where dos campos par e impar.
  Por exemplo, na tabela par x impar, abaixo.
    par    impar    qt_vezes
      7      8        486
      8      7        403
      6      9        319
      9      6        172
      5      10       111
      10     5        36
      4      11       21
      11     4        5
      3      12       3

    Analisando, a combinação que sai mais vezes é 7 pares, 8 pares, então ao invés
    de fazer um select assim, lógico né estou considerando, que pode ter
    15 bolas, 16 bolas

    Select par_impar_qt = 15 and par in (7, 8) ou par_impar_qt = 16 in par(7, 8),

    ao invés irei utilizar um id pra cada combinação, fica mais fácil realizar o select,
    desta forma:

    Select par_impar_id in (0, 1, 2, 3), que neste caso poderia corresponder a:

par_impar_id      par    impar    qt_vezes
    0             7      8        486
    1             8      7        403
    2             6      9        319
    3             9      6        172
    4             5      10       111
    5             10     5        36
    6             4      11       21
    7             11     4        5
    8             3      12       3
  
 */

-- Delete a tabela lotofacil_id, pois depende das outras.
drop table if exists lotofacil.lotofacil_id;

/**
  Horizontal.
 */
drop table if EXISTS lotofacil.lotofacil_id_horizontal;
create table lotofacil.lotofacil_id_horizontal(
  hrz_id numeric not null,
  hrz_qt numeric not null check (hrz_qt in (15, 16, 17, 18)),
  hrz_1 numeric not null check (hrz_1 in (0, 1, 2, 3, 4, 5)),
  hrz_2 numeric not null check (hrz_2 in (0, 1, 2, 3, 4, 5)),
  hrz_3 numeric not null check (hrz_3 in (0, 1, 2, 3, 4, 5)),
  hrz_4 numeric not null check (hrz_4 in (0, 1, 2, 3, 4, 5)),
  hrz_5 numeric not null check (hrz_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_id_horizontal_pk PRIMARY KEY (hrz_id),
  CONSTRAINT lotofacil_id_horizontal_chk check ((hrz_1 + hrz_2 + hrz_3 + hrz_4 + hrz_5) = hrz_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_horizontal_unk UNIQUE (hrz_1, hrz_2, hrz_3, hrz_4, hrz_5)
);

/**
  Vertical.
 */
drop table if EXISTS lotofacil.lotofacil_id_vertical;
create table lotofacil.lotofacil_id_vertical(
  vrt_id numeric not null,
  vrt_qt numeric not null check (vrt_qt in (15, 16, 17, 18)),
  vrt_1 numeric not null check (vrt_1 in (0, 1, 2, 3, 4, 5)),
  vrt_2 numeric not null check (vrt_2 in (0, 1, 2, 3, 4, 5)),
  vrt_3 numeric not null check (vrt_3 in (0, 1, 2, 3, 4, 5)),
  vrt_4 numeric not null check (vrt_4 in (0, 1, 2, 3, 4, 5)),
  vrt_5 numeric not null check (vrt_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_id_vertical_pk PRIMARY KEY (vrt_id),
  CONSTRAINT lotofacil_id_vertical_chk check ((vrt_1 + vrt_2 + vrt_3 + vrt_4 + vrt_5) = vrt_qt),  

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_vertical_unk UNIQUE (vrt_1, vrt_2, vrt_3, vrt_4, vrt_5)
);

/**
  Diagonal.
 */
drop table if EXISTS lotofacil.lotofacil_id_diagonal;
create table lotofacil.lotofacil_id_diagonal(
  dg_id numeric not null,
  dg_qt numeric not null check (dg_qt in (15, 16, 17, 18)),
  dg_1 numeric not null check (dg_1 in (0, 1, 2, 3, 4, 5)),
  dg_2 numeric not null check (dg_2 in (0, 1, 2, 3, 4, 5)),
  dg_3 numeric not null check (dg_3 in (0, 1, 2, 3, 4, 5)),
  dg_4 numeric not null check (dg_4 in (0, 1, 2, 3, 4, 5)),
  dg_5 numeric not null check (dg_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_id_diagonal_pk PRIMARY KEY (dg_id),
  CONSTRAINT lotofacil_id_diagonal_chk check ((dg_1 + dg_2 + dg_3 + dg_4 + dg_5) = dg_qt),
  
  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_diagonal_unk UNIQUE (dg_1, dg_2, dg_3, dg_4, dg_5)
);

/**
  Cruzeta.
 */
drop table if EXISTS lotofacil.lotofacil_id_cruzeta;
create table lotofacil.lotofacil_id_cruzeta(
  crz_id numeric not null,
  crz_qt numeric not null check (crz_qt in (15, 16, 17, 18)),
  crz_1 numeric not null check (crz_1 in (0, 1, 2, 3, 4, 5)),
  crz_2 numeric not null check (crz_2 in (0, 1, 2, 3, 4, 5)),
  crz_3 numeric not null check (crz_3 in (0, 1, 2, 3, 4, 5)),
  crz_4 numeric not null check (crz_4 in (0, 1, 2, 3, 4, 5)),
  crz_5 numeric not null check (crz_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_id_cruzeta_pk PRIMARY KEY (crz_id),
  CONSTRAINT lotofacil_id_cruzeta_chk check ((crz_1 + crz_2 + crz_3 + crz_4 + crz_5) = crz_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_cruzeta_unk UNIQUE (crz_1, crz_2, crz_3, crz_4, crz_5)

);

/**
  Cruzeta.
 */
drop table if EXISTS lotofacil.lotofacil_id_trio;
create table lotofacil.lotofacil_id_trio(
  trio_id numeric not null,
  tr_qt numeric not null check (tr_qt in (15, 16, 17, 18)),
  tr_1 numeric not null check (tr_1 in (0, 1, 2, 3)),
  tr_2 numeric not null check (tr_2 in (0, 1, 2, 3)),
  tr_3 numeric not null check (tr_3 in (0, 1, 2, 3)),
  tr_4 numeric not null check (tr_4 in (0, 1, 2, 3)),
  tr_5 numeric not null check (tr_5 in (0, 1, 2, 3)),
  tr_6 numeric not null check (tr_6 in (0, 1, 2, 3)),
  tr_7 numeric not null check (tr_7 in (0, 1, 2, 3)),
  tr_8 numeric not null check (tr_8 in (0, 1, 2, 3, 4)),

  CONSTRAINT lotofacil_id_trio_pk PRIMARY KEY (trio_id),
  CONSTRAINT lotofacil_id_trio_chk check ((tr_1 + tr_2 + tr_3 + tr_4 + tr_5 + tr_6 + tr_7 + tr_8) = tr_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_trio_unk UNIQUE (tr_1, tr_2, tr_3, tr_4, tr_5, tr_6, tr_7, tr_8)

);





/**
  Quarteto.
  É composto de grupos de 4 bolas, entretanto, o último grupo tem 5 bolas.
  Pra formar o quarteto, dividir as 25 bolas 2 dois grupos,
  na parte superior, há 12 bolas, na parte inferior 13 bolas.
  Em seguida, da esquerda pra direita, pega 2 bolas, da parte superior
  e duas bolas da parte inferior.
  As 4 bolas selecionada no passo interior, compõe o primeiro grupo do
  quarteto, e assim por diante.
  No final, no 5 grupos, haverá 2 bolas, na parte superior e 3 bolas na
  parte inferior, estas 2 bolas e as 3 bolas fazem parte do mesmo grupo.
 */
drop table if EXISTS lotofacil.lotofacil_id_quarteto;
create table lotofacil.lotofacil_id_quarteto(
  qrt_id numeric not null,
  qrt_qt numeric not null check (qrt_qt in (15, 16, 17, 18)),
  qrt_1 numeric not null check (qrt_1 in (0, 1, 2, 3, 4)),
  qrt_2 numeric not null check (qrt_2 in (0, 1, 2, 3, 4)),
  qrt_3 numeric not null check (qrt_3 in (0, 1, 2, 3, 4)),
  qrt_4 numeric not null check (qrt_4 in (0, 1, 2, 3, 4)),
  qrt_5 numeric not null check (qrt_5 in (0, 1, 2, 3, 4)),
  qrt_6 numeric not null check (qrt_6 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_id_quarteto_pk PRIMARY KEY (qrt_id),
  CONSTRAINT lotofacil_id_quarteto_chk check ((qrt_1 + qrt_2 + qrt_3 + qrt_4 + qrt_5 + qrt_6) = qrt_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_quarteto_unk UNIQUE (qrt_1, qrt_2, qrt_3, qrt_4, qrt_5, qrt_6)
);

/**
  Externo x Interno.
  Na lotofacil, há no máximo, 9 internos e 16 externos.
  Em todas as combinações de 15, 16, 17 e 18 bolas, sempre haverá
  no máximo 9 internos, então, praticamente, podemos dizer, que ele é
  comum a todos eles, então, vamos criar este campo também.
 */
drop table if exists lotofacil.lotofacil_id_externo_interno;
create table lotofacil.lotofacil_id_externo_interno(
  ext_int_id numeric not null,
  ext_int_qt numeric not null check (ext_int_qt in (15, 16, 17, 18)),

  externo numeric not null check (externo between 6 and 16),
  interno numeric not null check (interno between 0 and 9),

  CONSTRAINT lotofacil_id_externo_interno_pk PRIMARY KEY (ext_int_id),
  CONSTRAINT lotofacil_id_externo_interno_chk check (externo + interno = ext_int_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_externo_interno_unk UNIQUE (externo, interno)
);

drop table if exists lotofacil.lotofacil_id_externo_interno_comum;
create table lotofacil.lotofacil_id_externo_interno_comum(
  comum_id  SERIAL PRIMARY KEY,
  ext_int_id numeric not null,
  ext_int_comum_id numeric not null,
  CONSTRAINT lotofacil_id_externo_interno_comum_unk unique(ext_int_id, ext_int_comum_id)
);



/**
  Par x Impar.
  Criar identificadores para cada combinação par e ímpar da lotofacil.
  Na lotofácil, há 12 pares e 13 ímpares, entretanto, iremos criar id
  somente pra as combinações possíveis na lotofacil, as combinações possíveis
  são de 15, 16, 17 e 18 bolas.
  Então, uma combinação de 15 bolas, terá no mínimo 2 pares e 13 impares ou, por exemplo
  terá 12 pares e 3 ímpares.
 */
drop table if exists lotofacil.lotofacil_id_par_impar;
create table lotofacil.lotofacil_id_par_impar(
  par_impar_id numeric not null,
  par_impar_qt numeric not null check (par_impar_qt in (15, 16, 17, 18)),

  par numeric not null check (par between 0 and 12),
  impar numeric not null check (impar between 0 and 13),

  CONSTRAINT lotofacil_id_par_impar_pk PRIMARY KEY (par_impar_id),
  CONSTRAINT lotofacil_id_par_impar_chk check (par + impar = par_impar_qt),

    -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_par_impar_interno_unk UNIQUE (par, impar)
);


drop table if exists lotofacil.lotofacil_id_par_impar_comum;
create table lotofacil.lotofacil_id_par_impar_comum(
  comum_id  SERIAL PRIMARY KEY,
  par_impar_id numeric not null,
  par_impar_comum_id numeric not null,
  CONSTRAINT lotofacil_id_par_impar_comum_unk unique(par_impar_id, par_impar_comum_id)
);
comment on table lotofacil.lotofacil_id_par_impar_comum IS
'Esta tabela armazena os ids das combinações par x impar, '
'de um total de bolas relativo a outra combinação par x impar de um total de bolas diferentes'
'ou seja, todas as combinações de 15, serão relacionadas com as outras combinações de 16, 17 e 18,'
'por exemplo, a combinação: 2 par x 13 impares, é uma combinação de 15 bolas, '
'então, devemos verificar se nas outras combinações de 16, 17 e 18, se há pela menos uma combinação'
'de 2 par ou 13 ímpares, neste exemplo, há:'
'as combinações são:'
'16 bolas: 3 par x 13 ímpares,'
'17 bolas: 4 par x 13 ímpares,'
'18 bolas: 5 par x 13 ímpares,'
'ou seja, iremos comparar a combinação par x impar com a combinação com um total de bolas diferentes,'
'e verificar se há a quantidade de par é igual à combinação que estamos comparando e o mesmo pra a '
'quantidade de números ímpares.';

--Select lotofacil.fn_lotofacil_id_grupo();
drop table if exists lotofacil.lotofacil_id_primo_comum;
drop table if exists lotofacil.lotofacil_id_primo;
create table lotofacil.lotofacil_id_primo(
  prm_id numeric not null,
  prm_qt numeric not null,
  primo numeric not null,
  nao_primo numeric not null,

  CONSTRAINT lotofacil_id_primo_pk PRIMARY KEY (prm_id),
  CONSTRAINT lotofacil_id_primo_unk unique (primo, nao_primo)
);
comment on table lotofacil.lotofacil_id_primo IS
'Esta tabela armazena todas as combinações possíveis de números primos na lotofacil.'
'Os números primos são: 2, 3, 5, 7, 11, 13, 17, 19, 23.'
'Ou seja, há 9 números primos, isto que dizer que pode haver no máximo 9 números primos';

/**

 */
drop table if exists lotofacil.lotofacil_id_primo_comum;
create table lotofacil.lotofacil_id_primo_comum(
  comum_id  SERIAL PRIMARY KEY,
  prm_id numeric not null,
  prm_comum_id numeric not null,

  CONSTRAINT lotofacil_id_primo_comum_unk UNIQUE (prm_id, prm_comum_id),
  constraint lotofacil_id_primo_comum_fk FOREIGN KEY (prm_comum_id) REFERENCES lotofacil.lotofacil_id_primo(prm_id)
);



/**
  Novos: Bola NÃO SAIU no concurso anterior, mas saiu no concurso atual.
  Repetidos: Bola SAIU no concurso anterior e saiu no atual também.
  Há 25 números, são sorteados 15, restam 10 números.
  Então, pode haver de 0 a 10 números novos.

 */
drop table if exists lotofacil.lotofacil_id_novos_repetidos;
create table lotofacil.lotofacil_id_novos_repetidos (
  novos_repetidos_id  NUMERIC NOT NULL,
  novos     NUMERIC NOT NULL CHECK (novos >= 0 AND novos <= 10),
  repetidos NUMERIC NOT NULL CHECK (repetidos >= 5 AND repetidos <= 15),

  CONSTRAINT lotofacil_id_novos_repetidos_pk PRIMARY KEY (novos_repetidos_id),
  CONSTRAINT lotofacil_id_novos_repetidos_chk CHECK ((novos + repetidos) = 15),

    -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_id_novos_repetidos_unk UNIQUE (novos, repetidos)
);


/**
  Aqui, será criado todas as combinações possíveis referentes às combinações:
  b1
  b1_b8
  b1_b8_b15
  b1_b4_b8_b12_b15
 */
drop table if EXISTS lotofacil.lotofacil_id_b1;
create table lotofacil.lotofacil_id_b1(
  b1_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  CONSTRAINT lotofacil_id_b1_pk PRIMARY KEY (b1_id),
  CONSTRAINT lotofacil_id_b1_unk UNIQUE (b1)
);

drop table if EXISTS lotofacil.lotofacil_id_b1_b15;
create table lotofacil.lotofacil_id_b1_b15(
  b1_b15_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  b15 numeric not null check (b15 >= 15 and b15 <= 25),
  CONSTRAINT lotofacil_id_b1_b15_pk PRIMARY KEY (b1_b15_id),
  CONSTRAINT lotofacil_id_b1_b15_unk UNIQUE (b1, b15)
);

drop table if EXISTS lotofacil.lotofacil_id_b1_b8_b15;
create table lotofacil.lotofacil_id_b1_b8_b15(
  b1_b8_b15_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  b8 numeric not null check (b8 >= 8 and b8 <= 18),
  b15 numeric not null check (b15 >= 15 and b15 <= 25),
  CONSTRAINT lotofacil_id_b1_b8_b15_pk PRIMARY KEY (b1_b8_b15_id),
  CONSTRAINT lotofacil_id_b1_b8_b15_unk UNIQUE (b1, b8, b15)
);

drop table if EXISTS lotofacil.lotofacil_id_b1_b4_b8_b12_b15;
create table lotofacil.lotofacil_id_b1_b4_b8_b12_b15(
  b1_b4_b8_b12_b15_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  b4 numeric not null check (b4 >= 4 and b4 <= 14),
  b8 numeric not null check (b8 >= 8 and b8 <= 18),
  b12 numeric not null check (b12 >= 12 and b12 <= 22),
  b15 numeric not null check (b15 >= 15 and b15 <= 25),
  CONSTRAINT lotofacil_id_b1_b4_b8_b12_b15_pk PRIMARY KEY (b1_b4_b8_b12_b15_id),
  CONSTRAINT lotofacil_id_b1_b4_b8_b12_b15_unk UNIQUE (b1, b4, b8, b12, b15)
);

drop table if exists lotofacil.lotofacil_id;
create table lotofacil.lotofacil_id(
  ltf_id numeric not null,
  ltf_qt numeric not null,
  par_impar_id numeric not null,
  ext_int_id numeric not null,
  prm_id numeric not null,
  hrz_id numeric not null,
  vrt_id numeric not null,
  dg_id numeric not null,
  crz_id numeric not null,
  qrt_id numeric not null,
  trio_id numeric not null,
  b1_id numeric not null,
  b1_b15_id numeric not null,
  b1_b8_b15_id numeric not null,
  b1_b4_b8_b12_b15_id numeric not null,
  novos_repetidos_id numeric null,

  CONSTRAINT lotofacil_identificadores_fk FOREIGN KEY (ltf_id) references lotofacil.lotofacil_num(ltf_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk2 FOREIGN KEY (ltf_qt) references lotofacil.lotofacil_num(ltf_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk3 FOREIGN KEY (par_impar_id) references lotofacil.lotofacil_id_par_impar(par_impar_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk4 FOREIGN KEY (ext_int_id) references lotofacil.lotofacil_id_externo_interno(ext_int_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk5 FOREIGN KEY (prm_id) references lotofacil.lotofacil_id_primo(prm_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk6 FOREIGN KEY (hrz_id) references lotofacil.lotofacil_id_horizontal(hrz_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk7 FOREIGN KEY (vrt_id) references lotofacil.lotofacil_id_vertical(vrt_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk8 FOREIGN KEY (dg_id) references lotofacil.lotofacil_id_diagonal(dg_id) on update cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk9 FOREIGN KEY (crz_id) references lotofacil.lotofacil_id_cruzeta(crz_id) on update cascade on delete cascade,

  CONSTRAINT lotofacil_identificadores_fk11 FOREIGN KEY (b1_id) REFERENCES lotofacil.lotofacil_id_b1(b1_id) on UPDATE cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk12 FOREIGN KEY (b1_b15_id) REFERENCES lotofacil.lotofacil_id_b1_b15(b1_b15_id) on UPDATE cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk13 FOREIGN KEY (b1_b8_b15_id) REFERENCES lotofacil.lotofacil_id_b1_b8_b15(b1_b8_b15_id) on UPDATE cascade on delete cascade,
  CONSTRAINT lotofacil_identificadores_fk14 FOREIGN KEY (b1_b4_b8_b12_b15_id) REFERENCES lotofacil.lotofacil_id_b1_b4_b8_b12_b15(b1_b4_b8_b12_b15_id) on UPDATE cascade on delete cascade
);


drop table if exists lotofacil.lotofacil_id_grupo_1_bolas;
create table lotofacil.lotofacil_id_grupo_1_bolas (
  grp_id numeric not null,
  bola1 numeric not null,

  CONSTRAINT lotofacil_id_grupo_1_bolas_chk unique(
    bola1
  ),
  CONSTRAINT lotofacil_id_grupo_1_bolas_chk2 check((bola1 >= 1) and (bola1 <= 25)),

  constraint lotofacil_id_grupo_1_bolas_pk PRIMARY KEY (grp_id)
);

drop table if exists lotofacil.lotofacil_id_grupo_2_bolas;
create table lotofacil.lotofacil_id_grupo_2_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,

  CONSTRAINT lotofacil_id_grupo_2_bolas_chk unique(
    bola1, bola2
  ),
  CONSTRAINT lotofacil_id_grupo_2_bolas_chk check (
    (bola1 < bola2)
  ),
  CONSTRAINT lotofacil_id_grupo_2_bolas_chk2 check((bola1 >= 1) and (bola2 <= 25)),

  constraint lotofacil_id_grupo_2_bolas_pk PRIMARY KEY (grp_id)
);

drop table if exists lotofacil.lotofacil_id_grupo_3_bolas;
create table lotofacil.lotofacil_id_grupo_3_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,

  CONSTRAINT lotofacil_id_grupo_3_bolas_chk unique(
    bola1, bola2, bola3
  ),
  CONSTRAINT lotofacil_id_grupo_3_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
  ),
  CONSTRAINT lotofacil_id_grupo_3_bolas_chk2 check((bola1 >= 1) and (bola3 <= 25)),

  constraint lotofacil_id_grupo_3_bolas_pk PRIMARY KEY (grp_id)
);

drop table if exists lotofacil.lotofacil_id_grupo_4_bolas;
create table lotofacil.lotofacil_id_grupo_4_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,

  CONSTRAINT lotofacil_id_grupo_4_bolas_chk unique(
    bola1, bola2, bola3, bola4
  ),
  CONSTRAINT lotofacil_id_grupo_4_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
  ),
  CONSTRAINT lotofacil_id_grupo_4_bolas_chk2 check((bola1 >= 1) and (bola4 <= 25)),

  constraint lotofacil_id_grupo_4_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_5_bolas;
create table lotofacil.lotofacil_id_grupo_5_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,

  CONSTRAINT lotofacil_id_grupo_5_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5
  ),
  CONSTRAINT lotofacil_id_grupo_5_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
  ),
  CONSTRAINT lotofacil_id_grupo_5_bolas_chk2 check((bola1 >= 1) and (bola5 <= 25)),

  constraint lotofacil_id_grupo_5_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_6_bolas;
create table lotofacil.lotofacil_id_grupo_6_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,

  CONSTRAINT lotofacil_id_grupo_6_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6
  ),
  CONSTRAINT lotofacil_id_grupo_6_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
  ),
  CONSTRAINT lotofacil_id_grupo_6_bolas_chk2 check((bola1 >= 1) and (bola6 <= 25)),

  constraint lotofacil_id_grupo_6_bolas_pk PRIMARY KEY (grp_id)
);



drop table if exists lotofacil.lotofacil_id_grupo_7_bolas;
create table lotofacil.lotofacil_id_grupo_7_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,

  CONSTRAINT lotofacil_id_grupo_7_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7
  ),
  CONSTRAINT lotofacil_id_grupo_7_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
  ),
  CONSTRAINT lotofacil_id_grupo_7_bolas_chk2 check((bola1 >= 1) and (bola7 <= 25)),

  constraint lotofacil_id_grupo_7_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_8_bolas;
create table lotofacil.lotofacil_id_grupo_8_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,

  CONSTRAINT lotofacil_id_grupo_8_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8
  ),
  CONSTRAINT lotofacil_id_grupo_8_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
  ),
  CONSTRAINT lotofacil_id_grupo_8_bolas_chk2 check((bola1 >= 1) and (bola8 <= 25)),

  constraint lotofacil_id_grupo_8_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_9_bolas;
create table lotofacil.lotofacil_id_grupo_9_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,

  CONSTRAINT lotofacil_id_grupo_9_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9
  ),
  CONSTRAINT lotofacil_id_grupo_9_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
  ),
  CONSTRAINT lotofacil_id_grupo_9_bolas_chk2 check((bola1 >= 1) and (bola9 <= 25)),

  constraint lotofacil_id_grupo_9_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_10_bolas;
create table lotofacil.lotofacil_id_grupo_10_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,

  CONSTRAINT lotofacil_id_grupo_10_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9, bola10
  ),
  CONSTRAINT lotofacil_id_grupo_10_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
    AND (bola9 < bola10)
  ),
  CONSTRAINT lotofacil_id_grupo_10_bolas_chk2 check((bola1 >= 1) and (bola10 <= 25)),

  constraint lotofacil_id_grupo_10_bolas_pk PRIMARY KEY (grp_id)
);



drop table if exists lotofacil.lotofacil_id_grupo_11_bolas;
create table lotofacil.lotofacil_id_grupo_11_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,
  bola11 numeric not null,

  CONSTRAINT lotofacil_id_grupo_11_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9, bola10,
    bola11
  ),
  CONSTRAINT lotofacil_id_grupo_11_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
    AND (bola9 < bola10)
    and (bola10 < bola11)    
  ),
  CONSTRAINT lotofacil_id_grupo_11_bolas_chk2 check((bola1 >= 1) and (bola11 <= 25)),

  constraint lotofacil_id_grupo_11_bolas_pk PRIMARY KEY (grp_id)
);



drop table if exists lotofacil.lotofacil_id_grupo_12_bolas;
create table lotofacil.lotofacil_id_grupo_12_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,
  bola11 numeric not null,
  bola12 numeric not null,

  CONSTRAINT lotofacil_id_grupo_12_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9, bola10,
    bola11, bola12
  ),
  CONSTRAINT lotofacil_id_grupo_12_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
    AND (bola9 < bola10)
    and (bola10 < bola11)
    and (bola11 < bola12)
  ),
  CONSTRAINT lotofacil_id_grupo_12_bolas_chk2 check((bola1 >= 1) and (bola12 <= 25)),
  
  constraint lotofacil_id_grupo_12_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_12_bolas;
create table lotofacil.lotofacil_id_grupo_12_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,
  bola11 numeric not null,
  bola12 numeric not null,

  CONSTRAINT lotofacil_id_grupo_12_bolas_chk unique(
    bola1,
    bola2,
    bola3,
    bola4,
    bola5,
    bola6,
    bola7,
    bola8,
    bola9,
    bola10,
    bola11,
    bola12
  ),
  CONSTRAINT lotofacil_id_grupo_12_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
    AND (bola9 < bola10)
    and (bola10 < bola11)
    and (bola11 < bola12)
  ),
  CONSTRAINT lotofacil_id_grupo_12_bolas_chk2 check((bola1 >= 1) and (bola12 <= 25)),
  
  constraint lotofacil_id_grupo_12_bolas_pk PRIMARY KEY (grp_id)
);

drop table if exists lotofacil.lotofacil_id_grupo_13_bolas;
create table lotofacil.lotofacil_id_grupo_13_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,
  bola11 numeric not null,
  bola12 numeric not null,
  bola13 numeric not null,

  CONSTRAINT lotofacil_id_grupo_13_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9, bola10,
    bola11, bola12, bola13
  ),
  CONSTRAINT lotofacil_id_grupo_13_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
    AND (bola9 < bola10)
    and (bola10 < bola11)
    and (bola11 < bola12)
    and (bola12 < bola13)
  ),
  CONSTRAINT lotofacil_id_grupo_13_bolas_chk2 check((bola1 >= 1) and (bola13 <= 25)),
  
  constraint lotofacil_id_grupo_13_bolas_pk PRIMARY KEY (grp_id)
);


drop table if exists lotofacil.lotofacil_id_grupo_14_bolas;
create table lotofacil.lotofacil_id_grupo_14_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,
  bola11 numeric not null,
  bola12 numeric not null,
  bola13 numeric not null,
  bola14 numeric not null,

  CONSTRAINT lotofacil_id_grupo_14_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9, bola10,
    bola11, bola12, bola13, bola14
  ),
  CONSTRAINT lotofacil_id_grupo_14_bolas_chk check (
    (bola1 < bola2)
    and (bola2 < bola3)
    and (bola3 < bola4)
    and (bola4 < bola5)
    AND (bola5 < bola6)
    AND (bola6 < bola7)
    AND (bola7 < bola8)
    AND (bola8 < bola9)
    AND (bola9 < bola10)
    and (bola10 < bola11)
    and (bola11 < bola12)
    and (bola12 < bola13)
    and (bola13 < bola14)
  ),
  CONSTRAINT lotofacil_id_grupo_14_bolas_chk2 check((bola1 >= 1) and (bola14 <= 25)),
  
  constraint lotofacil_id_grupo_14_bolas_pk PRIMARY KEY (grp_id)
);

drop table if exists lotofacil.lotofacil_id_grupo_15_bolas;
create table lotofacil.lotofacil_id_grupo_15_bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null,
  bola3 numeric not null,
  bola4 numeric not null,
  bola5 numeric not null,
  bola6 numeric not null,
  bola7 numeric not null,
  bola8 numeric not null,
  bola9 numeric not null,
  bola10 numeric not null,
  bola11 numeric not null,
  bola12 numeric not null,
  bola13 numeric not null,
  bola14 numeric not null,
  bola15 numeric not null,

  CONSTRAINT lotofacil_id_grupo_15_bolas_chk unique(
    bola1, bola2, bola3, bola4, bola5, bola6, bola7, bola8, bola9, bola10,
    bola11, bola12, bola13, bola14, bola15
  ),
  CONSTRAINT lotofacil_id_grupo_15_bolas_chk check (
    (bola1 < bola2) and (bola2 < bola3) and (bola3 < bola4) and (bola4 < bola5) AND
    (bola5 < bola6) and (bola6 < bola7) and (bola7 < bola8) and (bola8 < bola9) AND
    (bola9 < bola10) and (bola10 < bola11) and (bola11 < bola12) and (bola12 < bola13) AND 
    (bola13 < bola14) and (bola14 < bola15)
  ),
  CONSTRAINT lotofacil_id_grupo_15_bolas_chk2 check((bola1 >= 1) and (bola15 <= 25)),
  
  constraint lotofacil_id_grupo_15_bolas_pk PRIMARY KEY (grp_id)
);







/**


drop function if exists lotofacil.fn_lotofacil_inserir_quarteto_id();
create function lotofacil.fn_lotofacil_inserir_quarteto_id()
returns VOID
LANGUAGE plpgsql
as $$
  declare
    -- Serve pra indicar o índice de cada tabela.
    indiceRegistro numeric default 0;

    -- Serve pra percorrer o arranjo.
    Coluna_1 numeric;
    Coluna_2 numeric;
    Coluna_3 numeric;
    Coluna_4 numeric;
    Coluna_5 numeric;
    Coluna_6 numeric;

    indiceTabela numeric;

    somaColuna numeric;

  begin
    indiceRegistro := 0;
    somaColuna := 0;

    /**
      No quarteto, cada grupo tem 4 bolas, exceto, o último grupo que tem 5 bolas.
     */

    for Coluna_1 in 0..4 LOOP
      for Coluna_2 in 0..4 LOOP
        for Coluna_3 in 0..4 LOOP
          for Coluna_4 in 0..4 LOOP
            for Coluna_5 in 0..4 LOOP
              for Coluna_6 in 0..5 LOOP
                somaColuna := Coluna_1 + Coluna_2 + Coluna_3 + Coluna_4 + Coluna_5 + Coluna_6;

                if somaColuna in (15, 16, 17, 18) then
                  indiceRegistro := indiceRegistro + 1;

                  Insert Into lotofacil.lotofacil_id_quarteto(qrt_id, qrt_qt, qrt_1, qrt_2, qrt_3, qrt_4, qrt_5, qrt_6)
                  values(indiceRegistro, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5, Coluna_6);

                END IF;
              END LOOP;
            END LOOP;
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
  end $$;

--Select lotofacil.fn_lotofacil_inserir_quarteto_id();





drop function if exists lotofacil.fn_lotofacil_id_inserir_externo_interno();
create function lotofacil.fn_lotofacil_id_inserir_externo_interno()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    -- Serve pra percorrer o arranjo.
    qt_externo numeric;
    qt_interno numeric;

    indiceRegistro numeric;

    somaExternoInterno numeric;

  begin
    indiceRegistro := 0;
    somaExternoInterno := 0;
    indiceRegistro := 0;

    Delete from lotofacil.lotofacil_id_externo_interno;

    -- Externo pode ser 9 até 16
    -- Interno pode ser 0 até 9.
    for qt_externo in 0..16 LOOP
      for qt_interno in 0..9 LOOP
              somaExternoInterno := qt_externo + qt_interno;

              if somaExternoInterno in (15, 16, 17, 18) then
                indiceRegistro := indiceRegistro + 1;

                Insert Into lotofacil.lotofacil_id_externo_interno
                 (ext_id, int_id, ext_int_qt, externo, interno)
                values(indiceRegistro, qt_interno, somaExternoInterno, qt_externo, qt_interno);

              END IF;
      END LOOP;
    END LOOP;
  end;
  $$;
--Select lotofacil.fn_lotofacil_id_inserir_externo_interno();

drop function if exists lotofacil.fn_lotofacil_id_par_impar();
create function lotofacil.fn_lotofacil_id_par_impar()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    -- Serve pra incrementar a cada registro inserido.
    indiceRegistro numeric default 0;

    qt_par numeric;
    qt_impar numeric;

    somaParImpar numeric;

  begin
    indiceRegistro := 0;
    somaParImpar := 0;
    indiceRegistro := 0;

    Delete from lotofacil.lotofacil_id_par_impar;

    -- par pode ser 9 até 16
    -- impar pode ser 0 até 9.
    for qt_par in 0..12 LOOP
      for qt_impar in 0..13 LOOP
              somaParImpar := qt_par + qt_impar;

              if somaParImpar in (15, 16, 17, 18) then
                indiceRegistro := indiceRegistro + 1;

                Insert Into lotofacil.lotofacil_id_par_impar
                 (par_impar_id, par_impar_qt, par, impar)
                values(indiceRegistro, somaParImpar, qt_par, qt_impar);

              END IF;
      END LOOP;
    END LOOP;
  end;
  $$;
Select lotofacil.fn_lotofacil_id_par_impar();


/**
  Esta função irá percorrer cada combinação da tabela lotofacil.lotofacil_id_par_impar.
  Irá comparar a combinação atual, com todas as outras combinações e vai verificar se
  as outras combinações tem par ou impar com a mesma quantidade, se houver, irá inserir
  um novo registro na tabela lotofacil.lotofacil_par_impar_comum, com o identificador da combinação atual
  junto com a identificador da outra combinação.
  Por exemplo, se a combinação atual for:
  3 par x 12 ímpares,
  as outras combinações possíveis com 3 par ou 12 ímpares são:
  3 par x 13 ímpares => 16 bolas
  4 par x 12 ímpares => 16 bolas
  5 par x 12 ímpares => 17 bolas
  6 par x 12 ímpares => 18 bolas
  Então, haverá um registro identificando com uma desta combinações.
  Ah, outro detalhe, é que devemos inserir também a própria combinação que estão analisando.
  3 par x 12 ímpares.

  O objetivo desta tabela é que quando o usuário for selecionar a tabela agregada dos pares
  e impares dos resultados já sorteados na lotofacil, a combinação par x impar que tem par ou
  impar em comum nas outras combinações de 16, 17 e 18 bolas, será selecionada.

  Pois, haverá um filtro separado para indicar quais combinações deseja retornar se 15, 16, 17 e 18 bolas.

  O objetivo é que o programa analisador terá um filtro por quantidade de bolas, ao invés
  de realizar o filtro dentro de cada combinação par x impar, pois senão o usuário deveria
  selecionar cada combinação referente a quantidade de bolas diferentes.

 */
drop function if exists lotofacil.fn_lotofacil_id_par_impar_comum();
create function lotofacil.fn_lotofacil_id_par_impar_comum()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    regPar_Impar lotofacil.lotofacil_id_par_impar%rowtype;
    indiceRegistro numeric;
  BEGIN
    indiceRegistro := 0;

    for regPar_Impar in
      Select * from lotofacil.lotofacil_id_par_impar
      order by par_impar_id
    LOOP
      indiceRegistro := indiceRegistro + 1;
      Insert Into lotofacil.lotofacil_id_par_impar_comum(par_impar_id, par_impar_comum_id)
        Select regPar_Impar.par_impar_id, par_impar_id FROM
          lotofacil.lotofacil_id_par_impar
        where par = regPar_Impar.par AND
          impar = regPar_Impar.impar;

      Insert Into lotofacil.lotofacil_id_par_impar_comum(par_impar_id, par_impar_comum_id)
        Select regPar_Impar.par_impar_id, par_impar_id FROM
          lotofacil.lotofacil_id_par_impar
        where par = regPar_Impar.par
        and impar <> regPar_Impar.impar;

      Insert Into lotofacil.lotofacil_id_par_impar_comum(par_impar_id, par_impar_comum_id)
        Select regPar_Impar.par_impar_id, par_impar_id FROM
          lotofacil.lotofacil_id_par_impar
        where par <> regPar_Impar.par
        and impar = regPar_Impar.impar;

    END LOOP;
  END;$$;
Select lotofacil.fn_lotofacil_id_par_impar_comum();

drop function if exists lotofacil.fn_lotofacil_id_primo_comum();
create function lotofacil.fn_lotofacil_id_primo_comum()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    regPrimo lotofacil.lotofacil_id_primo%rowtype;
    indiceRegistro numeric;
  BEGIN
    indiceRegistro := 0;

    for regPrimo in
      Select * from lotofacil.lotofacil_id_primo
      order by prm_id
    LOOP
      indiceRegistro := indiceRegistro + 1;
      Insert Into lotofacil.lotofacil_id_primo_comum(prm_id, prm_comum_id)
        Select regPrimo.prm_id, prm_id FROM
          lotofacil.lotofacil_id_primo
        where primo = regPrimo.primo AND
          nao_primo = regPrimo.nao_primo;

      Insert Into lotofacil.lotofacil_id_primo_comum(prm_id, prm_comum_id)
        Select regPrimo.prm_id, prm_id FROM
          lotofacil.lotofacil_id_primo
        where primo = regPrimo.primo
        and nao_primo <> regPrimo.nao_primo;

      Insert Into lotofacil.lotofacil_id_primo_comum(prm_id, prm_comum_id)
        Select regPrimo.prm_id, prm_id FROM
          lotofacil.lotofacil_id_primo
        where primo <> regPrimo.primo
        and nao_primo = regPrimo.nao_primo;

    END LOOP;
  END;$$;

-- Select from lotofacil.fn_lotofacil_id_primo_comum();

drop function if exists lotofacil.fn_lotofacil_id_novos_repetidos();
create function lotofacil.fn_lotofacil_id_novos_repetidos()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    qt_novos numeric default 0;
    qt_repetidos numeric default 0;
  BEGIN
    for qt_novos in 0..10 LOOP
      qt_repetidos := 15 - qt_novos;

      raise notice '%, %', qt_novos, qt_repetidos;

      Insert into lotofacil.lotofacil_id_novos_repetidos (nvrpt_id, novos, repetidos) VALUES
        (qt_novos, qt_novos, qt_repetidos);
    END LOOP;
  END;
  $$;
Select from lotofacil.fn_lotofacil_id_novos_repetidos();

/**
  Insere os valores fixos das tabelas:
  lotofacil_horizontal_id;
  lotofacil_vertical_id;
  lotofacil_diagonal_id;
  lotofacil_cruzeta_id;

  Nas tabelas acimas, cada coluna, comporta valores de 0 a 5, ou seja,
  cada combinação tem números de 0 a 5, assim:
  0, 0, 5, 5, 5.
 */

drop function if exists lotofacil.fn_lotofacil_id_hrz_vrt_dg_crz();
create function lotofacil.fn_lotofacil_id_hrz_vrt_dg_crz()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    -- Serve pra indicar o índice de cada tabela.
    indiceRegistro numeric default 0;

    -- Serve pra percorrer o arranjo.
    Coluna_1 numeric;
    Coluna_2 numeric;
    Coluna_3 numeric;
    Coluna_4 numeric;
    Coluna_5 numeric;

    indiceTabela numeric;

    somaColuna numeric;

  begin
    indiceRegistro := 0;
    somaColuna := 0;
    indiceTabela := 0;

    Delete from lotofacil.lotofacil_id_horizontal;
    Delete from lotofacil.lotofacil_id_vertical;
    Delete from lotofacil.lotofacil_id_diagonal;
    Delete from lotofacil.lotofacil_id_cruzeta;


    for Coluna_1 in 0..5 LOOP
      for Coluna_2 in 0..5 LOOP
        for Coluna_3 in 0..5 LOOP
          for Coluna_4 in 0..5 LOOP
            for Coluna_5 in 0..5 LOOP
              somaColuna := Coluna_1 + Coluna_2 + Coluna_3 + Coluna_4 + Coluna_5;

              if somaColuna in (15, 16, 17, 18) then
                indiceTabela := indiceTabela + 1;

                Insert Into lotofacil.lotofacil_id_horizontal(hrz_id, hrz_qt, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);

                Insert Into lotofacil.lotofacil_id_vertical(vrt_id, vrt_qt, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);

                Insert Into lotofacil.lotofacil_id_diagonal(dg_id, dg_qt, dg_1, dg_2, dg_3, dg_4, dg_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);

                Insert Into lotofacil.lotofacil_id_cruzeta(crz_id, crz_qt, crz_1, crz_2, crz_3, crz_4, crz_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);


              END IF;
            END LOOP;
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
  end $$;

Select lotofacil.fn_lotofacil_id_hrz_vrt_dg_crz();

drop function if exists lotofacil.fn_lotofacil_id_b1_ate_b15();
create function lotofacil.fn_lotofacil_id_b1_ate_b15()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    coluna_b1 numeric default 0;
    coluna_b4 numeric default 0;
    coluna_b8 numeric default 0;
    coluna_b12 numeric default 0;
    coluna_b15 numeric default 0;

    contadorRegistro_b1 numeric default 0;
    contadorRegistro_b1_b15 numeric default 0;
    contadorRegistro_b1_b8_b15 numeric default 0;
    contadorRegistro_b1_b4_b8_b12_b15 numeric default 0;

  begin

    delete from lotofacil.lotofacil_id_b1;
    delete from lotofacil.lotofacil_id_b1_b15;
    delete from lotofacil.lotofacil_id_b1_b8_b15;
    delete from lotofacil.lotofacil_id_b1_b4_b8_b12_b15;
    delete from lotofacil.lotofacil_id_b1;

    /**
      Cada coluna b, tem um valor máximo, que a coluna pode ser atingida, segue-se valores:
      b1  -> mínimo: 1, máximo: 11
      b2  -> minimo: 2, máximo: 12
      b3  -> 13
      b4  -> 14
      b5  -> 15
      b6  -> 16
      b7  -> 17
      b8  -> 18
      b9  -> 19
      b10 -> 20
      b11 -> 21
      b12 -> 22
      b13 -> 23
      b14 -> 24
      b15 -> 25

     */

    contadorRegistro_b1 := 0;
    contadorRegistro_b1_b15 := 0;
    for Coluna_b1 in 1..11 LOOP
      contadorRegistro_b1 := contadorRegistro_b1 + 1;
      Insert into lotofacil.lotofacil_id_b1(b1_id, b1) values(contadorRegistro_b1, coluna_b1);

      for coluna_b15 in (coluna_b1 + 14)..25 LOOP
        contadorRegistro_b1_b15 := contadorRegistro_b1_b15 + 1;
        insert into lotofacil.lotofacil_id_b1_b15 (b1_b15_id, b1, b15)
                values(contadorRegistro_b1_b15, coluna_b1, coluna_b15);
      END LOOP;
    end loop;

    contadorRegistro_b1_b8_b15 := 0;
   for Coluna_b1 in 1..11 LOOP
        for coluna_b8 in (coluna_b1 + 7)..18 LOOP
            for coluna_b15 in (coluna_b8 + 7)..25 loop
              contadorRegistro_b1_b8_b15 := contadorRegistro_b1_b8_b15 + 1;
              insert into lotofacil.lotofacil_id_b1_b8_b15 (b1_b8_b15_id, b1, b8, b15)
                values(contadorRegistro_b1_b8_b15, coluna_b1, coluna_b8, coluna_b15);

            END LOOP;
        END LOOP;
    END LOOP;

    contadorRegistro_b1_b4_b8_b12_b15 := 0;
   for Coluna_b1 in 1..11 LOOP
      for Coluna_b4 in (coluna_b1 + 3)..13 LOOP
        for coluna_b8 in (coluna_b4 + 4)..18 LOOP
          for coluna_b12 in (coluna_b8 + 4)..22 loop
            for coluna_b15 in (coluna_b12 + 3)..25 loop
              Raise notice '%, %, %, %, %', coluna_b1, coluna_b4, coluna_b8, coluna_b12, coluna_b15;

              contadorRegistro_b1_b4_b8_b12_b15 := contadorRegistro_b1_b4_b8_b12_b15 + 1;
              insert into lotofacil.lotofacil_id_b1_b4_b8_b12_b15 (b1_b4_b8_b12_b15_id, b1, b4, b8, b12, b15)
                values(contadorRegistro_b1_b4_b8_b12_b15, coluna_b1, coluna_b4, coluna_b8, coluna_b12, coluna_b15);

            END LOOP;
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
  end $$;

Select lotofacil.fn_lotofacil_id_b1_ate_b15();

drop function if exists lotofacil.fn_lotofacil_id_grupo();
create function lotofacil.fn_lotofacil_id_grupo()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    uA numeric default 0;
    uB numeric default 0;
    uC numeric default 0;
    uD numeric default 0;
    uE numeric default 0;
    contadorID numeric default 0;
    strGrupoSql character varying;
  begin

    Delete from lotofacil.lotofacil_id_grupo;
    Delete from lotofacil.lotofacil_id_grupo_2bolas;
    Delete from lotofacil.lotofacil_id_grupo_3bolas;
    Delete from lotofacil.lotofacil_id_grupo_4bolas;
    Delete from lotofacil.lotofacil_id_grupo_5bolas;

    contadorID := -1;
    for uA in 1..25 LOOP
        contadorID := contadorID + 1;
        Insert Into lotofacil.lotofacil_id_grupo(grp_id, bola) VALUES
          (contadorID, uA);
    END LOOP;


    contadorID := -1;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        contadorID := contadorID + 1;
        Insert Into lotofacil.lotofacil_id_grupo_2bolas(grp_id, bola1, bola2) VALUES
          (contadorID, uA, uB);
      END LOOP;
    END LOOP;

    contadorID := -1;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        for uC in (uB + 1)..25 loop
          contadorID := contadorID + 1;
          Insert Into lotofacil.lotofacil_id_grupo_3bolas(grp_id, bola1, bola2, bola3) VALUES
            (contadorID, uA, uB, uC);
          END LOOP;
      END LOOP;
    END LOOP;

    contadorID := -1;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        for uC in (uB + 1)..25 loop
          for uD in (uC + 1)..25 loop
            contadorID := contadorID + 1;
            Insert Into lotofacil.lotofacil_id_grupo_4bolas(grp_id, bola1, bola2, bola3, bola4) VALUES
              (contadorID, uA, uB, uC, uD);
            END LOOP;
          END LOOP;
      END LOOP;
    END LOOP;

    contadorID := -1;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        for uC in (uB + 1)..25 loop
          for uD in (uC + 1)..25 loop
            for uE in (uD + 1)..25 loop
              contadorID := contadorID + 1;
              Insert Into lotofacil.lotofacil_id_grupo_5bolas(grp_id, bola1, bola2, bola3, bola4, bola5) VALUES
                (contadorID, uA, uB, uC, uD, uE);
              END LOOP;
            END LOOP;
          END LOOP;
      END LOOP;
    END LOOP;
  end $$;


drop function if exists lotofacil.fn_lotofacil_id_primo();
create function lotofacil.fn_lotofacil_id_primo()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    qtPrimos numeric;
    qtNaoPrimos numeric;
    indiceRegistro numeric;
    qtSoma numeric;
  begin
    qtPrimos := 0;
    qtNaoPrimos := 0;
    indiceRegistro := 0;

    for qtPrimos in 0..9 LOOP
      for qtNaoPrimos in 0..16 LOOP
        qtSoma := qtPrimos + qtNaoPrimos;

        if qtSoma in (15, 16, 17, 18) THEN
          indiceRegistro := indiceRegistro + 1;
          Insert into lotofacil.lotofacil_id_primo (prm_id, prm_qt, primo, nao_primo) values
            (indiceRegistro, qtSoma, qtPrimos, qtNaoPrimos);
        END IF;
      END LOOP;
    END LOOP;

  end $$;
comment on FUNCTION lotofacil.fn_lotofacil_id_primo() IS
'Esta função gera todas as combinações que consiste na quantidade de números primos e não-primos em uma único'
'jogo da lotofacil.'
'Na lotofacil, há 9 números primos'
'O que a função faz é simplesmente, usar dois loops for, um deles, o mais externo '
'terá um índice iniciando em 0, e um limite inclusivo de 9, '
'tais números indicará a quantidade de números primos em um único jogo, '
'o outro loop mais interno, indica as quantidades de números não-primos, iniciando '
'em zero, e indo até 16, pois, somando o limite do loop externo + o limite do loop interno, '
'não pode exceder o total de bolas da lotofacil.'
'A lógica da função e verificar se a quantidade de números primos + números pares é igual a 15, 16, 17 ou 18,'
'se sim registrar isto na tabela.';

-- Select lotofacil.fn_lotofacil_id_primo();

*/
















