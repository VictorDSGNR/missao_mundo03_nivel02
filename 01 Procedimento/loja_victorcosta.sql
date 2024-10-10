CREATE TABLE Pessoa (
    idPessoa INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(255),
    logradouro NVARCHAR(255),
    cidade NVARCHAR(255),
    estado CHAR(2),
    telefone NVARCHAR(255),
    email NVARCHAR(255)
);

INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('Victor', 'Av. N. S. das Graças', 'SJM','RJ' ,'21994921277', 'victorcosta@estacio.com');

SELECT * FROM Pessoa;

CREATE TABLE Produto (
    idProduto INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(255),
    quantidade INT,
    precoVenda NUMERIC
);

INSERT INTO Produto (nome, quantidade, precoVenda) VALUES ('Camiseta CREATEE', 50, 5000);

SELECT * FROM Produto;

CREATE TABLE Usuario (
    idUsuario INT IDENTITY(1,1) PRIMARY KEY,
    login NVARCHAR(255),
    senha NVARCHAR(255)
);

INSERT INTO Usuario (login, senha) VALUES ('loja', 'loja');

SELECT * FROM Usuario;

CREATE TABLE Pessoa_Fisica (
    cpf NVARCHAR(11) PRIMARY KEY,
    idPessoa INT FOREIGN KEY REFERENCES Pessoa(idPessoa)
);

CREATE TABLE Pessoa_Juridica (
    cnpj NVARCHAR(14) PRIMARY KEY,
    idPessoa INT FOREIGN KEY REFERENCES Pessoa(idPessoa)
);

INSERT INTO Pessoa_Fisica (cpf, idPessoa) VALUES ('454516456', 1);

SELECT * FROM Pessoa_Fisica;

INSERT INTO Pessoa_Juridica (cnpj, idPessoa) VALUES ('454516213456', 1);

SELECT * FROM Pessoa_Juridica;

CREATE TABLE Mover (
    idMovimento INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT FOREIGN KEY REFERENCES Usuario(idUsuario),
    idPessoa INT FOREIGN KEY REFERENCES Pessoa(idPessoa),
    idProduto INT FOREIGN KEY REFERENCES Produto(idProduto),
    quantidade INT,
    tipo CHAR(1),
    valorUnitario FLOAT
);

INSERT INTO MoverMover(idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (1, 1, 1, 2, 'E', 5000);

SELECT * FROM Mover;