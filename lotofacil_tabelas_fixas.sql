/**
  Haverá algumas tabelas que terão valores fixos.
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
  CONSTRAINT lotofacil_horizontal_id_chk check ((hrz_1 + hrz_2 + hrz_3 + hrz_4 + hrz_5) = hrz_qt)
);

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
  CONSTRAINT lotofacil_vertical_id_chk check ((vrt_1 + vrt_2 + vrt_3 + vrt_4 + vrt_5) = vrt_qt)
);

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
  CONSTRAINT lotofacil_diagonal_id_chk check ((dg_1 + dg_2 + dg_3 + dg_4 + dg_5) = dg_qt)
);

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
  CONSTRAINT lotofacil_cruzeta_id_chk check ((crz_1 + crz_2 + crz_3 + crz_4 + crz_5) = crz_qt)
);

/**
  Na lotofacil, há no máximo, 9 internos e 16 externos.
 */
drop table if exists lotofacil.lotofacil_externo_interno_id;
create table lotofacil.lotofacil_externo_interno_id(
  ext_id numeric not null,
  ext_qt numeric not null check (ext_qt in (15, 16, 17, 18)),

  externo numeric not null check (externo between 6 and 16),
  interno numeric not null check (interno between 0 and 9),

  CONSTRAINT lotofacil_resultado_externo_interno_pk PRIMARY KEY (ext_id, ext_qt),
  CONSTRAINT lotofacil_resultado_externo_interno_chk check (externo + interno = ext_qt)
);

drop function if exists lotofacil.fn_lotofacil_inserir_externo_interno_id();
create function lotofacil.fn_lotofacil_inserir_externo_interno_id()
  returns VOID
  LANGUAGE plpgsql
  as $$
  declare
    -- Serve pra indicar o índice de cada tabela.
    indiceRegistro numeric default 0;

    -- Serve pra percorrer o arranjo.
    qt_externo numeric;
    qt_interno numeric;

    indiceTabela numeric;

    somaColuna numeric;

  begin
    indiceRegistro := 0;
    somaColuna := 0;
    indiceTabela := 0;

    Delete from lotofacil.lotofacil_externo_interno_id;

    -- Externo pode ser 9 até 16
    -- Interno pode ser 0 até 9.
    for qt_externo in 0..16 LOOP
      for qt_interno in 0..9 LOOP
              somaColuna := qt_externo + qt_interno;

              if somaColuna in (15, 16, 17, 18) then
                indiceTabela := indiceTabela + 1;

                Insert Into lotofacil.lotofacil_externo_interno_id
                 (ext_id, ext_qt, externo, interno)
                values(indiceTabela, somaColuna, qt_externo, qt_interno);

              END IF;
      END LOOP;
    END LOOP;
  end;
  $$;
Select lotofacil.fn_lotofacil_inserir_externo_interno_id();




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



