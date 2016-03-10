-- // First migration.
-- Migration SQL that makes the change goes here.

alter table tabconfiguracoes add data date^

-- //@UNDO
-- SQL to undo the change goes here.

ALTER TABLE TABCONFIGURACOES DROP DATA^