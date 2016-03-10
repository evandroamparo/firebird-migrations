-- // varios comandos
-- Migration SQL that makes the change goes here.

create view vconfiguracoes (nome)
  as select nome from tabconfiguracoes^

CREATE OR ALTER trigger TABCONFIGURACOES_BI for TABCONFIGURACOES
active before insert position 0
as
begin
  if (new.ID is null) then
    new.ID = gen_id(GEN_TABCONFIGURACOES_ID,1);

  if (new.DATA is null) then
    new.DATA = current_date;
end^


-- //@UNDO
-- SQL to undo the change goes here.

drop trigger TABCONFIGURACOES_BI^

drop view vconfiguracoes^