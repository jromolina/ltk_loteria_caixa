/**
  Triggers para a tabela lotomania_resultado_num
 */

drop trigger if exists tg_lotomania_resultado_num on lotomania.lotomania_resultado_num;

drop function if exists lotomania.fn_lotomania_resultado_num();
CREATE FUNCTION lotomania.fn_lotomania_resultado_num()
  RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  -- Vamos armazenar todas as bolas.
  resultado_num numeric[100];

  -- Vamos armazenar as bolas.
  resultado_bolas numeric[21];

  -- Indica a quantidade de bolas.
  contador_de_bolas numeric;

  qt_pares numeric;
  qt_impares numeric;

  sqlInsertResultadoBolas character varying;

  uA numeric ;


BEGIN

  CASE
    when TG_OP = 'DELETE'
    THEN
      Delete from lotomania.lotomania_resultado_bolas where concurso = old.concurso;
      Delete from lotomania.lotomania_resultado_par_impar where concurso = old.concurso;

      Delete from lotomania.lotomania_resultado_grupo_com_4 where concurso = old.concurso;

      Delete from lotomania.lotomania_resultado_horizontal where concurso = old.concurso;
      Delete from lotomania.lotomania_resultado_vertical where concurso = old.concurso;

      Delete from lotomania.lotomania_resultado_metade_horizontal where concurso = old.concurso;
      Delete from lotomania.lotomania_resultado_metade_vertical where concurso = old.concurso;

      Delete from lotomania.lotomania_resultado_quadrante where concurso = old.concurso;

      Delete from lotomania.lotomania_resultado_triangular where concurso = old.concurso;
      Delete from lotomania.lotomania_resultado_losangular where concurso = old.concurso;
      Delete from lotomania.lotomania_resultado_estrelar where concurso = old.concurso;

      return old;

  -- Aqui, praticamente o código é o mesmo iremos implementar, a lógica após.
    WHEN TG_OP = 'INSERT' OR TG_OP = 'UPDATE'
    THEN
      resultado_num[0] := new.num_0;
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
      resultado_num[26] := new.num_26;
      resultado_num[27] := new.num_27;
      resultado_num[28] := new.num_28;
      resultado_num[29] := new.num_29;
      resultado_num[30] := new.num_30;
      resultado_num[31] := new.num_31;
      resultado_num[32] := new.num_32;
      resultado_num[33] := new.num_33;
      resultado_num[34] := new.num_34;
      resultado_num[35] := new.num_35;
      resultado_num[36] := new.num_36;
      resultado_num[37] := new.num_37;
      resultado_num[38] := new.num_38;
      resultado_num[39] := new.num_39;
      resultado_num[40] := new.num_40;
      resultado_num[41] := new.num_41;
      resultado_num[42] := new.num_42;
      resultado_num[43] := new.num_43;
      resultado_num[44] := new.num_44;
      resultado_num[45] := new.num_45;
      resultado_num[46] := new.num_46;
      resultado_num[47] := new.num_47;
      resultado_num[48] := new.num_48;
      resultado_num[49] := new.num_49;
      resultado_num[50] := new.num_50;
      resultado_num[51] := new.num_51;
      resultado_num[52] := new.num_52;
      resultado_num[53] := new.num_53;
      resultado_num[54] := new.num_54;
      resultado_num[55] := new.num_55;
      resultado_num[56] := new.num_56;
      resultado_num[57] := new.num_57;
      resultado_num[58] := new.num_58;
      resultado_num[59] := new.num_59;
      resultado_num[60] := new.num_60;
      resultado_num[61] := new.num_61;
      resultado_num[62] := new.num_62;
      resultado_num[63] := new.num_63;
      resultado_num[64] := new.num_64;
      resultado_num[65] := new.num_65;
      resultado_num[66] := new.num_66;
      resultado_num[67] := new.num_67;
      resultado_num[68] := new.num_68;
      resultado_num[69] := new.num_69;
      resultado_num[70] := new.num_70;
      resultado_num[71] := new.num_71;
      resultado_num[72] := new.num_72;
      resultado_num[73] := new.num_73;
      resultado_num[74] := new.num_74;
      resultado_num[75] := new.num_75;
      resultado_num[76] := new.num_76;
      resultado_num[77] := new.num_77;
      resultado_num[78] := new.num_78;
      resultado_num[79] := new.num_79;
      resultado_num[80] := new.num_80;
      resultado_num[81] := new.num_81;
      resultado_num[82] := new.num_82;
      resultado_num[83] := new.num_83;
      resultado_num[84] := new.num_84;
      resultado_num[85] := new.num_85;
      resultado_num[86] := new.num_86;
      resultado_num[87] := new.num_87;
      resultado_num[88] := new.num_88;
      resultado_num[89] := new.num_89;
      resultado_num[90] := new.num_90;
      resultado_num[91] := new.num_91;
      resultado_num[92] := new.num_92;
      resultado_num[93] := new.num_93;
      resultado_num[94] := new.num_94;
      resultado_num[95] := new.num_95;
      resultado_num[96] := new.num_96;
      resultado_num[97] := new.num_97;
      resultado_num[98] := new.num_98;
      resultado_num[99] := new.num_99;

      contador_de_bolas := 0;
      qt_pares := 0;
      qt_impares := 0;
      for uA in 0..99 LOOP
        if resultado_num[uA] = 1 then
          contador_de_bolas := contador_de_bolas + 1;

          if mod(uA, 2) = 0 then
            qt_pares := qt_pares + 1;
          Else
            qt_impares := qt_impares + 1;
          end if;

        END if;
      end loop;

      -- Verifica se a quantidade de pares coincide com a quantidade de impares.
      if (qt_pares + qt_impares) <> 20 then
        Raise Exception 'Quantidade de pares e impares não é igual a 20';
      END IF;

      -- Insere na tabela lotomania.lotomania_resultado_bolas;
      if tg_op = 'UPDATE' then
        Delete from lotomania.lotomania_resultado_bolas where concurso = old.concurso;
        Delete from lotomania.lotomania_resultado_par_impar where concurso = old.concurso;
      END IF;

      -- Tabela par e impar.
      Execute 'Insert into lotomania.lotomania_resultado_par_impar (concurso, qt_pares, qt_impares) values ('
        || new.concurso || ', ' || qt_pares::character varying || ', ' || qt_impares::character varying || ')';


      execute lotomania.fn_lotomania_resultado_bolas(new.concurso, resultado_num);

      execute lotomania.fn_lotomania_resultado_grupo_com_4(new.concurso, resultado_num);

      execute lotomania.fn_lotomania_resultado_horizontal(new.concurso, resultado_num);
      execute lotomania.fn_lotomania_resultado_vertical(new.concurso, resultado_num);

      execute lotomania.fn_lotomania_resultado_metade_horizontal(new.concurso, resultado_num);
      execute lotomania.fn_lotomania_resultado_metade_vertical(new.concurso, resultado_num);

      execute lotomania.fn_lotomania_resultado_quadrante(new.concurso, resultado_num);

      execute lotomania.fn_lotomania_resultado_triangular(new.concurso, resultado_num);
      execute lotomania.fn_lotomania_resultado_losangular(new.concurso, resultado_num);
      execute lotomania.fn_lotomania_resultado_estrelar(new.concurso, resultado_num);

      Return new;
    RETURN New;
  END CASE;
END $$;

-- Cria o trigger
CREATE TRIGGER tg_lotomania_resultado_num
AFTER INSERT OR DELETE OR UPDATE
  ON lotomania.lotomania_resultado_num
FOR EACH ROW
EXECUTE PROCEDURE lotomania.fn_lotomania_resultado_num();

drop function if exists lotomania.fn_lotomania_resultado_bolas(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_bolas(concurso_novo numeric, resultado_num numeric[]) returns VOID
  LANGUAGE plpgsql
  as $$
  DECLARE
    resultado_bolas numeric[21];

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
          if contador_bolas > 20 THEN
            Raise EXCEPTION 'Erro, há mais de 20 bolas sorteadas';
          end if;
          strSqlInsertBolas := strSqlInsertBolas || ', ' || indice_num;
        END IF;
      END LOOP;

      -- Executa a inserção na tabela.
      execute 'Insert into lotomania.lotomania_resultado_bolas (concurso, b_1, b_2, b_3, b_4, b_5,'
        || 'b_6, b_7, b_8, b_9, b_10, b_11, b_12, b_13, b_14, b_15, b_16, b_17, b_18, b_19, b_20) values ('
        || concurso_novo || strSqlInsertBolas || ')';
    END;
  $$;


drop function if exists lotomania.fn_lotomania_resultado_grupo_com_4(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_grupo_com_4(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_grp_1 numeric;
  qt_grp_2 numeric;
  qt_grp_3 numeric;
  qt_grp_4 numeric;
  qt_grp_5 numeric;
  qt_grp_6 numeric;
  qt_grp_7 numeric;
  qt_grp_8 numeric;
  qt_grp_9 numeric;
  qt_grp_10 numeric;
  qt_grp_11 numeric;
  qt_grp_12 numeric;
  qt_grp_13 numeric;
  qt_grp_14 numeric;
  qt_grp_15 numeric;
  qt_grp_16 numeric;
  qt_grp_17 numeric;
  qt_grp_18 numeric;
  qt_grp_19 numeric;
  qt_grp_20 numeric;
  qt_grp_21 numeric;
  qt_grp_22 numeric;
  qt_grp_23 numeric;
  qt_grp_24 numeric;
  qt_grp_25 numeric;
begin
  -- Inicializa as variáveis:
  qt_grp_1 = 0;
  qt_grp_2 = 0;
  qt_grp_3 = 0;
  qt_grp_4 = 0;
  qt_grp_5 = 0;
  qt_grp_6 = 0;
  qt_grp_7 = 0;
  qt_grp_8 = 0;
  qt_grp_9 = 0;
  qt_grp_10 = 0;
  qt_grp_11 = 0;
  qt_grp_12 = 0;
  qt_grp_13 = 0;
  qt_grp_14 = 0;
  qt_grp_15 = 0;
  qt_grp_16 = 0;
  qt_grp_17 = 0;
  qt_grp_18 = 0;
  qt_grp_19 = 0;
  qt_grp_20 = 0;
  qt_grp_21 = 0;
  qt_grp_22 = 0;
  qt_grp_23 = 0;
  qt_grp_24 = 0;
  qt_grp_25 = 0;

  qt_grp_1 := resultado_num[1] + resultado_num[2] + resultado_num[11] + resultado_num[12];
  qt_grp_2 := resultado_num[3] + resultado_num[4] + resultado_num[13] + resultado_num[14];
  qt_grp_3 := resultado_num[5] + resultado_num[6] + resultado_num[15] + resultado_num[16];
  qt_grp_4 := resultado_num[7] + resultado_num[8] + resultado_num[17] + resultado_num[18];
  qt_grp_5 := resultado_num[9] + resultado_num[10] + resultado_num[19] + resultado_num[20];

  qt_grp_6 := resultado_num[21] + resultado_num[22] + resultado_num[31] + resultado_num[32];
  qt_grp_7 := resultado_num[23] + resultado_num[24] + resultado_num[33] + resultado_num[34];
  qt_grp_8 := resultado_num[25] + resultado_num[26] + resultado_num[35] + resultado_num[36];
  qt_grp_9 := resultado_num[27] + resultado_num[28] + resultado_num[37] + resultado_num[38];
  qt_grp_10 := resultado_num[29] + resultado_num[30] + resultado_num[39] + resultado_num[40];

  qt_grp_11 := resultado_num[41] + resultado_num[42] + resultado_num[51] + resultado_num[52];
  qt_grp_12 := resultado_num[43] + resultado_num[44] + resultado_num[53] + resultado_num[54];
  qt_grp_13 := resultado_num[45] + resultado_num[46] + resultado_num[55] + resultado_num[56];
  qt_grp_14 := resultado_num[47] + resultado_num[48] + resultado_num[57] + resultado_num[58];
  qt_grp_15 := resultado_num[49] + resultado_num[50] + resultado_num[59] + resultado_num[60];

  qt_grp_16 := resultado_num[61] + resultado_num[62] + resultado_num[71] + resultado_num[72];
  qt_grp_17 := resultado_num[63] + resultado_num[64] + resultado_num[73] + resultado_num[74];
  qt_grp_18 := resultado_num[65] + resultado_num[66] + resultado_num[75] + resultado_num[76];
  qt_grp_19 := resultado_num[67] + resultado_num[68] + resultado_num[77] + resultado_num[78];
  qt_grp_20 := resultado_num[69] + resultado_num[70] + resultado_num[79] + resultado_num[80];

  qt_grp_21 := resultado_num[81] + resultado_num[82] + resultado_num[91] + resultado_num[92];
  qt_grp_22 := resultado_num[83] + resultado_num[84] + resultado_num[93] + resultado_num[94];
  qt_grp_23 := resultado_num[85] + resultado_num[86] + resultado_num[95] + resultado_num[96];
  qt_grp_24 := resultado_num[87] + resultado_num[88] + resultado_num[97] + resultado_num[98];
  qt_grp_25 := resultado_num[89] + resultado_num[90] + resultado_num[99] + resultado_num[0];

  Raise Notice '%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,%,', qt_grp_1, qt_grp_2, qt_grp_3, qt_grp_4, qt_grp_5, qt_grp_6, qt_grp_7, qt_grp_8,
    qt_grp_9, qt_grp_10, qt_grp_11, qt_grp_12, qt_grp_13, qt_grp_14, qt_grp_15, qt_grp_16, qt_grp_17,
    qt_grp_18, qt_grp_19, qt_grp_20, qt_grp_21, qt_grp_22, qt_grp_23, qt_grp_24, qt_grp_25;

  Insert into lotomania.lotomania_resultado_grupo_com_4 (concurso, grp_1, grp_2, grp_3, grp_4, grp_5,
                                                         grp_6, grp_7, grp_8, grp_9, grp_10, grp_11,
                                                         grp_12, grp_13, grp_14, grp_15, grp_16, grp_17,
                                                         grp_18, grp_19, grp_20, grp_21, grp_22, grp_23,
                                                         grp_24, grp_25) values(
    concurso_novo,  qt_grp_1, qt_grp_2, qt_grp_3, qt_grp_4, qt_grp_5, qt_grp_6, qt_grp_7, qt_grp_8,
    qt_grp_9, qt_grp_10, qt_grp_11, qt_grp_12, qt_grp_13, qt_grp_14, qt_grp_15, qt_grp_16, qt_grp_17,
    qt_grp_18, qt_grp_19, qt_grp_20, qt_grp_21, qt_grp_22, qt_grp_23, qt_grp_24, qt_grp_25);

end $$;


drop function if exists lotomania.fn_lotomania_resultado_quadrante(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_quadrante(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
begin

end $$;

drop function if exists lotomania.fn_lotomania_resultado_horizontal(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_horizontal(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_hrz_1 numeric default 0;
  qt_hrz_2 numeric default 0;
  qt_hrz_3 numeric default 0;
  qt_hrz_4 numeric default 0;
  qt_hrz_5 numeric default 0;
begin
  qt_hrz_1 := resultado_num[1] + resultado_num[2] + resultado_num[3] + resultado_num[4] + resultado_num[5] + 
              resultado_num[6] + resultado_num[7] + resultado_num[8] + resultado_num[9] + resultado_num[10] + 
              resultado_num[11] + resultado_num[12] + resultado_num[13] + resultado_num[14] + resultado_num[15] + 
              resultado_num[16] + resultado_num[17] + resultado_num[18] + resultado_num[19] + resultado_num[20];

  qt_hrz_2 := resultado_num[21] + resultado_num[22] + resultado_num[23] + resultado_num[24] + resultado_num[25] + 
              resultado_num[26] + resultado_num[27] + resultado_num[28] + resultado_num[29] + resultado_num[30] + 
              resultado_num[31] + resultado_num[32] + resultado_num[33] + resultado_num[34] + resultado_num[35] + 
              resultado_num[36] + resultado_num[37] + resultado_num[38] + resultado_num[39] + resultado_num[40];

  qt_hrz_3 := resultado_num[41] + resultado_num[42] + resultado_num[43] + resultado_num[44] + resultado_num[45] + 
              resultado_num[46] + resultado_num[47] + resultado_num[48] + resultado_num[49] + resultado_num[50] + 
              resultado_num[51] + resultado_num[52] + resultado_num[53] + resultado_num[54] + resultado_num[55] + 
              resultado_num[56] + resultado_num[57] + resultado_num[58] + resultado_num[59] + resultado_num[60];

  qt_hrz_4 := resultado_num[61] + resultado_num[62] + resultado_num[63] + resultado_num[64] + resultado_num[65] + 
              resultado_num[66] + resultado_num[67] + resultado_num[68] + resultado_num[69] + resultado_num[70] + 
              resultado_num[71] + resultado_num[72] + resultado_num[73] + resultado_num[74] + resultado_num[75] + 
              resultado_num[76] + resultado_num[77] + resultado_num[78] + resultado_num[79] + resultado_num[80];

  qt_hrz_5 := resultado_num[81] +  resultado_num[82] +  resultado_num[83] +  resultado_num[84] +  resultado_num[85] +
              resultado_num[86] +  resultado_num[87] +  resultado_num[88] +  resultado_num[89] +  resultado_num[90] +
              resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94] +  resultado_num[95] +
              resultado_num[96] +  resultado_num[97] +  resultado_num[98] +  resultado_num[99] +  resultado_num[0];

  Insert into lotomania.lotomania_resultado_horizontal(concurso, hrz_1, hrz_2, hrz_3, hrz_4, hrz_5) values(
    concurso_novo, qt_hrz_1, qt_hrz_2, qt_hrz_3, qt_hrz_4, qt_hrz_5);
end $$;

drop function if exists lotomania.fn_lotomania_resultado_vertical(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_vertical(concurso_novo numeric, resultado_num numeric[]) returns VOID
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

  Insert into lotomania.lotomania_resultado_vertical(concurso, vrt_1, vrt_2, vrt_3, vrt_4, vrt_5) VALUES (
    concurso_novo, qt_vrt_1, qt_vrt_2, qt_vrt_3, qt_vrt_4, qt_vrt_5);

end $$;

drop function if exists lotomania.fn_lotomania_resultado_metade_horizontal(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_metade_horizontal(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_met_hrz_1 numeric default 0;
  qt_met_hrz_2 numeric default 0;
begin
  qt_met_hrz_1 := 
    resultado_num[1] +  resultado_num[2] +  resultado_num[3] +  resultado_num[4] +  resultado_num[5] +
    resultado_num[11] +  resultado_num[12] +  resultado_num[13] +  resultado_num[14] +  resultado_num[15] +
    resultado_num[21] +  resultado_num[22] +  resultado_num[23] +  resultado_num[24] +  resultado_num[25] +
    resultado_num[31] +  resultado_num[32] +  resultado_num[33] +  resultado_num[34] +  resultado_num[35] +
    resultado_num[41] +  resultado_num[42] +  resultado_num[43] +  resultado_num[44] +  resultado_num[45] +
    resultado_num[51] +  resultado_num[52] +  resultado_num[53] +  resultado_num[54] +  resultado_num[55] +
    resultado_num[61] +  resultado_num[62] +  resultado_num[63] +  resultado_num[64] +  resultado_num[65] +
    resultado_num[71] +  resultado_num[72] +  resultado_num[73] +  resultado_num[74] +  resultado_num[75] +
    resultado_num[81] +  resultado_num[82] +  resultado_num[83] +  resultado_num[84] +  resultado_num[85] +
    resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94] +  resultado_num[95];

  qt_met_hrz_2 :=
    resultado_num[6] +  resultado_num[7] +  resultado_num[8] +  resultado_num[9] +  resultado_num[10] +
    resultado_num[16] +  resultado_num[17] +  resultado_num[18] +  resultado_num[19] +  resultado_num[20] +
    resultado_num[26] +  resultado_num[27] +  resultado_num[28] +  resultado_num[29] +  resultado_num[30] +
    resultado_num[36] +  resultado_num[37] +  resultado_num[38] +  resultado_num[39] +  resultado_num[40] +
    resultado_num[46] +  resultado_num[47] +  resultado_num[48] +  resultado_num[49] +  resultado_num[50] +
    resultado_num[56] +  resultado_num[57] +  resultado_num[58] +  resultado_num[59] +  resultado_num[60] +
    resultado_num[66] +  resultado_num[67] +  resultado_num[68] +  resultado_num[69] +  resultado_num[70] +
    resultado_num[76] +  resultado_num[77] +  resultado_num[78] +  resultado_num[79] +  resultado_num[80] +
    resultado_num[86] +  resultado_num[87] +  resultado_num[88] +  resultado_num[89] +  resultado_num[90] +
    resultado_num[96] +  resultado_num[97] +  resultado_num[98] +  resultado_num[99] +  resultado_num[0];

  Insert into lotomania.lotomania_resultado_metade_horizontal (concurso, met_hrz_1, met_hrz_2) values (
    concurso_novo, qt_met_hrz_1, qt_met_hrz_2);

end $$;

drop function if exists lotomania.fn_lotomania_resultado_metade_vertical(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_metade_vertical(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_met_vrt_1 numeric default 0;
  qt_met_vrt_2 numeric default 0;
begin
  qt_met_vrt_1 :=
    resultado_num[1] +  resultado_num[2] +  resultado_num[3] +  resultado_num[4] +  resultado_num[5] +
    resultado_num[6] +  resultado_num[7] +  resultado_num[8] +  resultado_num[9] +  resultado_num[10] +
    resultado_num[11] +  resultado_num[12] +  resultado_num[13] +  resultado_num[14] +  resultado_num[15] +
    resultado_num[16] +  resultado_num[17] +  resultado_num[18] +  resultado_num[19] +  resultado_num[20] +
    resultado_num[21] +  resultado_num[22] +  resultado_num[23] +  resultado_num[24] +  resultado_num[25] +
    resultado_num[26] +  resultado_num[27] +  resultado_num[28] +  resultado_num[29] +  resultado_num[30] +
    resultado_num[31] +  resultado_num[32] +  resultado_num[33] +  resultado_num[34] +  resultado_num[35] +
    resultado_num[36] +  resultado_num[37] +  resultado_num[38] +  resultado_num[39] +  resultado_num[40] +
    resultado_num[41] +  resultado_num[42] +  resultado_num[43] +  resultado_num[44] +  resultado_num[45] +
    resultado_num[46] +  resultado_num[47] +  resultado_num[48] +  resultado_num[49] +  resultado_num[50];

  qt_met_vrt_2 :=
    resultado_num[51] +  resultado_num[52] +  resultado_num[53] +  resultado_num[54] +  resultado_num[55] +
    resultado_num[56] +  resultado_num[57] +  resultado_num[58] +  resultado_num[59] +  resultado_num[60] +
    resultado_num[61] +  resultado_num[62] +  resultado_num[63] +  resultado_num[64] +  resultado_num[65] +
    resultado_num[66] +  resultado_num[67] +  resultado_num[68] +  resultado_num[69] +  resultado_num[70] +
    resultado_num[71] +  resultado_num[72] +  resultado_num[73] +  resultado_num[74] +  resultado_num[75] +
    resultado_num[76] +  resultado_num[77] +  resultado_num[78] +  resultado_num[79] +  resultado_num[80] +
    resultado_num[81] +  resultado_num[82] +  resultado_num[83] +  resultado_num[84] +  resultado_num[85] +
    resultado_num[86] +  resultado_num[87] +  resultado_num[88] +  resultado_num[89] +  resultado_num[90] +
    resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94] +  resultado_num[95] +
    resultado_num[96] +  resultado_num[97] +  resultado_num[98] +  resultado_num[99] +  resultado_num[0];

  INSERT into lotomania.lotomania_resultado_metade_vertical(concurso, met_vrt_1, met_vrt_2) VALUES (
    concurso_novo, qt_met_vrt_1, qt_met_vrt_2);
end $$;


drop function if exists lotomania.fn_lotomania_resultado_quadrante(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_quadrante(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_qd_1 numeric default 0;
  qt_qd_2 numeric default 0;
  qt_qd_3 numeric default 0;
  qt_qd_4 numeric default 0;
begin
  qt_qd_1 := resultado_num[1] +  resultado_num[2] +  resultado_num[3] +  resultado_num[4] +  resultado_num[5] +
             resultado_num[11] +  resultado_num[12] +  resultado_num[13] +  resultado_num[14] +  resultado_num[15] +
             resultado_num[21] +  resultado_num[22] +  resultado_num[23] +  resultado_num[24] +  resultado_num[25] +
             resultado_num[31] +  resultado_num[32] +  resultado_num[33] +  resultado_num[34] +  resultado_num[35] +
             resultado_num[41] +  resultado_num[42] +  resultado_num[43] +  resultado_num[44] +  resultado_num[45];

  qt_qd_2 := resultado_num[6] + resultado_num[7] + resultado_num[8] + resultado_num[9] + resultado_num[10] +
             resultado_num[16] + resultado_num[17] + resultado_num[18] + resultado_num[19] + resultado_num[20] +
             resultado_num[26] + resultado_num[27] + resultado_num[28] + resultado_num[29] + resultado_num[30] +
             resultado_num[36] + resultado_num[37] + resultado_num[38] + resultado_num[39] + resultado_num[40] +
             resultado_num[46] + resultado_num[47] + resultado_num[48] + resultado_num[49] + resultado_num[50];

  qt_qd_3 := resultado_num[56] + resultado_num[57] + resultado_num[58] + resultado_num[59] + resultado_num[60] +
             resultado_num[66] + resultado_num[67] + resultado_num[68] + resultado_num[69] + resultado_num[70] +
             resultado_num[76] + resultado_num[77] + resultado_num[78] + resultado_num[79] + resultado_num[80] +
             resultado_num[86] + resultado_num[87] + resultado_num[88] + resultado_num[89] + resultado_num[90] +
             resultado_num[96] + resultado_num[97] + resultado_num[98] + resultado_num[99] + resultado_num[0];

  qt_qd_4 := resultado_num[51] +  resultado_num[52] +  resultado_num[53] +  resultado_num[54] +  resultado_num[55] +
             resultado_num[61] +  resultado_num[62] +  resultado_num[63] +  resultado_num[64] +  resultado_num[65] +
             resultado_num[71] +  resultado_num[72] +  resultado_num[73] +  resultado_num[74] +  resultado_num[75] +
             resultado_num[81] +  resultado_num[82] +  resultado_num[83] +  resultado_num[84] +  resultado_num[85] +
             resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94] +  resultado_num[95];

  Insert into lotomania.lotomania_resultado_quadrante(concurso, qd_1, qd_2, qd_3, qd_4) values (
    concurso_novo, qt_qd_1, qt_qd_2, qt_qd_3, qt_qd_4);
end $$;

drop function if exists lotomania.fn_lotomania_resultado_triangular(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_triangular(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_tr_1 numeric default 0;
  qt_tr_2 numeric default 0;
  qt_tr_3 numeric default 0;
  qt_tr_4 numeric default 0;
begin
  qt_tr_1 := resultado_num[1] +  resultado_num[2] +  resultado_num[3] +  resultado_num[4] +  resultado_num[5] +
             resultado_num[6] +  resultado_num[7] +  resultado_num[8] +  resultado_num[9] +  resultado_num[10] +
             resultado_num[12] +  resultado_num[13] +  resultado_num[14] +  resultado_num[15] +  resultado_num[16] +
             resultado_num[17] +  resultado_num[18] +  resultado_num[19] +  resultado_num[23] +  resultado_num[24] +
             resultado_num[25] +  resultado_num[26] +  resultado_num[27] +  resultado_num[28] +  resultado_num[34] +
             resultado_num[35] +  resultado_num[36] +  resultado_num[37] +  resultado_num[45] +  resultado_num[46];

  qt_tr_2 := resultado_num[20] +  resultado_num[30] +  resultado_num[40] +  resultado_num[50] +  resultado_num[60] +
             resultado_num[70] +  resultado_num[80] +  resultado_num[90] +  resultado_num[29] +  resultado_num[39] +
             resultado_num[49] +  resultado_num[59] +  resultado_num[69] +  resultado_num[79] +  resultado_num[38] +
             resultado_num[48] +  resultado_num[58] +  resultado_num[68] +  resultado_num[47] +  resultado_num[57];

  qt_tr_3 := resultado_num[55] +  resultado_num[56] +  resultado_num[64] +  resultado_num[65] +  resultado_num[66] +
             resultado_num[67] +  resultado_num[73] +  resultado_num[74] +  resultado_num[75] +  resultado_num[76] +
             resultado_num[77] +  resultado_num[78] +  resultado_num[82] +  resultado_num[83] +  resultado_num[84] +
             resultado_num[85] +  resultado_num[86] +  resultado_num[87] +  resultado_num[88] +  resultado_num[89] +
             resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94] +  resultado_num[95] +
             resultado_num[96] +  resultado_num[97] +  resultado_num[98] +  resultado_num[99] +  resultado_num[0];

  qt_tr_4 := resultado_num[11] +  resultado_num[21] +  resultado_num[31] +  resultado_num[41] +  resultado_num[51] +
             resultado_num[61] +  resultado_num[71] +  resultado_num[81] +  resultado_num[22] +  resultado_num[32] +
             resultado_num[42] +  resultado_num[52] +  resultado_num[62] +  resultado_num[72] +  resultado_num[33] +
             resultado_num[43] +  resultado_num[53] +  resultado_num[63] +  resultado_num[44] +  resultado_num[54];

  Insert into lotomania.lotomania_resultado_triangular(concurso, tr_1, tr_2, tr_3, tr_4) values
    (concurso_novo, qt_tr_1, qt_tr_2, qt_tr_3, qt_tr_4);
end $$;

drop function if exists lotomania.fn_lotomania_resultado_losangular(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_losangular(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_ls_1 numeric default 0;
  qt_ls_2 numeric default 0;
  qt_ls_3 numeric default 0;
  qt_ls_4 numeric default 0;
  qt_ls_5 numeric default 0;
  qt_ls_6 numeric default 0;
begin
  qt_ls_1 := resultado_num[1] +  resultado_num[2] +  resultado_num[3] +  resultado_num[4] +
             resultado_num[11] +  resultado_num[12] +  resultado_num[13] +  resultado_num[21] +
             resultado_num[22] +  resultado_num[31];

  qt_ls_2 := resultado_num[5] +  resultado_num[6] +  resultado_num[14] +  resultado_num[15] +  resultado_num[16] +
             resultado_num[17] +  resultado_num[23] +  resultado_num[24] +  resultado_num[25] +  resultado_num[26] +
             resultado_num[27] +  resultado_num[28] +  resultado_num[32] +  resultado_num[33] +  resultado_num[34] +
             resultado_num[35] +  resultado_num[36] +  resultado_num[37] +  resultado_num[38] +  resultado_num[39] +
             resultado_num[41] +  resultado_num[42] +  resultado_num[43] +  resultado_num[44] +  resultado_num[45] +
             resultado_num[46] +  resultado_num[47] +  resultado_num[48] +  resultado_num[49] +  resultado_num[50];

  qt_ls_3 := resultado_num[7] +  resultado_num[8] +  resultado_num[9] +  resultado_num[10] +  resultado_num[18] +
             resultado_num[19] +  resultado_num[20] +  resultado_num[29] +  resultado_num[30] +  resultado_num[40];

  qt_ls_4 := resultado_num[70] +  resultado_num[80] +  resultado_num[90] +  resultado_num[0] +  resultado_num[79] +
             resultado_num[89] +  resultado_num[99] +  resultado_num[88] +  resultado_num[98] +  resultado_num[97];

  qt_ls_5 := resultado_num[51] +  resultado_num[52] +  resultado_num[53] +  resultado_num[54] +  resultado_num[55] +
             resultado_num[56] +  resultado_num[57] +  resultado_num[58] +  resultado_num[59] +  resultado_num[60] +
             resultado_num[62] +  resultado_num[63] +  resultado_num[64] +  resultado_num[65] +  resultado_num[66] +
             resultado_num[67] +  resultado_num[68] +  resultado_num[69] +  resultado_num[73] +  resultado_num[74] +
             resultado_num[75] +  resultado_num[76] +  resultado_num[77] +  resultado_num[78] +  resultado_num[84] +
             resultado_num[85] +  resultado_num[86] +  resultado_num[87] +  resultado_num[95] +  resultado_num[96];

  qt_ls_6 := resultado_num[61] +  resultado_num[71] +  resultado_num[72] +  resultado_num[81] +  resultado_num[82] +
             resultado_num[83] +  resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94];

  Insert into lotomania.lotomania_resultado_losangular(concurso, ls_1, ls_2, ls_3, ls_4, ls_5, ls_6)
    values(concurso_novo, qt_ls_1, qt_ls_2, qt_ls_3, qt_ls_4, qt_ls_5, qt_ls_6);
end $$;


drop function if exists lotomania.fn_lotomania_resultado_estrelar(numeric, numeric[]);
create function lotomania.fn_lotomania_resultado_estrelar(concurso_novo numeric, resultado_num numeric[]) returns VOID
 LANGUAGE plpgsql
AS $$
DECLARE
  qt_st_1 numeric default 0;
  qt_st_2 numeric default 0;
  qt_st_3 numeric default 0;
  qt_st_4 numeric default 0;
  qt_st_5 numeric default 0;
  qt_st_6 numeric default 0;
  qt_st_7 numeric default 0;
  qt_st_8 numeric default 0;
begin

  qt_st_1 := resultado_num[1] + resultado_num[2] + resultado_num[3] + resultado_num[4] + resultado_num[5] + 
             resultado_num[12] + resultado_num[13] + resultado_num[14] +  resultado_num[15] + resultado_num[23] + 
             resultado_num[24] + resultado_num[25] + resultado_num[34] + resultado_num[35] + resultado_num[45];

  qt_st_2 := resultado_num[6] + resultado_num[7] + resultado_num[8] + resultado_num[9] + resultado_num[10] + 
              resultado_num[16] + resultado_num[17] + resultado_num[18] + resultado_num[19] + resultado_num[26] +
             resultado_num[27] + resultado_num[28] + resultado_num[36] + resultado_num[37] + resultado_num[46];
  
  qt_st_3 := resultado_num[20] +  resultado_num[30] +  resultado_num[40] +  resultado_num[50] +  resultado_num[29] +
             resultado_num[39] +  resultado_num[49] +  resultado_num[38] +  resultado_num[48] +  resultado_num[47];

  qt_st_4 := resultado_num[57] +  resultado_num[58] +  resultado_num[59] +  resultado_num[60] +  resultado_num[68] +
             resultado_num[69] +  resultado_num[70] +  resultado_num[79] +  resultado_num[80] +  resultado_num[90];

  qt_st_5 := resultado_num[56] +  resultado_num[66] +  resultado_num[67] +  resultado_num[76] +  resultado_num[77] + 
             resultado_num[78] +  resultado_num[86] +  resultado_num[87] + resultado_num[88] + resultado_num[89] + 
              resultado_num[96] +  resultado_num[97] +  resultado_num[98] +  resultado_num[99] +  resultado_num[0];

  qt_st_6 := resultado_num[55] +  resultado_num[64] +  resultado_num[65] +  resultado_num[73] +  resultado_num[74] +
             resultado_num[75] +  resultado_num[82] +  resultado_num[83] +  resultado_num[84] +  resultado_num[85] +
             resultado_num[91] +  resultado_num[92] +  resultado_num[93] +  resultado_num[94] +  resultado_num[95];
  
  qt_st_7 := resultado_num[51] +  resultado_num[52] +  resultado_num[53] +  resultado_num[54] +  resultado_num[61] +
             resultado_num[62] +  resultado_num[63] +  resultado_num[71] +  resultado_num[72] +  resultado_num[81];
  
  qt_st_8 := resultado_num[11] +  resultado_num[21] +  resultado_num[22] +  resultado_num[31] +  resultado_num[32] +
             resultado_num[33] +  resultado_num[41] +  resultado_num[42] +  resultado_num[43] +  resultado_num[44];

  Insert into lotomania.lotomania_resultado_estrelar(concurso, st_1, st_2, st_3, st_4, st_5, st_6, st_7, st_8) values
    (concurso_novo, qt_st_1, qt_st_2, qt_st_3, qt_st_4, qt_st_5, qt_st_6, qt_st_7, qt_st_8);
end $$;


Insert into lotomania.lotomania_resultado_num (concurso, data, num_0, num_1, num_2, num_3, num_4, num_5,
                                               num_6, num_7, num_8, num_9, num_10, num_11, num_12, num_13,
                                               num_14, num_15, num_16, num_17, num_18, num_19, num_20,
                                               num_21, num_22, num_23, num_24, num_25, num_26, num_27,
                                               num_28, num_29, num_30, num_31, num_32, num_33, num_34,
                                               num_35, num_36, num_37, num_38, num_39, num_40, num_41,
                                               num_42, num_43, num_44, num_45, num_46, num_47, num_48,
                                               num_49, num_50, num_51, num_52, num_53, num_54, num_55,
                                               num_56, num_57, num_58, num_59, num_60, num_61, num_62,
                                               num_63, num_64, num_65, num_66, num_67, num_68, num_69,
                                               num_70, num_71, num_72, num_73, num_74, num_75, num_76,
                                               num_77, num_78, num_79, num_80, num_81, num_82, num_83,
                                               num_84, num_85, num_86, num_87, num_88, num_89, num_90,
                                               num_91, num_92, num_93, num_94, num_95, num_96, num_97,
                                               num_98, num_99) VALUES
  (3, '2017-08-29', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  )





