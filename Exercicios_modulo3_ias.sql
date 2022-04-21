CREATE DATABASE exercicios_propostos_modulo_3;
USE exercicios_propostos_modulo_3;
CREATE TABLE tipo 
(
	codigo int unsigned not null auto_increment,
    tipo varchar(32) not null,
    PRIMARY KEY (codigo)
);
CREATE TABLE instrutor 
(
	codigo int unsigned not null auto_increment,
    instrutor varchar(64) not null,
    telefone varchar(64) not null,
    PRIMARY KEY (codigo)
);
ALTER TABLE instrutor ADD COLUMN email varchar (100) not null;

CREATE TABLE cursos 
(
	codigo int unsigned not null auto_increment,
    curso varchar(64) not null,
    tipo int unsigned not null,
    instrutor int unsigned not null,
    valor double not null,
    PRIMARY KEY (codigo),
    INDEX fk_tipo (tipo),
    INDEX fk_instrutor (instrutor),
    CONSTRAINT fk_tipo FOREIGN KEY (tipo) REFERENCES tipo (codigo),
    CONSTRAINT fk_instrutor FOREIGN KEY (instrutor) REFERENCES instrutor (codigo)
);
ALTER TABLE cursos ADD INDEX cursos_valor (valor);
ALTER TABLE cursos ADD INDEX fk_cursos (curso);
ALTER TABLE cursos ADD INDEX fk_instrutor_ix (instrutor);
ALTER TABLE cursos DROP INDEX fk_instrutor;

CREATE TABLE alunos 
(
	codigo int unsigned not null auto_increment,
    nome varchar(45) not null,
    endereco varchar(128) not null,
    email varchar(128) not null,
    PRIMARY KEY (codigo),
    INDEX fk_nome (nome)
);
ALTER TABLE alunos ADD COLUMN data_hora timestamp not null;
ALTER TABLE alunos ADD INDEX fk_data_hora (data_hora);
ALTER TABLE alunos DROP COLUMN data_hora;
ALTER TABLE alunos ADD COLUMN nascimento date;

CREATE TABLE pedido 
(
	codigo int unsigned not null auto_increment,
    tipo int unsigned not null, -- troquei o nome de tipo para aluno
    -- curso int unsigned not null eu comentei depois que dropei
    -- valor double not null comentei depois que dropei
    PRIMARY KEY (codigo),
-- 	INDEX fk_codigo (codigo),
    INDEX fk_tipo (tipo) -- alterar nome do index para aluno
 --   CONSTRAINT fk_tipoo FOREIGN KEY (tipo) REFERENCES tipo (codigo), -- dropada e criada nome aluno
 --   CONSTRAINT fk_curso FOREIGN KEY (curso) REFERENCES cursos (codigo) -- dropada
);
ALTER TABLE pedido ADD COLUMN datahora datetime not null;
ALTER TABLE pedido DROP CONSTRAINT fk_curso;
ALTER TABLE pedido DROP COLUMN curso;
ALTER TABLE pedido DROP INDEX fk_codigo;
ALTER TABLE pedido DROP COLUMN valor;
ALTER TABLE pedido RENAME COLUMN tipo TO aluno;
ALTER TABLE pedido RENAME INDEX fk_tipo TO fk_aluno;
ALTER TABLE pedido RENAME INDEX fk_aluno TO fk_aluno_ix;
ALTER TABLE pedido DROP CONSTRAINT fk_tipoo;
ALTER TABLE pedido ADD CONSTRAINT fk_aluno FOREIGN KEY (aluno) REFERENCES alunos (codigo);

CREATE TABLE pedido_detalhes 
(
	pedido int unsigned not null auto_increment,
    curso int unsigned not null,
    valor double not null,
    PRIMARY KEY (pedido, curso),
    INDEX fk_pedido (pedido),
    INDEX fk_curso (curso),
    CONSTRAINT fk_pedido FOREIGN KEY (curso) REFERENCES pedido (codigo),
    CONSTRAINT fk_valor FOREIGN KEY (valor) REFERENCES cursos (valor)
);
ALTER TABLE pedido_detalhes DROP CONSTRAINT fk_valor;

