-- Inserir dados

INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('Victor', 'Rua 01', 'SJM','RJ' ,'21994921277', 'victor@estacio.com');
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('Yumi', 'Rua 12', 'Caragua','SP' ,'1111-1111', 'yumi@gmail.com');
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('Marise', 'Rua 14', 'Riacho do Sul','PA' ,'1112-1111', 'marise@gmail.com');
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('Joao', 'Rua 13', 'RJ','PA' ,'1123-1111', 'JOAOaaa@gmail.com');
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('JJC', 'Rua 12', 'RJ','PA' ,'1233-1111', 'JJC@gmail.com');
INSERT INTO Pessoa (nome, logradouro, cidade, estado, telefone, email) VALUES ('Enterprise', 'logradouro', 'RJ','PA' ,'1523-1111', '1234566@gmail.com');

INSERT INTO Produto (nome, quantidade, precoVenda) VALUES ('Caneca Createe', 50, 5000);
INSERT INTO Produto (nome, quantidade, precoVenda) VALUES ('Camiseta Createe', 564, 7000);
INSERT INTO Produto (nome, quantidade, precoVenda) VALUES ('Pôster Createe', 15, 400);
INSERT INTO Produto (nome, quantidade, precoVenda) VALUES ('Placa Createe', 55, 4000);

INSERT INTO Usuario (login, senha) VALUES ('loja', 'loja');
INSERT INTO Usuario (login, senha) VALUES ('op1', 'op1');
INSERT INTO Usuario (login, senha) VALUES ('op2', 'op2');
INSERT INTO Usuario (login, senha) VALUES ('op3', 'op3');

INSERT INTO Pessoa_Fisica (cpf, idPessoa) VALUES ('45451556', 1);
INSERT INTO Pessoa_Fisica (cpf, idPessoa) VALUES ('11111111111', 2);
INSERT INTO Pessoa_Fisica (cpf, idPessoa) VALUES ('11111111112', 3);
INSERT INTO Pessoa_Fisica (cpf, idPessoa) VALUES ('11111111113', 4);
INSERT INTO Pessoa_Fisica (cpf, idPessoa) VALUES ('11111111453', 5);

INSERT INTO Pessoa_Juridica (cnpj, idPessoa) VALUES ('454162533456', 1);
INSERT INTO Pessoa_Juridica (cnpj, idPessoa) VALUES ('22222222222222', 5);
INSERT INTO Pessoa_Juridica (cnpj, idPessoa) VALUES ('33333333333333', 6);

INSERT INTO Mover(idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (1, 1, 1, 2, 'E', 5000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 2, 1, 'E', 1000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 2, 1, 'E', 1000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 2, 1, 'S', 1000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 2, 1, 'S', 1000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 2, 1, 'S', 1000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (3, 3, 2, 1, 'E', 10000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (3, 3, 3, 10, 'E', 50000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (3, 3, 4, 10, 'E', 40000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 3, 2, 'S', 4000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 3, 2, 'S', 4000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (2, 2, 4, 2, 'S', 4000);
INSERT INTO Mover (idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario) VALUES (3, 3, 4, 2, 'S', 4000);


SELECT * FROM Pessoa_Fisica pf
JOIN Pessoa p ON pf.idPessoa = p.idPessoa;



SELECT * FROM Pessoa_Juridica pj
JOIN Pessoa p ON pj.idPessoa = p.idPessoa;



SELECT m.idMovimento, p.nome AS Produto, u.login AS Fornecedor, m.quantidade, m.valorUnitario, (m.quantidade * m.valorUnitario) AS ValorTotal
FROM Mover m
JOIN Produto p ON m.idProduto = p.idProduto
JOIN Usuario u ON m.idUsuario = u.idUsuario
WHERE m.tipo = 'E';



SELECT m.idMovimento, p.nome AS Produto, c.nome AS Comprador, m.quantidade, m.valorUnitario, (m.quantidade * m.valorUnitario) AS ValorTotal
FROM Mover m
JOIN Produto p ON m.idProduto = p.idProduto
JOIN Pessoa c ON m.idPessoa = c.idPessoa
WHERE m.tipo = 'S';



SELECT p.nome AS Produto, SUM((m.quantidade * m.valorUnitario)) AS ValorTotalEntrada
FROM Mover m
JOIN Produto p ON m.idProduto = p.idProduto
WHERE m.tipo = 'E'
GROUP BY p.nome;



SELECT p.nome AS Produto, SUM((m.quantidade * m.valorUnitario)) AS ValorTotalSaida
FROM Mover m
JOIN Produto p ON m.idProduto = p.idProduto
WHERE m.tipo = 'S'
GROUP BY p.nome;



SELECT u.login
FROM Usuario u
LEFT JOIN Mover m ON u.idUsuario = m.idUsuario AND m.tipo = 'E'
WHERE m.idMovimento IS NULL;



SELECT u.login, SUM((m.quantidade * m.valorUnitario)) AS ValorTotalEntrada
FROM Mover m
JOIN Usuario u ON m.idUsuario = u.idUsuario
WHERE m.tipo = 'E'
GROUP BY u.login;


SELECT u.login, SUM((m.quantidade * m.valorUnitario)) AS ValorTotalSaida
FROM Mover m
JOIN Usuario u ON m.idUsuario = u.idUsuario
WHERE m.tipo = 'S'
GROUP BY u.login;



SELECT p.nome AS Produto, AVG(m.quantidade * p.precoVenda) AS MediaPonderada
FROM Mover m
JOIN Produto p ON m.idProduto = p.idProduto
WHERE m.tipo = 'S'
GROUP BY p.nome;

