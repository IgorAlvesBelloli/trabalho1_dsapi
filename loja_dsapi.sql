CREATE DATABASE loja_dsapi;
USE loja_dsapi;
/*DROP DATABASE loja_dsapi;*/


/*DROP TABLE cidades*/
/*select*from cidades;*/
CREATE TABLE cidades(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL
);
INSERT INTO cidades VALUES(default,"POA");
INSERT INTO cidades VALUES(default,"Canoas");
INSERT INTO cidades VALUES(default,"Capão da Canoa");
INSERT INTO cidades VALUES(default,"Viamão");
INSERT INTO cidades VALUES(default,"Gramado");
INSERT INTO cidades VALUES(default,"Canela");

/*DROP TABLE clientes*/
/*select*from clientes;*/
CREATE TABLE clientes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
altura DOUBLE,
nascimento DATE,
cidade_id INT NOT NULL,
FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);
INSERT INTO clientes values(default,"João", "1.83", "1995-05-23",1);
INSERT INTO clientes values(default,"Maria", "1.65", "1998-12-15",6);
INSERT INTO clientes values(default,"Luiz", "1.75", "1989-11-04",3);
INSERT INTO clientes values(default,"Ana", "1.62", "2000-09-21",5);
INSERT INTO clientes values(default,"Jorge", "1.67", "1990-06-28",2);
INSERT INTO clientes values(default,"Paula", "1.68", "2004-01-17",4);


/*DROP TABLE pedidos*/
/*select*from pedidos;*/
CREATE TABLE pedidos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
horario DATETIME NOT NULL,
endereco VARCHAR(200),
cliente_id INT NOT NULL,
FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);


/*---------------------------------------------------------------------------------------------------------------------------------------*/

/*DROP TABLE categorias*/
/*select*from categorias;*/
CREATE TABLE categorias(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL
);
INSERT INTO categorias values(default,"Bebidas");
INSERT INTO categorias values(default,"Industrializados");
INSERT INTO categorias values(default,"Frutas");
INSERT INTO categorias values(default,"Eletrônicos");
INSERT INTO categorias values(default,"Higiene");
INSERT INTO categorias values(default,"Remédios");


/*DROP TABLE produtos*/
/*select*from produtos;*/
CREATE TABLE produtos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preco DOUBLE,
quantidade DOUBLE,
categoria_id INT NOT NULL,
FOREIGN KEY(categoria_id) REFERENCES categorias(id)
);
INSERT INTO produtos values(default,"Pepsi-Lata","1.75","250","1");
INSERT INTO produtos values(default,"Coca-Cola-Lata","2.25","300","1");
INSERT INTO produtos values(default,"Pepsi 2L","3.89","170","1");
INSERT INTO produtos values(default,"Coca-Cola 2L","4.67","150","1");
INSERT INTO produtos values(default,"Maça UN","1.73","500","3");
INSERT INTO produtos values(default,"Banana UN","2.99","420","3");


/*---------------------------------------------------------------------------------------------------------------------------------------*/

/*DROP TABLE pedidos_produtos*/
/*select*from pedidos_produtos;*/
CREATE TABLE pedidos_produtos(
pedido_id INT NOT NULL,
produto_id INT NOT NULL,
preco DOUBLE,
quantidade DOUBLE,
PRIMARY KEY (pedido_id, produto_id),
FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);