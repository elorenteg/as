DROP TABLE IF EXISTS SeientEnRepresentacio;
DROP TABLE IF EXISTS Entrada;
DROP TABLE IF EXISTS Estrena;
DROP TABLE IF EXISTS Representacio;
DROP TABLE IF EXISTS Seient;
DROP TABLE IF EXISTS Local;
DROP TABLE IF EXISTS Espectacle;
DROP TABLE IF EXISTS Sessio;

CREATE TABLE Sessio
(
  sessio character varying(255) NOT NULL,
  CONSTRAINT sessio_pkey PRIMARY KEY (sessio)
);

CREATE TABLE Espectacle
(
  titol character varying(255) NOT NULL,
  participants integer,
  CONSTRAINT espectacle_pkey PRIMARY KEY (titol),
  CONSTRAINT espectacle_participants_check CHECK (participants > 0)
);

CREATE TABLE Local
(
  nom character varying(255) NOT NULL,
  adreca character varying(255),
  CONSTRAINT local_pkey PRIMARY KEY (nom)
);

CREATE TABLE Seient
(
  columna integer NOT NULL,
  fila integer NOT NULL,
  noml character varying(255) NOT NULL,
  CONSTRAINT seient_pkey PRIMARY KEY (columna, fila, noml),
  CONSTRAINT fk9362c554e94353e FOREIGN KEY (noml)
      REFERENCES local (nom) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT seient_check CHECK (fila >= 0 AND columna >= 0)
);

CREATE TABLE Representacio
(
  noml character varying(255) NOT NULL,
  sessio character varying(255) NOT NULL,
  titole character varying(255) NOT NULL,
  data timestamp without time zone,
  nseientslliures integer,
  preu real,
  CONSTRAINT representacio_pkey PRIMARY KEY (noml, sessio, titole),
  CONSTRAINT fk26128fd04a714c45 FOREIGN KEY (titole)
      REFERENCES espectacle (titol) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk26128fd0931f615d FOREIGN KEY (sessio)
      REFERENCES sessio (sessio) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk26128fd0e94353e FOREIGN KEY (noml)
      REFERENCES local (nom) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT representacio_sessio_noml_key UNIQUE (sessio, noml),
  CONSTRAINT representacio_check CHECK (preu > 0::double precision AND nseientslliures >= 0)
);

CREATE TABLE Estrena
(
  recarrec integer,
  noml character varying(255) NOT NULL,
  sessio character varying(255) NOT NULL,
  titole character varying(255) NOT NULL,
  CONSTRAINT estrena_pkey PRIMARY KEY (noml, sessio, titole),
  CONSTRAINT fkce3498cc6a820c4 FOREIGN KEY (noml, sessio, titole)
      REFERENCES representacio (noml, sessio, titole) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT estrena_recarrec_check CHECK (recarrec > 0)
);

CREATE TABLE Entrada
(
  ident character varying(255) NOT NULL,
  data timestamp without time zone,
  dniclient character varying(255),
  nespectadors integer,
  preu real,
  noml character varying(255),
  sessio character varying(255),
  titole character varying(255),
  CONSTRAINT entrada_pkey PRIMARY KEY (ident),
  CONSTRAINT fk45afe37c6a820c4 FOREIGN KEY (noml, sessio, titole)
      REFERENCES representacio (noml, sessio, titole) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT entrada_check CHECK (preu > 0::double precision AND nespectadors > 0)
);

CREATE TABLE SeientEnRepresentacio
(
  columna integer NOT NULL,
  fila integer NOT NULL,
  noml character varying(255) NOT NULL,
  sessio character varying(255) NOT NULL,
  titole character varying(255) NOT NULL,
  estat character varying(255),
  ident character varying(255),
  CONSTRAINT seientenrepresentacio_pkey PRIMARY KEY (columna, fila, noml, sessio, titole),
  CONSTRAINT fkab7a3dd32174544 FOREIGN KEY (columna, fila, noml)
      REFERENCES seient (columna, fila, noml) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkab7a3dd38b44ce3a FOREIGN KEY (ident)
      REFERENCES entrada (ident) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fkab7a3dd3c6a820c4 FOREIGN KEY (noml, sessio, titole)
      REFERENCES representacio (noml, sessio, titole) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


INSERT INTO Sessio VALUES('MATI');
INSERT INTO Sessio VALUES('TARDA');
INSERT INTO Sessio VALUES('NIT');

INSERT INTO Espectacle VALUES('Cisne negro', 10);
INSERT INTO Espectacle VALUES('Lago de los cisnes', 10);
INSERT INTO Espectacle VALUES('Giselle', 10);
INSERT INTO Espectacle VALUES('Romeo y Julieta', 10);
INSERT INTO Espectacle VALUES('Cascanueces', 10);
INSERT INTO Espectacle VALUES('Cenicienta', 10);
INSERT INTO Espectacle VALUES('Don Quijote', 10);
INSERT INTO Espectacle VALUES('La Bella Durmiente', 10);
INSERT INTO Espectacle VALUES('Sue�o de una noche de verano', 10);
INSERT INTO Espectacle VALUES('La Bailarina del Templo', 10);

INSERT INTO Local VALUES('Gran Teatre del Liceu', 'Les Rambles, 51-59');
INSERT INTO Local VALUES('Teatre Nacional de Catalunya', 'Pla�a de les Arts, 1');
INSERT INTO Local VALUES('Teatro Goya', 'C/ Joaqu�n Costa, 68');
INSERT INTO Local VALUES('Teatre Lliure de Montju�c', 'Pla�a de Margarida Xirgu, 1');
INSERT INTO Local VALUES('Teatre Vict�ria', 'Av. del Paral�lel, 67');
INSERT INTO Local VALUES('Teatre Gaud�', 'C/ Sant Antoni Maria Claret, 120');
INSERT INTO Local VALUES('Teatre Lliure de Gr�cia', 'C/ del Monseny, 47');
INSERT INTO Local VALUES('Almeria Teatre', 'C/ Sant Llu�s, 64');
INSERT INTO Local VALUES('Teatre Club Capitol', 'Les Rambles, 138');

INSERT INTO Representacio VALUES('Gran Teatre del Liceu', 'MATI', 'Cenicienta', '26/01/2016', 100, 50);
INSERT INTO Representacio VALUES('Gran Teatre del Liceu', 'TARDA', 'Cisne negro', '26/01/2016', 100, 50);
INSERT INTO Representacio VALUES('Gran Teatre del Liceu', 'NIT', 'Cisne negro', '26/01/2016', 100, 50);
INSERT INTO Representacio VALUES('Teatre Nacional de Catalunya', 'MATI', 'Cisne negro', '26/01/2016', 100, 50);
INSERT INTO Representacio VALUES('Teatre Nacional de Catalunya', 'TARDA', 'Cenicienta', '26/01/2016', 100, 50);
INSERT INTO Estrena VALUES(10, 'Gran Teatre del Liceu', 'NIT', 'Cisne negro');
INSERT INTO Estrena VALUES(10, 'Gran Teatre del Liceu', 'TARDA', 'Cisne negro');