CREATE TABLE ESTADO(
estado VARCHAR(25),
uf VARCHAR(2),
PRIMARY KEY (estado));


CREATE TABLE CADASTRO_CLIENTE (
nome VARCHAR(25),
sobrenome VARCHAR(25),
cpf INTEGER(11) NOT NULL,
numero_telefone INTEGER,
cnpj INTEGER NOT NULL UNIQUE,
email VARCHAR(50),
cidade VARCHAR(50),
uf VARCHAR(2),
rua VARCHAR(50),
nro_casa INTEGER,
usuario VARCHAR(25) NOT NULL UNIQUE,
senha VARCHAR(50) NOT NULL,
PRIMARY KEY (cpf),
FOREIGN KEY (uf) REFERENCES ESTADO(estado));

CREATE TABLE AREA_LOGIN(
usuario VARCHAR(25) NOT NULL,
senha VARCHAR(50) NOT NULL,
FOREIGN KEY(usuario) REFERENCES CADATRO_CLIENTE(usuario),
FOREIGN KEY(senha) REFERENCES CADATRO_CLIENTE(senha));

CREATE TABLE PRODUTO_PREMIUN(
nome VARCHAR(50),
id_p_p INTEGER(5) NOT NULL,
PRIMARY KEY(id_p_p));

CREATE TABLE PRODUTO(
nome VARCHAR(50),
id_produto INTEGER(5) NOT NULL,
PRIMARY KEY(id_produto));

CREATE TABLE CATALOGO(
descricao_pro VARCHAR(150),
id_p_p INTEGER(5) NOT NULL,
id_produto INTEGER(5) NOT NULL,
PRIMARY KEY(descricao_pro),
FOREIGN KEY (id_p_p) REFERENCES PRODUTO_PREMIUN(id_p_p),
FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto));

CREATE TABLE PEDIDO(
usuario VARCHAR(50),
id_produto INTEGER(5) NOT NULL,
id_pedido INTEGER(5) NOT NULL,
id_p_p INTEGER(5) NOT NULL,
nome VARCHAR(50),
PRIMARY KEY(usuario, id_produto),
FOREIGN KEY (usuario) REFERENCES CADASTRO_CLIENTE(usuario),
FOREIGN KEY(id_produto) REFERENCES PRODUTO(id_produto),
FOREIGN KEY(id_p_p) REFERENCES PRODUTO_PREMIUN(id_p_p));

CREATE TABLE FUNCIONARIO(
cidade VARCHAR(50),
id_fun INTEGER(7),
nome_fun VARCHAR(50),
PRIMARY KEY (id_fun));

CREATE TABLE LOCAL_MAIS_PROXIMO(
cidade VARCHAR(50),
uf VARCHAR(2),
usuario VARCHAR(50),
id_fun INTEGER(7),
PRIMARY KEY (cidade, estado),
FOREIGN KEY (uf) REFERENCES ESTADO(estado),
FOREIGN KEY (usuario) REFERENCES CADASTRO_CLIENTE(usuario),
FOREIGN KEY (id_fun) REFERENCES FUNCIONARIO(id_fun));

CREATE TABLE CEDE_LOJA(
cidade VARCHAR(50),
uf VARCHAR(2),
PRIMARY KEY(cidade,estado),
FOREIGN KEY(uf) REFERENCES ESTADO(estado));

CREATE TABLE MONTAGEM(
nome_fun VARCHAR(50),
id_fun INTEGER(7)NOT NULL,
id_pedido INTEGER(5)NOT NULL,
PRIMARY KEY(id_fun, id_pedido),
FOREIGN KEY(id_fun) REFERENCES FUNCIONARIO(id_fun),
FOREIGN KEY(id_pedido) REFERENCES PEDIDO(id_pedido));

CREATE TABLE TRANSPORTADORA(
nome_trans VARCHAR(50),
id_trans INTEGER(10),
id_pedido INTEGER(5),
usuario VARCHAR(50),
PRIMARY KEY (id_trans),
FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
FOREIGN KEY (usuario) REFERENCES CADASTRO_CLIENTE(usuario));