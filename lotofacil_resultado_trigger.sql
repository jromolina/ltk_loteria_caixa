/**
  Triggers para a tabela lotofacil_resultado_num
 */

drop trigger if exists tg_lotofacil_resultado_num on lotofacil.lotofacil_resultado_num;

drop function if exists lotofacil.fn_lotofacil_resultado_num();
CREATE FUNCTION lotofacil.fn_lotofacil_resultado_num()
  RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  -- Armazena as 25 bolas, colocamos 26 pois, irei pegar de 1 a 25, ao invés de 0, pra indicar 1.
  resultado_num numeric[26];


  qt_pares numeric;
  qt_impares numeric;

  sqlInsertResultadoBolas character varying;

  uA numeric ;


BEGIN

  CASE
    when TG_OP = 'DELETE'
    THEN
        Delete from lotofacil.lotofacil_resultado_bolas where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_par_impar where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_externo_interno where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_horizontal where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_vertical where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_diagonal where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_cruzeta where concurso = old.concurso;

      return old;

  -- Aqui, praticamente o código é o mesmo iremos implementar, a lógica após.
    WHEN TG_OP = 'INSERT' OR TG_OP = 'UPDATE'
    THEN
      resultado_num[1] := new.num_1;
      resultado_num[2] := new.num_2;
      resultado_num[3] := new.num_3;
      resultado_num[4] := new.num_4;
      resultado_num[5] := new.num_5;
      resultado_num[6] := new.num_6;
      resultado_num[7] := new.num_7;
      resultado_num[8] := new.num_8;
      resultado_num[9] := new.num_9;
      resultado_num[10] := new.num_10;
      resultado_num[11] := new.num_11;
      resultado_num[12] := new.num_12;
      resultado_num[13] := new.num_13;
      resultado_num[14] := new.num_14;
      resultado_num[15] := new.num_15;
      resultado_num[16] := new.num_16;
      resultado_num[17] := new.num_17;
      resultado_num[18] := new.num_18;
      resultado_num[19] := new.num_19;
      resultado_num[20] := new.num_20;
      resultado_num[21] := new.num_21;
      resultado_num[22] := new.num_22;
      resultado_num[23] := new.num_23;
      resultado_num[24] := new.num_24;
      resultado_num[25] := new.num_25;

      -- Insere na tabela lotofacil.lotofacil_resultado_bolas;
      if tg_op = 'UPDATE' then
        Delete from lotofacil.lotofacil_resultado_bolas where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_par_impar where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_externo_interno where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_horizontal where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_vertical where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_diagonal where concurso = old.concurso;
        Delete from lotofacil.lotofacil_resultado_cruzeta where concurso = old.concurso;
      END IF;

      execute lotofacil.fn_lotofacil_resultado_bolas(new.concurso, resultado_num);
      execute lotofacil.fn_lotofacil_resultado_par_impar(new.concurso, resultado_num);
      execute lotofacil.fn_lotofacil_resultado_externo_interno(new.concurso, resultado_num);

      execute lotofacil.fn_lotofacil_resultado_horizontal(new.concurso, resultado_num);
      execute lotofacil.fn_lotofacil_resultado_vertical(new.concurso, resultado_num);
      execute lotofacil.fn_lotofacil_resultado_diagonal(new.concurso, resultado_num);

      EXECUTE lotofacil.fn_lotofacil_resultado_cruzeta(new.concurso, resultado_num);


      Return new;
    RETURN New;
  END CASE;
END $$;

-- Cria o trigger
CREATE TRIGGER tg_lotofacil_resultado_num
AFTER INSERT OR DELETE OR UPDATE
  ON lotofacil.lotofacil_resultado_num
FOR EACH ROW
EXECUTE PROCEDURE lotofacil.fn_lotofacil_resultado_num();



drop function if exists lotofacil.fn_lotofacil_resultado_bolas(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_bolas(concurso_novo numeric, resultado_num numeric[]) returns VOID
  LANGUAGE plpgsql
  as $$
  DECLARE
    -- Cada vez que uma bola é sorteada, incrementa esta variável.
    contador_bolas numeric;

    -- Pra percorrer o arranjo resultado_num
    indice_num numeric;

    -- Serve pra armazenar o sql dinâmicamente.
    strSqlInsertBolas CHARACTER VARYING;
  BEGIN
    strSqlInsertBolas := '';
    contador_bolas := 0;

    for indice_num in 0..99 LOOP

        if resultado_num[indice_num] = 1 THEN
          contador_bolas := contador_bolas + 1;
          if contador_bolas > 15 THEN
            Raise EXCEPTION 'Erro, há mais de 15 bolas sorteadas';
          end if;
          strSqlInsertBolas := strSqlInsertBolas || ', ' || indice_num;
        END IF;
      END LOOP;

      -- Executa a inserção na tabela.
      execute 'Insert into lotofacil.lotofacil_resultado_bolas (concurso, b_1, b_2, b_3, b_4, b_5,'
        || 'b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13, b_14, b_15) values ('
        || concurso_novo || strSqlInsertBolas || ')';
    END;
  $$;

drop function if exists lotofacil.fn_lotofacil_resultado_par_impar(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_par_impar(concurso_novo numeric, resultado_num numeric[]) returns void
  LANGUAGE plpgsql
  as $$
  DECLARE
  BEGIN

  END;$$;



drop function if exists lotofacil.fn_lotofacil_resultado_externo_interno(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_externo_interno(concurso_novo numeric, resultado_num numeric[]) returns VOID
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
  qt_externo := qt_externo + resultado_num[21] + resultado_num[22] + resultado_num[23] + resultado_num[24] + resultado_num[25];

  qt_interno := 0;
  qt_interno := qt_interno + resultado_num[7] + resultado_num[8] + resultado_num[9];
  qt_interno := qt_interno + resultado_num[12] + resultado_num[13] + resultado_num[14];
  qt_interno := qt_interno + resultado_num[17] + resultado_num[18] + resultado_num[19];

  Insert into lotofacil.lotofacil_resultado_externo_interno (concurso, ext_id)
    Select concurso_novo, ext_id from lotofacil.lotofacil_externo_interno_id
  where externo = qt_externo and interno = qt_interno;

end $$;



drop function if exists lotofacil.fn_lotofacil_resultado_horizontal(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_horizontal(concurso_novo numeric, resultado_num numeric[]) returns VOID
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

  Insert into lotofacil.lotofacil_resultado_horizontal (concurso, hrz_id)
    Select concurso_novo, hrz_id from lotofacil.lotofacil_horizontal_id
  where hrz_1 = qt_hrz_1 and hrz_2 = qt_hrz_2 and hrz_3 = qt_hrz_3 and hrz_4 = qt_hrz_4 and hrz_5 = qt_hrz_5;

end $$;


drop function if exists lotofacil.fn_lotofacil_resultado_vertical(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_vertical(concurso_novo numeric, resultado_num numeric[]) returns VOID
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

  Insert into lotofacil.lotofacil_resultado_vertical (concurso, vrt_id)
    Select concurso_novo, vrt_id from lotofacil.lotofacil_vertical_id
  where vrt_1 = qt_vrt_1 and vrt_2 = qt_vrt_2 and vrt_3 = qt_vrt_3 and vrt_4 = qt_vrt_4 and vrt_5 = qt_vrt_5;

end $$;

drop function if exists lotofacil.fn_lotofacil_resultado_diagonal(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_diagonal(concurso_novo numeric, resultado_num numeric[]) returns VOID
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

  Insert into lotofacil.lotofacil_resultado_diagonal (concurso, dg_id)
    Select concurso_novo, dg_id from lotofacil.lotofacil_diagonal_id
  where dg_1 = qt_dg_1 and dg_2 = qt_dg_2 and dg_3 = qt_dg_3 and dg_4 = qt_dg_4 and dg_5 = qt_dg_5;

end $$;

drop function if exists lotofacil.fn_lotofacil_resultado_cruzeta(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_cruzeta(concurso_novo numeric, resultado_num numeric[]) returns VOID
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

  Insert into lotofacil.lotofacil_resultado_cruzeta (concurso, crz_id)
    Select concurso_novo, crz_id from lotofacil.lotofacil_cruzeta_id
  where crz_1 = qt_crz_1 and crz_2 = qt_crz_2 and crz_3 = qt_crz_3 and crz_4 = qt_crz_4 and crz_5 = qt_crz_5;

end $$;





















drop function if exists lotofacil.fn_lotofacil_resultado_vertical(numeric, numeric[]);
create function lotofacil.fn_lotofacil_resultado_vertical(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_vrt_1 numeric default 0;
  qt_vrt_2 numeric default 0;
  qt_vrt_3 numeric default 0;
  qt_vrt_4 numeric default 0;
  qt_vrt_5 numeric default 0;
begin
  qt_vrt_1 := resultado_num[1] + resultado_num[11] + resultado_num[21] + resultado_num[31] + resultado_num[41] +
              resultado_num[51] + resultado_num[61] + resultado_num[71] + resultado_num[81] + resultado_num[91] +
              resultado_num[2] + resultado_num[12] + resultado_num[22] + resultado_num[32] + resultado_num[42] +
              resultado_num[52] + resultado_num[62] + resultado_num[72] + resultado_num[82] + resultado_num[92];

  qt_vrt_2 := resultado_num[3] + resultado_num[13] + resultado_num[23] + resultado_num[33] + resultado_num[43] +
              resultado_num[53] + resultado_num[63] + resultado_num[73] + resultado_num[83] + resultado_num[93] +
              resultado_num[4] + resultado_num[14] + resultado_num[24] + resultado_num[34] + resultado_num[44] +
              resultado_num[54] + resultado_num[64] + resultado_num[74] + resultado_num[84] + resultado_num[94];

  qt_vrt_3 := resultado_num[5] + resultado_num[15] + resultado_num[25] + resultado_num[35] + resultado_num[45] +
              resultado_num[55] + resultado_num[65] + resultado_num[75] + resultado_num[85] + resultado_num[95] +
              resultado_num[6] + resultado_num[16] + resultado_num[26] + resultado_num[36] + resultado_num[46] +
              resultado_num[56] + resultado_num[66] + resultado_num[76] + resultado_num[86] + resultado_num[96];

  qt_vrt_4 := resultado_num[7] + resultado_num[17] + resultado_num[27] + resultado_num[37] + resultado_num[47] +
              resultado_num[57] + resultado_num[67] + resultado_num[77] + resultado_num[87] + resultado_num[97] +
              resultado_num[8] + resultado_num[18] + resultado_num[28] + resultado_num[38] + resultado_num[48] +
              resultado_num[58] + resultado_num[68] + resultado_num[78] + resultado_num[88] + resultado_num[98];

  qt_vrt_5 := resultado_num[9] +  resultado_num[19] +  resultado_num[29] +  resultado_num[39] +  resultado_num[49] +
              resultado_num[59] +  resultado_num[69] +  resultado_num[79] +  resultado_num[89] +  resultado_num[99] +
              resultado_num[10] +  resultado_num[20] +  resultado_num[30] +  resultado_num[40] +  resultado_num[50] +
              resultado_num[60] +  resultado_num[70] +  resultado_num[80] +  resultado_num[90] +  resultado_num[0];
  Raise notice '%,%,%,%,%', qt_vrt_1, qt_vrt_2, qt_vrt_3, qt_vrt_4, qt_vrt_5;

  Insert into lotofacil.lotofacil_resultado_vertical(concurso, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5) VALUES (
    concurso_novo, qt_vrt_1, qt_vrt_2, qt_vrt_3, qt_vrt_4, qt_vrt_5);

end $$;
