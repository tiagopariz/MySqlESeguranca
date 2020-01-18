CREATE TABLE Login (
	Id int NOT NULL AUTO_INCREMENT primary key,
    Usuario varchar(200) NOT NULL, 
    Senha varchar(200) NOT NULL
);

INSERT INTO Login (Usuario, Senha)
	VALUES ('tiago', '12345');

select usuario from login where usuario = 'tiago' and senha = '' OR '1' = '1';
    
UPDATE Pessoa
	SET GerenteId = 16
    WHERE Id < 16;
    
SELECT * FROM pessoa
	WHERE GerenteId IS NOT NULL;
    
UPDATE Pessoa
	SET Nome = ''
    WHERE Id =17;
    
SELECT * FROM pessoa
	WHERE Nome IS NULL OR Nome = '';
    
SELECT * FROM pessoa
	WHERE Nome IS NULL OR Nome = '';
    
CREATE TABLE Tipo (
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Descricao varchar(10) NOT NULL
);

INSERT INTO Tipo(Descricao)
	VALUES ('RG'),('CPF'),('CTPS'),('PASSAPORTE'),('CREA');
    
CREATE TABLE Documento (
	Id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Codigo varchar(50) NOT NULL,
    TipoId int NOT NULL,
    PessoaId  int NOT NULL,
    FOREIGN KEY (PessoaId)
		REFERENCES Pessoa(Id)
		ON DELETE RESTRICT,
	FOREIGN KEY (TipoId)
		REFERENCES Tipo(Id)
		ON DELETE RESTRICT,
	INDEX ix_documento_pessoa_id (PessoaId),
    INDEX ix_documento_tipo_id (TipoId),
    INDEX ix_documento_codigo (codigo)
);

SELECT * FROM TIPO;
SELECT * FROM PESSOA;

ALTER TABLE Documento
	ADD COLUMN Emissor varchar(20) NULL;

INSERT INTO Documento (Codigo, TipoId, PessoaId, Emissor)
	VALUES ('6060245411', 1, 10, 'SSP'),
		   ('6060245421', 2, 10, NULL),
           ('60602455441', 3, 11, NULL),
           ('6LKÇK', 2, 13, NULL),
           ('S4234455441', 1, 16, 'SSP'),
           ('S423447897WERW1', 5, 18, NULL);

SELECT * FROM Documento;

SELECT *
	FROM Pessoa
		LEFT OUTER JOIN Documento ON Documento.PessoaId = Pessoa.Id
			LEFT OUTER JOIN Tipo ON Tipo.Id = Documento.TipoId;

SELECT Pessoa.Nome, Documento.Codigo, Documento.Emissor, Tipo.Descricao
	FROM Pessoa
		LEFT OUTER JOIN Documento ON Documento.PessoaId = Pessoa.Id
			LEFT OUTER JOIN Tipo ON Tipo.Id = Documento.TipoId;
