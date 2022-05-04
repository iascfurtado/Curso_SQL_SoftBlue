USE curso_sql;

CREATE TABLE pedidos 
(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
    valor double not null default '0',
    pago varchar(4) not null default 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD PLAYER', 300);

SELECT * FROM pedidos;

-- de tempos em tempos precisamos eliminar os pedidos que nao foram pagos
-- poderia fazer com delete mas talvez esse delete limpe 4 tabelas ao mesmo tempo
-- e nao e a intencao a intencao e que seja feito somente dos pedidos que nao foram pagos
-- atraves de stored procedures
-- no MYSQL no menu direito busca o nome Stored Procedures e cria por lá já que as SP
-- podem ter comandos que terminam com ponto e virgula e poderia causar confusao com
-- a pagina principal de criação de comandos
-- na SP, para tirar o modo 'safe' ja que essa sp alimina varios lugares, nela mesma coloca-se
-- o comando set safe_update como = 0 ou seja desligado e volta aqui para fazer a call

CALL limpa_pedidos();
-- a partir daqui ja nao se tem mais nenhum registro na tabela



-- Triggers ou Gatilhos

-- exemplo, na existencia de uma tabela estoque, cada vez que se recebe um produto novo
-- deseja-se que neste momento seja feito uma chamada para limpar os pedidos da tabela pedidos

CREATE TABLE estoque 
(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY (id)
);

CREATE TRIGGER gatilho_limpa_pedidos -- cria um gatilho
BEFORE INSERT -- antes de inserir informacoes
ON estoque -- na tabela estoque
FOR EACH ROW -- que para cada linha
CALL limpa_pedidos (); -- quero que ocorra/chame a SP que limpa os pedidos que nao foram pagos

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD PLAYER', 300);
INSERT INTO estoque (descricao, quantidade) VALUES ('Fogao', 5);
INSERT INTO estoque (descricao, quantidade) VALUES ('Forno', 3);
SELECT * FROM estoque;
SELECT * FROM pedidos;

UPDATE pedidos SET pago = 'Sim' WHERE id = 8;