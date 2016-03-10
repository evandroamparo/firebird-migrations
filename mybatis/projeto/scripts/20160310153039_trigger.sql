-- // trigger
-- Migration SQL that makes the change goes here.

create trigger TABCONFIGURACOES_BI for TABCONFIGURACOES
active before insert position 0
as
begin
  if (new.ID is null) then
    new.ID = gen_id(GEN_TABCONFIGURACOES_ID,1);
end^

-- //@UNDO
-- SQL to undo the change goes here.


drop trigger TABCONFIGURACOES_BI^