
DELETE FROM Representacio;
DELETE FROM Sessio;
DELETE FROM Espectacle;
DELETE FROM Local;

INSERT INTO Sessio VALUES('mati');
INSERT INTO Sessio VALUES('tarda');
INSERT INTO Sessio VALUES('nit');

INSERT INTO Espectacle VALUES('Lago de los cisnes', 10);
INSERT INTO Espectacle VALUES('Giselle', 10);
INSERT INTO Espectacle VALUES('Romeo y Julieta', 10);
INSERT INTO Espectacle VALUES('Cascanueces', 10);
INSERT INTO Espectacle VALUES('Cisne negro', 10);
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

INSERT INTO Representacio VALUES('Gran Teatre del Liceu', 'nit', '26/01/2012', 100, 50, 'Cisne negro', 'Gran Teatre del Liceu', 'nit');
INSERT INTO Representacio VALUES('Gran Teatre del Liceu', 'mati', '26/01/2012', 100, 50, 'Cenicienta', 'Gran Teatre del Liceu', 'nit');