USE music;

CREATE TABLE hasla
(
	id INT NOT NULL,
	haslo VARCHAR(70) NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE hasla ADD CONSTRAINT FK_MuzycyHaslo FOREIGN KEY (id) REFERENCES muzycy(id);