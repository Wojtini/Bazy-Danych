USE music;

CREATE TABLE muzycy
(
	id INT NOT NULL AUTO_INCREMENT,
	imie VARCHAR(70) NOT NULL,
	nazwisko VARCHAR(90) DEFAULT NULL,
	zespol INT DEFAULT NULL,
	gaza INT CHECK (gaza >= 0),
	PRIMARY KEY (id)
);

ALTER TABLE muzycy ADD CONSTRAINT FK_ZespolMuzycy FOREIGN KEY (zespol) REFERENCES zespol(id);