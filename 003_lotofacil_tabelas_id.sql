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

/**
  Horizontal.
 */
drop table if EXISTS lotofacil.lotofacil_horizontal_id;
create table lotofacil.lotofacil_horizontal_id(
  hrz_id numeric not null,
  hrz_qt numeric not null check (hrz_qt in (15, 16, 17, 18)),
  hrz_1 numeric not null check (hrz_1 in (0, 1, 2, 3, 4, 5)),
  hrz_2 numeric not null check (hrz_2 in (0, 1, 2, 3, 4, 5)),
  hrz_3 numeric not null check (hrz_3 in (0, 1, 2, 3, 4, 5)),
  hrz_4 numeric not null check (hrz_4 in (0, 1, 2, 3, 4, 5)),
  hrz_5 numeric not null check (hrz_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_horizontal_id_pk PRIMARY KEY (hrz_id, hrz_qt, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5),
  CONSTRAINT lotofacil_horizontal_id_chk check ((hrz_1 + hrz_2 + hrz_3 + hrz_4 + hrz_5) = hrz_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_horizontal_id_unk UNIQUE (hrz_1, hrz_2, hrz_3, hrz_4, hrz_5)
);




/**
  Vertical.
 */
drop table if EXISTS lotofacil.lotofacil_vertical_id;
create table lotofacil.lotofacil_vertical_id(
  vrt_id numeric not null,
  vrt_qt numeric not null check (vrt_qt in (15, 16, 17, 18)),
  vrt_1 numeric not null check (vrt_1 in (0, 1, 2, 3, 4, 5)),
  vrt_2 numeric not null check (vrt_2 in (0, 1, 2, 3, 4, 5)),
  vrt_3 numeric not null check (vrt_3 in (0, 1, 2, 3, 4, 5)),
  vrt_4 numeric not null check (vrt_4 in (0, 1, 2, 3, 4, 5)),
  vrt_5 numeric not null check (vrt_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_vertical_id_pk PRIMARY KEY (vrt_id, vrt_qt, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5),
  CONSTRAINT lotofacil_vertical_id_chk check ((vrt_1 + vrt_2 + vrt_3 + vrt_4 + vrt_5) = vrt_qt),  

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_vertical_id_unk UNIQUE (vrt_1, vrt_2, vrt_3, vrt_4, vrt_5)
);



/**
  Diagonal.
 */
drop table if EXISTS lotofacil.lotofacil_diagonal_id;
create table lotofacil.lotofacil_diagonal_id(
  dg_id numeric not null,
  dg_qt numeric not null check (dg_qt in (15, 16, 17, 18)),
  dg_1 numeric not null check (dg_1 in (0, 1, 2, 3, 4, 5)),
  dg_2 numeric not null check (dg_2 in (0, 1, 2, 3, 4, 5)),
  dg_3 numeric not null check (dg_3 in (0, 1, 2, 3, 4, 5)),
  dg_4 numeric not null check (dg_4 in (0, 1, 2, 3, 4, 5)),
  dg_5 numeric not null check (dg_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_diagonal_id_pk PRIMARY KEY (dg_id, dg_qt, dg_1, dg_2, dg_3, dg_4, dg_5),
  CONSTRAINT lotofacil_diagonal_id_chk check ((dg_1 + dg_2 + dg_3 + dg_4 + dg_5) = dg_qt),
  
  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_diagonal_id_unk UNIQUE (dg_1, dg_2, dg_3, dg_4, dg_5)
);

/**
  Cruzeta.
 */
drop table if EXISTS lotofacil.lotofacil_cruzeta_id;
create table lotofacil.lotofacil_cruzeta_id(
  crz_id numeric not null,
  crz_qt numeric not null check (crz_qt in (15, 16, 17, 18)),
  crz_1 numeric not null check (crz_1 in (0, 1, 2, 3, 4, 5)),
  crz_2 numeric not null check (crz_2 in (0, 1, 2, 3, 4, 5)),
  crz_3 numeric not null check (crz_3 in (0, 1, 2, 3, 4, 5)),
  crz_4 numeric not null check (crz_4 in (0, 1, 2, 3, 4, 5)),
  crz_5 numeric not null check (crz_5 in (0, 1, 2, 3, 4, 5)),

  CONSTRAINT lotofacil_cruzeta_id_pk PRIMARY KEY (crz_id, crz_qt, crz_1, crz_2, crz_3, crz_4, crz_5),
  CONSTRAINT lotofacil_cruzeta_id_chk check ((crz_1 + crz_2 + crz_3 + crz_4 + crz_5) = crz_qt),

  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_cruzeta_id_unk UNIQUE (crz_1, crz_2, crz_3, crz_4, crz_5)

);

/**
  Externo x Interno.
  Na lotofacil, há no máximo, 9 internos e 16 externos.
  Em todas as combinações de 15, 16, 17 e 18 bolas, sempre haverá
  no máximo 9 internos, então, praticamente, podemos dizer, que ele é
  comum a todos eles, então, vamos criar este campo também.
 */
drop table if exists lotofacil.lotofacil_externo_interno_id;
create table lotofacil.lotofacil_externo_interno_id(
  ext_id numeric not null,

  -- Vamos usar este campo, quando quisermos, pegar todas as combinações
  -- de 15, 16, 17 e 18 bolas.
  int_id numeric not null check (int_id >= 0 and int_id <= 9),
  ext_int_qt numeric not null check (ext_int_qt in (15, 16, 17, 18)),

  externo numeric not null check (externo between 6 and 16),
  interno numeric not null check (interno between 0 and 9),

  CONSTRAINT lotofacil_resultado_externo_interno_id_pk PRIMARY KEY (ext_id, ext_int_qt),
  CONSTRAINT lotofacil_resultado_externo_interno_id_chk check (externo + interno = ext_int_qt),
  
  -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_externo_interno_id_unk UNIQUE (externo, interno)
);

drop function if exists lotofacil.fn_lotofacil_inserir_externo_interno_id();
create function lotofacil.fn_lotofacil_inserir_externo_interno_id()
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

    Delete from lotofacil.lotofacil_externo_interno_id;

    -- Externo pode ser 9 até 16
    -- Interno pode ser 0 até 9.
    for qt_externo in 0..16 LOOP
      for qt_interno in 0..9 LOOP
              somaExternoInterno := qt_externo + qt_interno;

              if somaExternoInterno in (15, 16, 17, 18) then
                indiceRegistro := indiceRegistro + 1;

                Insert Into lotofacil.lotofacil_externo_interno_id
                 (ext_id, int_id, ext_int_qt, externo, interno)
                values(indiceRegistro, qt_interno, somaExternoInterno, qt_externo, qt_interno);

              END IF;
      END LOOP;
    END LOOP;
  end;
  $$;
Select lotofacil.fn_lotofacil_inserir_externo_interno_id();


/**
  Par x Impar.
  Criar identificadores para cada combinação par e ímpar da lotofacil.
  Na lotofácil, há 12 pares e 13 ímpares, entretanto, iremos criar id
  somente pra as combinações possíveis na lotofacil, as combinações possíveis
  são de 15, 16, 17 e 18 bolas.
  Então, uma combinação de 15 bolas, terá no mínimo 2 pares e 13 impares ou, por exemplo
  terá 12 pares e 3 ímpares.
 */
drop table if exists lotofacil.lotofacil_par_impar_id;
create table lotofacil.lotofacil_par_impar_id(
  par_impar_id numeric not null,
  par_impar_qt numeric not null check (par_impar_qt in (15, 16, 17, 18)),

  par numeric not null check (par between 0 and 12),
  impar numeric not null check (impar between 0 and 13),

  CONSTRAINT lotofacil_resultado_par_impar_id_pk PRIMARY KEY (par_impar_id, par_impar_qt),
  CONSTRAINT lotofacil_resultado_par_impar_id_chk check (par + impar = par_impar_qt),
  
    -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_par_impar_interno_id_unk UNIQUE (par, impar)
);


drop function if exists lotofacil.fn_lotofacil_inserir_par_impar_id();
create function lotofacil.fn_lotofacil_inserir_par_impar_id()
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

    Delete from lotofacil.lotofacil_par_impar_id;

    -- par pode ser 9 até 16
    -- impar pode ser 0 até 9.
    for qt_par in 0..12 LOOP
      for qt_impar in 0..13 LOOP
              somaParImpar := qt_par + qt_impar;

              if somaParImpar in (15, 16, 17, 18) then
                indiceRegistro := indiceRegistro + 1;

                Insert Into lotofacil.lotofacil_par_impar_id
                 (par_impar_id, par_impar_qt, par, impar)
                values(indiceRegistro, somaParImpar, qt_par, qt_impar);

              END IF;
      END LOOP;
    END LOOP;
  end;
  $$;
Select lotofacil.fn_lotofacil_inserir_par_impar_id();

/**
  Novos: Bola NÃO SAIU no concurso anterior, mas saiu no concurso atual.
  Repetidos: Bola SAIU no concurso anterior e saiu no atual também.
  Há 25 números, são sorteados 15, restam 10 números.
  Então, pode haver de 0 a 10 números novos.

 */
drop table if exists lotofacil.lotofacil_novos_repetidos_id;
create table lotofacil.lotofacil_novos_repetidos_id (
  nvrpt_id  NUMERIC NOT NULL,
  novos     NUMERIC NOT NULL CHECK (novos >= 0 AND novos <= 10),
  repetidos NUMERIC NOT NULL CHECK (repetidos >= 5 AND repetidos <= 15),
  
  CONSTRAINT lotofacil_novos_repetidos_id_pk PRIMARY KEY (nvrpt_id, novos, repetidos),
  CONSTRAINT lotofacil_novos_repetidos_id_chk CHECK ((novos + repetidos) = 15),
  
    -- Devemos garantir que as colunas terão valores únicos.
  -- Não precisamos validar a coluna com a quantidade pois a validação é realizada acima.
  CONSTRAINT lotofacil_novos_repetidos_id_unk UNIQUE (novos, repetidos)
);

drop function if exists lotofacil.fn_lotofacil_inserir_novos_repetidos_id();
create function lotofacil.fn_lotofacil_inserir_novos_repetidos_id()
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

      Insert into lotofacil.lotofacil_novos_repetidos_id (nvrpt_id, novos, repetidos) VALUES
        (qt_novos, qt_novos, qt_repetidos);
    END LOOP;
  END;
  $$;
Select from lotofacil.fn_lotofacil_inserir_novos_repetidos_id();



drop function if exists lotofacil.fn_lotofacil_inserir_id();
create function lotofacil.fn_lotofacil_inserir_id()
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

    Delete from lotofacil.lotofacil_horizontal_id;
    Delete from lotofacil.lotofacil_vertical_id;
    Delete from lotofacil.lotofacil_diagonal_id;
    Delete from lotofacil.lotofacil_cruzeta_id;


    for Coluna_1 in 0..5 LOOP
      for Coluna_2 in 0..5 LOOP
        for Coluna_3 in 0..5 LOOP
          for Coluna_4 in 0..5 LOOP
            for Coluna_5 in 0..5 LOOP
              somaColuna := Coluna_1 + Coluna_2 + Coluna_3 + Coluna_4 + Coluna_5;

              if somaColuna in (15, 16, 17, 18) then
                indiceTabela := indiceTabela + 1;

                Insert Into lotofacil.lotofacil_horizontal_id(hrz_id, hrz_qt, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);

                Insert Into lotofacil.lotofacil_vertical_id(vrt_id, vrt_qt, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);

                Insert Into lotofacil.lotofacil_diagonal_id(dg_id, dg_qt, dg_1, dg_2, dg_3, dg_4, dg_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);

                Insert Into lotofacil.lotofacil_cruzeta_id(crz_id, crz_qt, crz_1, crz_2, crz_3, crz_4, crz_5)
                  values(indiceTabela, somaColuna, Coluna_1, Coluna_2, Coluna_3, Coluna_4, Coluna_5);


              END IF;
            END LOOP;
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
  end $$;

Select lotofacil.fn_lotofacil_inserir_id();

/**
  Aqui, será criado todas as combinações possíveis referentes às combinações:
  b1
  b1_b8
  b1_b8_b15
  b1_b4_b8_b12_b15
 */
drop table if EXISTS lotofacil.lotofacil_b1_id;
create table lotofacil.lotofacil_b1_id(
  b1_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  CONSTRAINT lotofacil_b1_id_pk PRIMARY KEY (b1_id),
  CONSTRAINT lotofacil_b1_id_unk UNIQUE (b1)
);

drop table if EXISTS lotofacil.lotofacil_b1_b15_id;
create table lotofacil.lotofacil_b1_b15_id(
  b1_b15_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  b15 numeric not null check (b15 >= 15 and b15 <= 25),
  CONSTRAINT lotofacil_b1_b15_id_pk PRIMARY KEY (b1_b15_id, b1, b15),
  CONSTRAINT lotofacil_b1_b15_id_unk UNIQUE (b1, b15)
);

drop table if EXISTS lotofacil.lotofacil_b1_b8_b15_id;
create table lotofacil.lotofacil_b1_b8_b15_id(
  b1_b8_b15_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  b8 numeric not null check (b8 >= 8 and b8 <= 18),
  b15 numeric not null check (b15 >= 15 and b15 <= 25),
  CONSTRAINT lotofacil_b1_b8_b15_id_pk PRIMARY KEY (b1_b8_b15_id, b1, b8, b15),
  CONSTRAINT lotofacil_b1_b8_b15_id_unk UNIQUE (b1, b8, b15)
);

drop table if EXISTS lotofacil.lotofacil_b1_b4_b8_b12_b15_id;
create table lotofacil.lotofacil_b1_b4_b8_b12_b15_id(
  b1_b4_b8_b12_b15_id numeric not null,
  b1 numeric not null check (b1 >= 1 and b1 <= 11),
  b4 numeric not null check (b4 >= 4 and b4 <= 14),
  b8 numeric not null check (b8 >= 8 and b8 <= 18),
  b12 numeric not null check (b12 >= 12 and b12 <= 22),
  b15 numeric not null check (b15 >= 15 and b15 <= 25),
  CONSTRAINT lotofacil_b1_b4_b8_b12_b15_id_pk PRIMARY KEY (b1_b4_b8_b12_b15_id, b1, b4, b8, b12, b15),
  CONSTRAINT lotofacil_b1_b4_b8_b12_b15_id_unk UNIQUE (b1, b4, b8, b12, b15)
);


drop function if exists lotofacil.fn_lotofacil_inserir_b1_ate_b15_id();
create function lotofacil.fn_lotofacil_inserir_b1_ate_b15_id()
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

    delete from lotofacil.lotofacil_b1_id;
    delete from lotofacil.lotofacil_b1_b15_id;
    delete from lotofacil.lotofacil_b1_b8_b15_id;
    delete from lotofacil.lotofacil_b1_b4_b8_b12_b15_id;
    delete from lotofacil.lotofacil_b1_id;

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
      Insert into lotofacil.lotofacil_b1_id(b1_id, b1) values(contadorRegistro_b1, coluna_b1);

      for coluna_b15 in (coluna_b1 + 14)..25 LOOP
        contadorRegistro_b1_b15 := contadorRegistro_b1_b15 + 1;
        insert into lotofacil.lotofacil_b1_b15_id (b1_b15_id, b1, b15)
                values(contadorRegistro_b1_b15, coluna_b1, coluna_b15);
      END LOOP;
    end loop;

    contadorRegistro_b1_b8_b15 := 0;
   for Coluna_b1 in 1..11 LOOP
        for coluna_b8 in (coluna_b1 + 7)..18 LOOP
            for coluna_b15 in (coluna_b8 + 7)..25 loop
              contadorRegistro_b1_b8_b15 := contadorRegistro_b1_b8_b15 + 1;
              insert into lotofacil.lotofacil_b1_b8_b15_id (b1_b8_b15_id, b1, b8, b15)
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
              insert into lotofacil.lotofacil_b1_b4_b8_b12_b15_id (b1_b4_b8_b12_b15_id, b1, b4, b8, b12, b15)
                values(contadorRegistro_b1_b4_b8_b12_b15, coluna_b1, coluna_b4, coluna_b8, coluna_b12, coluna_b15);

            END LOOP;
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
  end $$;

Select lotofacil.fn_lotofacil_inserir_b1_ate_b15_id();


drop table if exists lotofacil.lotofacil_grupo;
create table lotofacil.lotofacil_grupo (
  grp_id numeric not null,
  bola numeric not null,
  grupo_sql character VARYING not null,
  ltf_qt numeric default 0,
  res_qt numeric default 0,
  CONSTRAINT lotofacil_grupo_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_unk UNIQUE (bola)
);


drop table if exists lotofacil.lotofacil_grupo_2bolas;
create table lotofacil.lotofacil_grupo_2bolas (
  grp_id numeric not null,
  bola1 numeric not null check(bola1 < bola2),
  bola2 numeric not null check(bola1 < bola2),
  grupo_sql character VARYING not null,
  ltf_qt numeric default 0,
  res_qt numeric default 0,
  CONSTRAINT lotofacil_grupo_2bolas_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_2bolas_unk UNIQUE (bola1, bola2)
);

drop table if exists lotofacil.lotofacil_grupo_3bolas;
create table lotofacil.lotofacil_grupo_3bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null check(bola1 < bola2),
  bola3 numeric not null check(bola2 < bola3),
  grupo_sql character VARYING not null,
  ltf_qt numeric default 0,
  res_qt numeric default 0,
  CONSTRAINT lotofacil_grupo_3bolas_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_3bolas_unk UNIQUE (bola1, bola2, bola3),
  CONSTRAINT lotofacil_grupo_3bolas_chk check(bola1 >= 1 and bola1 <= 25 and
                                             bola2 >= 1 and bola2 <= 25 AND
                                             bola3 >= 1 and bola3 <= 25)
);

drop table if exists lotofacil.lotofacil_grupo_4bolas;
create table lotofacil.lotofacil_grupo_4bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null check(bola1 < bola2),
  bola3 numeric not null check(bola2 < bola3),
  bola4 numeric not null check(bola3 < bola4),
  grupo_sql character VARYING not null,
  ltf_qt numeric default 0,
  res_qt numeric default 0,
  CONSTRAINT lotofacil_grupo_4bolas_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_4bolas_unk UNIQUE (bola1, bola2, bola3, bola4),
  CONSTRAINT lotofacil_grupo_4bolas_chk check(bola1 >= 1 and bola1 <= 25 and
                                             bola2 >= 1 and bola2 <= 25 AND
                                             bola3 >= 1 and bola3 <= 25 AND
                                             bola4 >= 1 and bola4 <= 25)
);

drop table if exists lotofacil.lotofacil_grupo_5bolas;
create table lotofacil.lotofacil_grupo_5bolas (
  grp_id numeric not null,
  bola1 numeric not null,
  bola2 numeric not null check(bola1 < bola2),
  bola3 numeric not null check(bola2 < bola3),
  bola4 numeric not null check(bola3 < bola4),
  bola5 numeric not null check(bola4 < bola5),
  grupo_sql character VARYING not null,
  ltf_qt numeric default 0,
  res_qt numeric default 0,
  CONSTRAINT lotofacil_grupo_5bolas_pk PRIMARY KEY (grp_id),
  CONSTRAINT lotofacil_grupo_5bolas_unk UNIQUE (bola1, bola2, bola3, bola4, bola5),
  CONSTRAINT lotofacil_grupo_5bolas_chk check(bola1 >= 1 and bola1 <= 25 and
                                             bola2 >= 1 and bola2 <= 25 AND
                                             bola3 >= 1 and bola3 <= 25 AND
                                             bola4 >= 1 and bola4 <= 25 AND
                                             bola5 >= 1 and bola5 <= 25)
);

drop function if exists lotofacil.fn_lotofacil_inserir_grupo_id();
create function lotofacil.fn_lotofacil_inserir_grupo_id()
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

    Delete from lotofacil.lotofacil_grupo;
    Delete from lotofacil.lotofacil_grupo_2bolas;
    Delete from lotofacil.lotofacil_grupo_3bolas;
    Delete from lotofacil.lotofacil_grupo_4bolas;
    Delete from lotofacil.lotofacil_grupo_5bolas;

    contadorID := 0;
    for uA in 1..25 LOOP
        contadorID := contadorID + 1;
        strGrupoSql := '(num_' || uA || ' = 1)';
        Insert Into lotofacil.lotofacil_grupo(grp_id, bola, grupo_sql) VALUES
          (contadorID, uA, strGrupoSql);
    END LOOP;


    contadorID := 0;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        contadorID := contadorID + 1;
        strGrupoSql := '(num_' || uA || ' = 1 and num_' || ub || ' = 1)';
        Insert Into lotofacil.lotofacil_grupo_2bolas(grp_id, bola1, bola2, grupo_sql) VALUES
          (contadorID, uA, uB, strGrupoSql);
      END LOOP;
    END LOOP;

    contadorID := 0;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        for uC in (uB + 1)..25 loop
          contadorID := contadorID + 1;
          strGrupoSql := '(num_' || uA || ' = 1 and num_' || ub || ' = 1 and num_' || uC || ' = 1)' ;
          Insert Into lotofacil.lotofacil_grupo_3bolas(grp_id, bola1, bola2, bola3, grupo_sql) VALUES
            (contadorID, uA, uB, uC, strGrupoSql);
          END LOOP;
      END LOOP;
    END LOOP;

    contadorID := 0;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        for uC in (uB + 1)..25 loop
          for uD in (uC + 1)..25 loop
            contadorID := contadorID + 1;
            strGrupoSql := '(num_' || uA || ' = 1 and num_' || ub ||
                           ' = 1 and num_' || uC || ' = 1 and num_' || uD || ' = 1)';
            Insert Into lotofacil.lotofacil_grupo_4bolas(grp_id, bola1, bola2, bola3, bola4, grupo_sql) VALUES
              (contadorID, uA, uB, uC, uD, strGrupoSql);
            END LOOP;
          END LOOP;
      END LOOP;
    END LOOP;

    contadorID := 0;
    for uA in 1..25 LOOP
      for ub in (uA + 1)..25 LOOP
        for uC in (uB + 1)..25 loop
          for uD in (uC + 1)..25 loop
            for uE in (uD + 1)..25 loop
              contadorID := contadorID + 1;
              strGrupoSql := '(num_' || uA || ' = 1 and num_' || ub ||
                             ' = 1 and num_' || uC || ' = 1 and num_' ||
                             uD || ' = 1 and num_' || uE || ' = 1)';
              Insert Into lotofacil.lotofacil_grupo_5bolas(grp_id, bola1, bola2, bola3, bola4, bola5, grupo_sql) VALUES
                (contadorID, uA, uB, uC, uD, uE, strGrupoSql);
              END LOOP;
            END LOOP;
          END LOOP;
      END LOOP;
    END LOOP;
  end $$;

Select lotofacil.fn_lotofacil_inserir_grupo_id();






