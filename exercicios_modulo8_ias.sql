USE exercicios_propostos_modulo_3;

-- Construir uma transacao que atualiza valor aplicado em cada conta bancaria
-- em 3% em cima do valor especificado, garantindo que o UPDATE seja realizado
-- dentro dos parametros ACID

CREATE TABLE tb_conta_bancaria
(
	codigo_conta int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY (codigo_conta)
) ENGINE = InnoDB;

SELECT * FROM tb_conta_bancaria;

INSERT INTO tb_conta_bancaria (titular, saldo) VALUES ('André', 213);
INSERT INTO tb_conta_bancaria (titular, saldo) VALUES ('Diogo', 489);
INSERT INTO tb_conta_bancaria (titular, saldo) VALUES ('Rafael', 568);
INSERT INTO tb_conta_bancaria (titular, saldo) VALUES ('Carlos', 712);
INSERT INTO tb_conta_bancaria (titular, saldo) VALUES ('Peter', -38);


START TRANSACTION;
UPDATE tb_conta_bancaria SET saldo = ROUND (saldo * 1.03, 2) WHERE codigo_conta IN (1,2,3,4,5) 
AND saldo > 0;
ROLLBACK;
COMMIT;
