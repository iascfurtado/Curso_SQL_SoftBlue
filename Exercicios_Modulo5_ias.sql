USE exercicios_propostos_modulo_3;

-- EXERCICIOS PROPOSTOS MODULO 5 RELACIONAMENTOS E VISOES
-- 1) Exibir lista com Titulos dos Cursos e Tipo de Curso ao lado
SELECT cursos.curso, tipo.tipo FROM cursos INNER JOIN tipo ON tipo.codigo = cursos.codigo;
-- selecione da tabela cursos a coluna curso, da tabela tipo a coluna tipo da coluna cursos
-- juntando com a tabela tipo onde a coluna codigo da tapela tipo seja igual a coluna codigo
-- da tabela cursos
SELECT * FROM cursos;
SELECT * FROM tipo;


-- 2) Exibir lista com titulos dos cursos, tipo de curso, nome instrutor e telefone instrutor
SELECT cursos.curso, tipo.tipo, instrutor.nome_instrutor, instrutor.telefone
FROM cursos 
INNER JOIN tipo 
ON tipo.codigo = cursos.codigo
INNER JOIN instrutor
ON instrutor.codigo = cursos.instrutor;
-- selecione da tabela curso a coluna curso, da tabela tipo a coluna tipo e da tabela instrutor
-- a coluna do nome do instrutor e a coluna de seu telefone, considerando a tabela cursos, 
-- juntando ela com a tabela tipo onde o codigo da tabela tipo é igual ao codigo da tabela 
-- cursos juntando elas duas com a tabela instrutor onde a coluna codigo na tabela instrutor 
-- seja igual a coluna instrutor da tabela cursos
SELECT * FROM instrutor;


-- 3) Exibir lista com codigo e data e hora dos pedidos e codigos dos cursos de cada pedido
SELECT pedido.codigo, pedido.datahora, cursos.codigo FROM pedido
INNER JOIN cursos
ON cursos.codigo = pedido.codigo;


-- 4) Exibir lista com codigo, data e hora pedidos e titulos dos cursos de cada pedido
SELECT pedido.codigo, pedido.datahora, cursos.curso FROM pedido
INNER JOIN cursos
ON cursos.codigo = pedido.codigo ORDER BY pedido.codigo ASC;
-- parte final para ordenar o resultado pela tabela do docigo do pedido


-- 5) Exibir lista com codigo e dta e hora dos pedidos, nome aluno e titulo do curso
SELECT pedido.codigo, pedido.datahora, alunos.nome FROM pedido
INNER JOIN alunos
ON alunos.codigo = pedido.codigo ORDER BY pedido.codigo ASC;
SELECT * FROM pedido;


-- EXERCICIOS PROPOSTOS MODULO 5 RELACIONAMENTOS E VISOES
-- 1) Crie uma visao que traga o titulo e preço só dos cursos de programcao
CREATE VIEW cursos_programacao AS
SELECT cursos.curso, cursos.valor, tipo.tipo FROM cursos 
INNER JOIN tipo
ON tipo.tipo = 'Programação';
SELECT * FROM cursos_programacao;


-- 2) Crie uma visao que traga o titulo dos curso, tipo do curso e nome instrutor
CREATE VIEW cursos_tipo_nome_instrutor AS
SELECT cursos.curso, tipo.tipo, instrutor.nome_instrutor FROM cursos
INNER JOIN tipo
ON tipo.codigo = cursos.codigo
INNER JOIN instrutor
ON cursos.instrutor = instrutor.codigo;
-- selecione as colunas de nome, tipo e nome instrutor, das tabelas cursos, tipo e instrutor
-- considerando a tabela cursos, juntando ela com a tabela tipo onde
-- o codigo do tipo de curso seja igual ao codigo do curso e juntando ainda com
-- a tabela instrutor onde o nome do instrutor na tabela cursos seja igual ao codigo
-- do instrutor na tabela instrutor
SELECT * FROM cursos_tipo_nome_instrutor;


-- 3) Crie uma visao que exiba os pedidos realizados, com nome aluno data e codigo pedido
CREATE VIEW pedido_aluno_data AS
SELECT pedido.codigo, pedido.datahora, alunos.nome FROM pedido
INNER JOIN alunos
ON alunos.codigo = pedido.codigo
ORDER BY pedido.codigo ASC;
SELECT * FROM pedido_aluno_data;

