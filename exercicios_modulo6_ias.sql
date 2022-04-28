USE exercicios_propostos_modulo_3;

SELECT * FROM alunos;
SELECT * FROM pedido;
SELECT * FROM pedido_detalhes ORDER BY pedido;
SELECT * FROM cursos;
SELECT DISTINCT tipo FROM tipo;

-- EXERCICIO 1
-- selecione nomes alunos já fizeram matricula, sem repeticao
SELECT DISTINCT (alunos.nome) FROM alunos;

-- selecione o nome aluno mais antigo
SELECT alunos.nome FROM alunos 
INNER JOIN pedido
ON pedido.aluno = alunos.codigo ORDER BY pedido.aluno LIMIT 1;

-- selecione o nome do aluno mais recente
SELECT alunos.nome FROM alunos 
INNER JOIN pedido
ON pedido.aluno = alunos.codigo ORDER BY pedido.aluno DESC LIMIT 1;

-- selecione o terceiro aluno mais antigo
SELECT alunos.nome FROM alunos 
INNER JOIN pedido
ON pedido.aluno = alunos.codigo ORDER BY pedido.aluno LIMIT 2,1;

-- qtd de cursos ja vendido
SELECT COUNT(*) AS 'Quantidade de Cursos Vendidos' FROM pedido;

-- valor arrecadado cursos vendidos
SELECT SUM(pedido_detalhes.valor) AS 'valor arrec' FROM pedido_detalhes;

-- valor medio do curso 2
SELECT ROUND(AVG(valor),2) AS 'valor medio' FROM pedido_detalhes WHERE pedido = 2;

-- valor do curso mais caro
SELECT cursos.valor, cursos.curso FROM cursos ORDER BY valor DESC LIMIT 1;

-- valor do curso mais barato
SELECT cursos.valor, cursos.curso FROM cursos ORDER BY valor ASC LIMIT 1;

-- valor total de CADA pedido
SELECT pedido, SUM(valor) FROM pedido_detalhes GROUP BY pedido;

-- nome dos intrutores e quantos cursos cada um tem
SELECT nome_instrutor, COUNT(curso) AS 'qtd cursos' FROM instrutor 
INNER JOIN cursos ON cursos.instrutor = instrutor.codigo GROUP BY nome_instrutor;

-- exibir numero do pedido, nome aluno e valor para todos os pedidos cujo total maior
-- que 500
SELECT pedido.codigo AS 'numero do pedido', alunos.nome AS 'nome do aluno', SUM(pedido_detalhes.valor) AS 'valor pedido' 
FROM pedido
INNER JOIN alunos
ON pedido.codigo = alunos.codigo
INNER JOIN pedido_detalhes
ON pedido.codigo = pedido_detalhes.pedido GROUP BY alunos.nome 
HAVING SUM(pedido_detalhes.valor) > 500 ORDER BY pedido.codigo;

-- numero pedido, nome aluno, qntos cursos comprou se comprou 2 ou +
SELECT pedido_detalhes.pedido AS 'numero do pedido', 
alunos.nome AS 'nome do aluno', 
COUNT(*) AS 'qtd cursos' 
FROM pedido_detalhes
INNER JOIN alunos
ON pedido_detalhes.pedido = alunos.codigo
GROUP BY pedido_detalhes.pedido 
HAVING COUNT(*) > 1 ORDER BY alunos.nome;
SELECT * FROM pedido_detalhes ORDER BY pedido;
SELECT * FROM pedido;

-- nome e endereço dos alunos que morem em avenidas
SELECT alunos.nome, alunos.endereco FROM alunos WHERE alunos.endereco LIKE 'av%';
SELECT * FROM alunos;

-- exiba os cursos de java
SELECT cursos.curso FROM cursos WHERE cursos.curso LIKE 'java%';
SELECT * FROM cursos;


-- EXERCICIOS 2
-- usando subquery, exibir lista nomes cursos informando para cada curso
-- menor valor de venda
SELECT curso, (SELECT MIN(valor) 
FROM pedido_detalhes WHERE cursos.codigo = pedido_detalhes.curso)
AS menor_valor FROM cursos;


-- usando subquery e parametro IN, exibir nome cursos cujo tipo seja programacao
SELECT cursos.curso FROM cursos WHERE tipo IN 
(SELECT tipo.codigo FROM tipo WHERE tipo.tipo LIKE 'Progr%');
SELECT * FROM tipo;

-- usando subquery e parametro EXISTS, exibir nome cursos cujo tipo seja programacao
SELECT cursos.curso FROM cursos WHERE EXISTS 
(SELECT tipo.codigo FROM tipo WHERE tipo.codigo = cursos.tipo 
AND tipo.tipo = 'Programação');
SELECT * FROM cursos;

-- exiba lista nomes instrutores + acumulado das vendas de seus cursos
SELECT instrutor.nome_instrutor, 
(SELECT SUM(pedido_detalhes.valor) FROM pedido_detalhes
INNER JOIN cursos
ON pedido_detalhes.curso = cursos.codigo
WHERE cursos.instrutor = instrutor.codigo)  AS acumulado_de_vendas FROM instrutor;
SELECT * FROM cursos;

-- criar visao que exiba nomes dos alunos e qnto ja comprou em cursos
CREATE VIEW compras_por_alunos AS
 SELECT alunos.nome, SUM(pedido_detalhes.valor) FROM alunos
INNER JOIN pedido_detalhes
ON alunos.codigo = pedido_detalhes.pedido
GROUP BY alunos.nome ORDER BY SUM(pedido_detalhes.valor);
SELECT * FROM compras_por_alunos;