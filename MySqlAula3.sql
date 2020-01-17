CREATE TABLE Pessoa (
    Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(255) NOT NULL,
    GerenteId int NULL,
    FOREIGN KEY (GerenteId)
        REFERENCES Pessoa(Id)
        ON DELETE RESTRICT
);

INSERT INTO Pessoa(Nome)
	VALUES ('André'), 
		   ('Manoel'),
           ('Ariel'),
           ('Letícia'),
           ('Luis'),
           ('Jair'),
           ('Diego'),
           ('Michele'),
           ('Antonio');
           
UPDATE Pessoa
	SET GerenteId = 5
    WHERE Id <> 5; 

SELECT Pessoa.Id,
	   Pessoa.Nome,
       Pessoa.GerenteId,
       Gerente.Nome AS NomeGerente
	FROM Pessoa
    LEFT OUTER JOIN Pessoa AS Gerente 
		ON Gerente.Id = Pessoa.GerenteId
	LIMIT 2,5;

SELECT Id, Nome
	FROM Pessoa
    WHERE Nome = 'Diego'
    ORDER BY Nome;
    
SELECT Id, Nome
	FROM Pessoa
    WHERE Nome <> 'Diego'
    ORDER BY Nome;
    
SELECT Id, Nome
	FROM Pessoa
    WHERE Nome LIKE '%i%' OR Nome LIKE '%a%'
    ORDER BY Nome;
    
SELECT Id, Nome
	FROM Pessoa
    WHERE Nome LIKE '%i%' AND 
		  (Nome LIKE '%a%' OR Nome LIKE '%o%')
    ORDER BY Nome;
    
SELECT Id, Nome
	FROM Pessoa
    WHERE Id > 3 AND Id < 6;
    
SELECT Id, Nome
	FROM Pessoa
    WHERE Id >= 3 AND Id <= 6;

SELECT Id, Nome
	FROM Pessoa
    WHERE Id IN (2, 5, 8);
    
CREATE TABLE Estado (
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Uf varchar(2) NOT NULL
);

ALTER TABLE Pessoa
	ADD COLUMN EstadoId int NULL;
	
ALTER TABLE Pessoa
    ADD FOREIGN KEY (EstadoId)
		REFERENCES Estado(Id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE;

INSERT INTO Estado(Uf)
	VALUES ('RS'),
		   ('SC'),
		   ('RJ'),
		   ('SP'),
		   ('ES');
           
SELECT * FROM Pessoa;

UPDATE Pessoa
	SET EstadoId = 2
    WHERE Id >= 5;
    
UPDATE Pessoa
	SET EstadoId = 3
    WHERE Id < 5;
    
SELECT Id, Nome, EstadoId
	FROM Pessoa
    WHERE EstadoId 
		= (SELECT Id FROM Estado WHERE Uf LIKE '%S%' LIMIT 1);
        
CREATE TABLE Municipio (
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(100) NOT NULL,
	Uf varchar(2) NOT NULL
);

INSERT INTO Municipio(Nome, Uf)
	VALUES ('Porto Alegre', 'RS'),
		   ('Teresina', 'PI'),
           ('Manaus', 'AM');
           
SELECT * FROM Municipio;

SELECT * FROM Estado;

INSERT INTO Estado(Uf)
	SELECT Uf FROM Municipio
	 WHERE Uf NOT IN (SELECT Uf FROM Estado);
     
DELETE FROM Pessoa
	WHERE Id = 15;
    
SELECT * FROM Pessoa;
SELECT * FROM Endereco;
SELECT * FROM Estado;