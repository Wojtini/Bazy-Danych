DROP INDEX pom_index ON album;
CREATE INDEX pom_index ON album (gatunek) USING BTREE;