INSERT auto (name) VALUES ('test');

INSERT models (name, auto_id) VALUES ("Focus", 1);

DELETE FROM models WHERE name="Focus";

ALTER TABLE models ADD imgurl VARCHAR(255) NULL;

ALTER TABLE models DROP COLUMN imgurl;