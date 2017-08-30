/**
  Este arquivo armazena toda as tabelas referentes a grupos:
  Haverá grupos de 2, 3, 4 e 5 bolas, pois, o objetivos destas tabelas, é verificar
  qual é o par que mais sai.
  Cada grupos, haverá uma quantidade x de registros, segue-se informação:
  Grupo com 2 bolas   =   3160 registros;
  Grupo com 3 bolas   =   82160 registros;
  Grupo com 4 bolas   =   1.581.580 registros;
  Grupo com 5 bolas   =   24.040.016 registros;
  Grupo com 6 bolas   =   300.500.200 registros;
  Grupo com 7 bolas   =   3.176.716.400 registros;
 */
drop table IF EXISTS lotomania.lotomania_grupo_de_2_bolas;
create table lotomania.lotomania_grupo_de_2_bolas(
  bola_1 numeric not null,
  bola_2 numeric not null,
  CONSTRAINT lotomania_grupo_de_2_bolas_pk primary key (bola_1, bola_2)
);

drop table IF EXISTS lotomania.lotomania_grupo_de_3_bolas;
create table lotomania.lotomania_grupo_de_3_bolas(
  bola_1 numeric not null,
  bola_2 numeric not null,
  bola_3 numeric not null,
  CONSTRAINT lotomania_grupo_de_3_bolas_pk primary key (bola_1, bola_2, bola_3)
);

drop table IF EXISTS lotomania.lotomania_grupo_de_4_bolas;
create table lotomania.lotomania_grupo_de_4_bolas(
  bola_1 numeric not null,
  bola_2 numeric not null,
  bola_3 numeric not null,
  bola_4 numeric not null,
  CONSTRAINT lotomania_grupo_de_4_bolas_pk primary key (bola_1, bola_2, bola_3, bola_4)
);



