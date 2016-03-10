-- // Create Changelog

CREATE TABLE ${changelog} (
ID BIGINT NOT NULL,
APPLIED_AT VARCHAR(25) NOT NULL,
DESCRIPTION VARCHAR(255) NOT NULL
)^

ALTER TABLE ${changelog}
ADD CONSTRAINT PK_${changelog}
PRIMARY KEY (id)^

-- //@UNDO

DROP TABLE ${changelog}^
