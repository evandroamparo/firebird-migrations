--liquibase formatted sql

--changeset evandroamparo:6652
create table test1 (
    id int primary key,
    name varchar(255)
);

--rollback drop table test1;

--changeset evandroamparo:7032
insert into test1 (id, name) values (1, 'name 1');
insert into test1 (id, name) values (2, 'name 2');

--rollback delete from test1;

--changeset evandroamparo:7018
insert into test1 (id, name) values (3, 'name 3');

--changeset evandroamparo:6845
insert into test1 (id, name) values (4, 'name 4');

--changeset evandroamparo:proc endDelimiter:^ splitStatements:false
CREATE OR ALTER PROCEDURE PROCTESTE (
    INACAO integer,
    INCODIGOPRODUTOR type of CODIGOS)
as
BEGIN
   IF (:INACAO = 3) THEN BEGIN
      DELETE FROM TABNOVOSSOCIOS
      WHERE CODIGOPRODUTOR = :INCODIGOPRODUTOR;
   END
END;

CREATE VIEW VTESTE(ID, VALOR)
AS SELECT CODIGONOTAFISCAL, VALOR, FROM TABNOTASFISCAIS;