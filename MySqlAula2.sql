CREATE TABLE Pessoa (
    Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(255) NOT NULL,
    GerenteId int NULL,
    FOREIGN KEY (GerenteId)
        REFERENCES Pessoa(Id)
        ON DELETE CASCADE
);

CREATE TABLE Endereco (
    Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Rua varchar(300) NOT NULL,
    Bairro varchar(150) NOT NULL,
    Cidade varchar(150) NOT NULL,
    PessoaId int NOT NULL,
    FOREIGN KEY (PessoaId)
        REFERENCES Pessoa(Id)
        ON DELETE CASCADE,
	INDEX ix_endereco_pessoa_id (PessoaId),
    INDEX ix_endereco_rua (Rua)
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

SELECT * FROM Pessoa;

INSERT INTO Endereco(Rua, Bairro, Cidade, PessoaId)
	VALUES ('Rua A 10', 'Auxiliadora', 'Porto Alegre', 1);
    
SELECT Pessoa.Id, 
	   Nome,
       GerenteId,
       Endereco.Id,
       Endereco.Rua,
       Endereco.Bairro,
       Endereco.Cidade,
       Endereco.PessoaId
	FROM Pessoa
		INNER JOIN Endereco ON Endereco.PessoaId = Pessoa.Id;
        
SELECT Pessoa.Id, 
	   Nome,
       GerenteId,
       Endereco.Id,
       Endereco.Rua,
       Endereco.Bairro,
       Endereco.Cidade,
       Endereco.PessoaId
	FROM Pessoa
		LEFT OUTER JOIN Endereco ON Endereco.PessoaId = Pessoa.Id;

SELECT Pessoa.Id, 
	   Nome,
       GerenteId,
       Endereco.Id,
       Endereco.Rua,
       Endereco.Bairro,
       Endereco.Cidade,
       Endereco.PessoaId
	FROM Pessoa
		RIGHT OUTER JOIN Endereco ON Endereco.PessoaId = Pessoa.Id;

CREATE TABLE Estado (
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Uf varchar(2) NOT NULL
);

ALTER TABLE Endereco
	ADD COLUMN EstadoId int NULL;
	
ALTER TABLE Endereco
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
           
SELECT * FROM Estado;

UPDATE Endereco
	SET EstadoId = 1
	WHERE Id > 0;

ALTER TABLE Endereco
	MODIFY COLUMN EstadoId int NOT NULL;
    
SELECT Pessoa.Id, 
	   Nome,
       GerenteId,
       Endereco.Id,
       Endereco.Rua,
       Endereco.Bairro,
       Endereco.Cidade,
       Endereco.PessoaId,
       Endereco.EstadoId,
       Estado.Uf
	FROM Pessoa
		LEFT OUTER JOIN Endereco ON Endereco.PessoaId = Pessoa.Id
		 LEFT OUTER JOIN Estado ON Estado.Id = Endereco.EstadoId;
	




