CREATE DATABASE `db_restaurante`

CREATE TABLE tb_cliente (
    codigo_cliente INT PRIMARY KEY,
    nome_completo_cliente VARCHAR(100),
    endereco_email_cliente VARCHAR(50),
    numero_telefone_cliente VARCHAR(11),
    codigo_pessoa_fisica_cliente VARCHAR(15)
);


CREATE TABLE tb_status_reserva (
    codigo_status_reserva INT PRIMARY KEY,
    nome_status_reserva VARCHAR(45)
);


CREATE TABLE tb_reserva (
    codigo_reserva INT PRIMARY KEY,
    codigo_cliente INT,
    codigo_mesa INT,
    data_hora_reserva DATETIME,
    numero_pessoas INT,
    codigo_status_reserva INT,
    FOREIGN KEY (codigo_cliente) REFERENCES tb_cliente(codigo_cliente),
    FOREIGN KEY (codigo_status_reserva) REFERENCES tb_status_reserva(codigo_status_reserva)
);


CREATE TABLE tb_mesa (
    codigo_mesa INT PRIMARY KEY,
    capacidade_mesa INT,
    codigo_status_mesa INT,
    FOREIGN KEY (codigo_status_mesa) REFERENCES tb_status_reserva(codigo_status_reserva)
);


CREATE TABLE tb_status_pedido (
    codigo_status_pedido INT PRIMARY KEY,
    nome_status_pedido VARCHAR(15)
);


CREATE TABLE tb_cardapio (
    codigo_item INT PRIMARY KEY,
    nome_item VARCHAR(45),
    descricao_item VARCHAR(45),
    numero_valor_item DECIMAL(10, 2),
    nome_categoria_item VARCHAR(45)
);

CREATE TABLE tb_pedido (
    codigo_pedido INT PRIMARY KEY,
    codigo_mesa INT,
    data_hora_pedido DATETIME,
    codigo_status_pedido INT,
    FOREIGN KEY (codigo_mesa) REFERENCES tb_mesa(codigo_mesa),
    FOREIGN KEY (codigo_status_pedido) REFERENCES tb_status_pedido(codigo_status_pedido)
);

CREATE TABLE tb_pedido_cardapio (
    codigo_pedido INT,
    codigo_item INT,
    quantidade_item INT,
    PRIMARY KEY (codigo_pedido, codigo_item),
    FOREIGN KEY (codigo_pedido) REFERENCES tb_pedido(codigo_pedido),
    FOREIGN KEY (codigo_item) REFERENCES tb_cardapio(codigo_item)
);