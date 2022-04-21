USE exercicios_propostos_modulo_3;

-- E X E R C I C I O    U M
-- inserindo dados na tabela tipo
INSERT INTO tipo (tipo) VALUES ('Banco de Dados');
INSERT INTO tipo (tipo) VALUES ('Programação');
-- lembrei que o codigo é autoincrement dai testei botando o 1 forçado e depois tirando
-- acontece que como o 1 já existiu todos os outros que vieram depois seguiram a sequencua
-- entao tive que dar update para trocar onde era 2 botar 1 e onde era 3 botar 2 pra seguir
-- os passos do exercicio
UPDATE tipo SET codigo = 1 WHERE codigo = 2;
UPDATE tipo SET codigo = 2 WHERE codigo = 3; 
-- aqui já acertei forçando o 3 já que como ja existia ele seguiria para o 4 se eu deixasse
-- sem inserir por causa do auto increment
INSERT INTO tipo (codigo, tipo) VALUES (3, 'Programação');
-- como eu só copiei esqueci de colocar o nome do curso ai tive que dar um update
-- o update lê "atualize a tabela tipo setando para a coluna tipo o nome modelagem onde o
-- codigo for 3"
UPDATE tipo SET tipo = 'Modelagem de Dados' WHERE codigo = 3;
-- aqui pra enxergar como que ta a tabela

SELECT * FROM tipo;
SELECT * FROM tipo ORDER BY 2; -- ensinado pelo marido só pra mostrar possibilidade de ordem


-- inserindo dados na tabela instrutor
INSERT INTO instrutor (nome_instrutor, telefone, email) VALUES ('Andre Milani', '1111-1111', 'andremilani@sb');
INSERT INTO instrutor (nome_instrutor, telefone, email) VALUES ('Carlos Tosin', '2112-1212', 'carlostosin@sb');

SELECT * FROM instrutor;

-- inserindo dados na tabela curso
INSERT INTO cursos (curso, tipo, instrutor, valor) VALUES ('Java Fundamentos', 2, 2, 270);
INSERT INTO cursos (curso, tipo, instrutor, valor) VALUES ('Java Avançado', 2, 2, 330);
INSERT INTO cursos (curso, tipo, instrutor, valor) VALUES ('SQL Completo', 1, 1, 170);
INSERT INTO cursos (curso, tipo, instrutor, valor) VALUES ('Php Básico', 2, 1, 270);

-- selecione todas as informações das tabelas curso e instrutor onde na tabela curso e na coluna instrutor
-- seja igual a informacao da tabela instrutor na coluna codigo
SELECT * FROM cursos, instrutor WHERE cursos.instrutor = instrutor.codigo;
-- selecione apenas as informações de nome do curso e nome do instrutor e valor do curso das tabelas curso e instrutor 
-- onde na tabela curso e na coluna instrutor
-- seja igual a informacao da tabela instrutor na coluna codigo
-- primeiro vem sempre a tabela seguida da coluna que se quer buscar
SELECT cursos.curso, instrutor.nome_instrutor, cursos.valor FROM cursos, instrutor WHERE cursos.instrutor = instrutor.codigo;

SELECT * FROM cursos;


-- inserindo dados na tabela aluno
INSERT INTO alunos (nome, endereco, email, nascimento) VALUES ('José', 'Rua XV de Novembro 72', 'jose@sb', '1994-10-08');
INSERT INTO alunos (nome, endereco, email, nascimento) VALUES ('Wagner', 'Av. Paulista', 'wagner@sb', '1994-11-08');
INSERT INTO alunos (nome, endereco, email, nascimento) VALUES ('Emílio', 'Rua Lajes 103, Apt 701', 'emilio@sb', '1994-12-08');
INSERT INTO alunos (nome, endereco, email, nascimento) VALUES ('Cris', 'Rua Tauney 22', 'cris@sb', '1995-01-08');
INSERT INTO alunos (nome, endereco, email, nascimento) VALUES ('Regina', 'Rua Salles 305', 'regina@sb', '1995-02-08');
INSERT INTO alunos (nome, endereco, email, nascimento) VALUES ('Fenando', 'Av. Central 30', 'fernando@sb', '1995-03-08');


SELECT * FROM alunos;

-- inserindo dados na tabela pedido
INSERT INTO pedido (aluno, datahora) VALUES (2, '2010-04-15 11:23:32');
INSERT INTO pedido (aluno, datahora) VALUES (2, '2010-04-15 14:36:21');
INSERT INTO pedido (aluno, datahora) VALUES (3, '2010-04-16 11:17:45');
INSERT INTO pedido (aluno, datahora) VALUES (4, '2010-04-17 14:27:22');
INSERT INTO pedido (aluno, datahora) VALUES (5, '2010-04-18 11:18:19');
INSERT INTO pedido (aluno, datahora) VALUES (6, '2010-04-19 13:47:35');
INSERT INTO pedido (aluno, datahora) VALUES (6, '2010-04-20 18:13:44');

SELECT * FROM pedido;

-- inserindo dados na tabela pedido_detalhe
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (1,1,270);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (1,2,330);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (2,1,270);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (2,2,330);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (2,3,170);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (3,4,270);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (4,2,330);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (4,4,270);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (5,3,170);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (6,3,170);
INSERT INTO pedido_detalhes (pedido, curso, valor) VALUES (7,4,270);

SELECT * FROM pedido_detalhes;

-- E X E R C I C I O   D O I S
SELECT cursos.curso FROM cursos; -- exibir somente o titulo de cada curso
-- nao precisa ident a tabela se depois do from vier o nome da tabela, basta colocar as colunas
-- se for tirar info de mais de uma tabela i sim que bota o nome d tabela antes da coluna
SELECT cursos.curso, cursos.valor FROM cursos WHERE cursos.valor > 200; -- exibir somente titulo e R$ curso com curso maior q 200
SELECT cursos.curso, cursos.valor FROM cursos WHERE cursos.valor BETWEEN 200 AND 300; -- exibir nome co cursoi e valor que fique entre 200 e 300;
SELECT * FROM pedido WHERE datahora BETWEEN '2010-04-15' AND '2010-04-18'; -- info da tabela pedido para pedidos entre
SELECT * FROM pedido WHERE DATE(datahora) = '2010-04-15'; -- EXIBIR PEDIDOS SÓ NA DAata

-- E X E R C I C I O   T R E S
-- atualize dos alunos o endereço para avenia brasil 778 de jose
UPDATE alunos SET endereco = 'Avenida Brasil 778' WHERE nome = 'José'; 
UPDATE alunos SET email = 'cristiano@soft' WHERE nome = 'Cris';
SET SQL_SAFE_UPDATES = 0;
UPDATE cursos SET valor = valor * 1.1 WHERE valor < 300; 
UPDATE cursos SET valor = ROUND(valor,2);
-- 270 vai pra 297
-- 170 vai pra 187
UPDATE cursos SET curso = 'Php Fundamentos' WHERE curso = 'Php Básico';
