USE music;

CREATE TABLE zespol
(
	id INT NOT NULL AUTO_INCREMENT,
	nazwa VARCHAR(180) NOT NULL,
	liczbaAlbumow INT DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE utwor
(
	id INT NOT NULL AUTO_INCREMENT,
	tytul VARCHAR(180) NOT NULL,
	czas int,
	album VARCHAR(180) NOT NULL,
	zespol INT NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE album
(
	tytul VARCHAR(180) NOT NULL,
	gatunek VARCHAR(180),
	zespol INT NOT NULL,
	PRIMARY KEY (tytul,zespol)
);
#FK
ALTER TABLE utwor ADD CONSTRAINT FK_UtworZespol FOREIGN KEY (zespol) REFERENCES zespol(id);
ALTER TABLE utwor ADD CONSTRAINT FK_UtworAlbum FOREIGN KEY (album) REFERENCES album(tytul);