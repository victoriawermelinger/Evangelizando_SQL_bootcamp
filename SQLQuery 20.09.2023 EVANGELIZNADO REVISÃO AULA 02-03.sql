-- COMENTARIO EM LINHA 
/* COMENTARIO EM BLOCO */

--CREATE DATABASE ENVAGELIZANDO_SQL
--USE ENVAGELIZANDO_SQL
/*
CREATE TABLE TESTE(
  ID INT PRIMARY KEY
, NOME VARCHAR (50)
, SOBRENOME VARCHAR(50)
, DATA_NASCIMENTO DATE
, SALARIO DECIMAL (10,2)
, ATIVO BIT
, DATA_HORA DATETIME
, DESCRICAO TEXT
)
*/
-- SELECT * FROM TESTE
-- SP_HELP TESTE
------------
--AULA 03
------------
/*
CREATE TABLE tblEMPRESAS(
  EMPRESA_ID INT PRIMARY KEY IDENTITY (1,1) 
, NOME VARCHAR (80) NOT NULL
, NOME_FANTASIA VARCHAR(24) NULL
, ATIVA BIT DEFAULT (1) NOT NULL
)
SELECT * FROM tblEMPRESAS

CREATE TABLE tblCARGOS_COMISSOES(
  CARGOCOMISSOE_ID SMALLINT IDENTITY(1,1) PRIMARY KEY
, DESCRICAO VARCHAR(60) NOT NULL
, PERCcomissao NUMERIC (5,2) NOT NULL DEFAULT (0.2)
)

CREATE TABLE tblVENDEDORES(
  VENDEDOR_ID INT PRIMARY KEY IDENTITY(1,1)
, NOME VARCHAR (80)
, EMPRESA INT REFERENCES tblEMPRESAS(EMPRESA_ID)
, CARGOCOMISSAO_ID SMALLINT REFERENCES tblCARGOS_COMISSOES(CARGOCOMISSOE_ID)
)

CREATE TABLE tblMARCA(
  MARCA_ID INT PRIMARY KEY IDENTITY(1,1)
, DESCRICAO VARCHAR(80)
 )

CREATE TABLE tblPRODUTOS(
  PRODUTO_ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL
, DESCRISAO VARCHAR(80) NOT NULL
, MARCA_ID INT NULL
, CONSTRAINT FK_tblMARCA_MARCA_ID FOREIGN KEY(MARCA_ID)
REFERENCES tblMARCA(MARCA_ID)
)

CREATE TABLE tblvENDAS(
  EMPRESA_ID INT NOT NULL
, VENDA_ID INT NOT NULL
, VENDEDOR_ID INT NULL
, PRODUTO_ID INT NOT NULL
, QUANTIDADE INT NOT NULL
, VALOR_BRUTO MONEY NOT NULL
, DESCONTO MONEY NOT NULL
, VALOR_LIQUIDO AS (VALOR_BRUTO - DESCONTO)
-- CONSTRAINT
, CONSTRAINT FK_tblEMPRESAS_EMPRESA_ID FOREIGN KEY(EMPRESA_ID) 
REFERENCES tblEMPRESAS(EMPRESA_ID)
, CONSTRAINT FK_tblVENDEDORES_VENDEDORID FOREIGN KEY (VENDEDOR_ID) 
REFERENCES tblVENDEDORES(VENDEDOR_ID)
, CONSTRAINT PK_EMPRESAID_VENDAID PRIMARY KEY (EMPRESA_ID,VENDA_ID)
--CONSTRAINT DF_DESCONTO_0 DEFAULT(0) FOR DESCONTO 
)

ALTER TABLE TBLVENDAS ADD DATAHORA DATETIME NOT NULL DEFAULT(GETDATE())

ALTER TABLE tblvendas add constraint fk_tblPRODUTOS_PRODUTOID 
FOREIGN KEY (PRODUTO_ID)
REFERENCES TBLPRODUTOS(PRODUTO_ID)
*/
-------------------------------------------------------
/*
Esses comandos s�o utilizados para controlar transa��es em bancos de dados:
- BEGIN TRANSACTION: Inicia uma transa��o, permitindo que v�rias opera��es sejam agrupadas em uma �nica unidade l�gica.
- ROLLBACK: Desfaz todas as altera��es feitas durante a transa��o, restaurando o estado anterior.
- COMMIT: Confirma todas as altera��es feitas durante a transa��o, tornando-as permanentes no banco de dados.
Esses comandos garantem que as opera��es sejam realizadas com consist�ncia e integridade nos bancos�de�dados.
*/
--------------------------------------------------------
/*
BEGIN TRAN
INSERT INTO tblEMPRESAS( NOME, ATIVA )
VALUES ('EMPRESA.01',0), 
('EMPRESA.02',1),
('EMPRESA.03',0),
('EMPRESA.04',1),
('EMPRESA.05',0),
('EMPRESA.06',1)

rollback
SELECT * FROM tblEMPRESAS

UPDATE TBLEMPRESAS SET NOME='EMPRESA.02' WHERE EMPRESA_ID = 2

DELETE FROM tblEMPRESAS WHERE ATIVA = 1

TRUNCATE TABLE tblEMPRESAS
*/
/*
Esses comandos s�o utilizados para remover dados em bancos de dados:
- DROP: � usado para remover uma tabela, banco de dados completamente.
- DELETE: � usado para remover registros espec�ficos de uma tabela com base em uma condi��o. pode usar filtro. 
- TRUNCATE: � usado para remover todos os registros de uma tabela, mas mant�m a estrutura da tabela intacta.
Esses comandos s�o irrevers�veis e devem ser usados com cuidado, pois podem resultar na perda permanente�de�dados.
*/
/*
Em SQL, "trigger" refere-se a um tipo de objeto que � executado automaticamente em resposta a uma determinada a��o, 
como a inser��o, atualiza��o ou exclus�o de dados em uma tabela. Os triggers s�o usados para impor regras de neg�cio, 
aplicar restri��es ou executar outras opera��es automatizadas no�banco�de�dados.
*/

