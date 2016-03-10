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
insert into test1 (id, name) values (4, 'name 4');

--changeset evandroamparo:proc splitStatements:false
CREATE OR ALTER PROCEDURE PROCTESTE (
    in_id integer)
as
BEGIN
  DELETE FROM test1
  WHERE id = :in_id;
END;

--rollback drop procedure PROCTESTE;

--changeset evandroamparo:view
create view vteste (codigo, nome)
  as select id, name from test1;

--rollback drop view vteste;

--changeset evandroamparo:seq
create sequence seqtest1;

--rollback drop SEQUENCE seqtest1;

--changeset evandroamparo:seq2
ALTER SEQUENCE SEQTEST1 RESTART WITH 10;

--changeset evandroamparo:trigger splitStatements:false
create trigger TEST1_BI for TEST1
active before insert position 0
as
begin
  if (new.ID is null) then
    new.ID = gen_id(SEQTEST1,1);
end;

--rollback drop trigger TEST1_BI;

--changeset evandroamparo:insert
insert into TEST1 (NAME) values ('João');
insert into TEST1 (NAME) values ('José');