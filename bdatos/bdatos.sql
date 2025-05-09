CREATE DATABASE IF NOT EXISTS bdatos;
USE bdatos;

CREATE TABLE IF NOT EXISTS t_categoria (
    id_categoria    INT (11) AUTO_INCREMENT NOT NULL,
    nombre          VARCHAR(100)            NOT NULL,

    CONSTRAINT pk_categorias PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_usuarios (
    id_usuario  INT(11) AUTO_INCREMENT  NOT NULL,
    nombre      VARCHAR(100)            NOT NULL,
    apellidos   VARCHAR(100)            NOT NULL,
    email       VARCHAR(100)            NOT NULL,
    password    VARCHAR(255)            NOT NULL,
    rol         INT(11)                 NOT NULL,
    imagen      VARCHAR(255)            NOT NULL,

    CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
    CONSTRAINT uq_email UNIQUE (email)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_pedidos (
    id_pedido   INT (11)AUTO_INCREMENT  NOT NULL,
    id_usuario  INT (11)                NOT NULL,
    ciudad       VARCHAR(100)           NOT NULL,
    direccion   VARCHAR(200)            NOT NULL,
    costo       FLOAT(100,2)            NOT NULL,
    estado      VARCHAR(20)             NOT NULL,
    fecha       DATE                    NOT NULL,
    hora        TIME                    NOT NULL,

    CONSTRAINT pk_pedidos PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedidos_usuarios FOREIGN KEY (id_usuario) REFERENCES t_usuarios (id_usuario)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_producto (
    id_producto     INT (11) AUTO_INCREMENT NOT NULL,
    id_categoria    INT (11)                NOT NULL,
    nombre          VARCHAR(100)            NOT NULL,
    precio          FLOAT(100,2)            NOT NULL,
    stock           INT (100)               NOT NULL,
    oferta          VARCHAR(20)             NOT NULL,
    fecha           DATE                    NOT NULL,
    imagen          VARCHAR(255)            NOT NULL,

    CONSTRAINT pk_productos PRIMARY KEY (id_producto),
    CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) REFERENCES t_categoria (id_categoria)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_lineapedidos (
    id_lineapedido INT (11) AUTO_INCREMENT NOT NULL,
    id_pedido      INT (11)                NOT NULL,
    id_producto    INT (11)                NOT NULL,
    unidades       INT (10)                NOT NULL,

    CONSTRAINT pk_lineapedidos PRIMARY KEY (id_lineapedido),
    CONSTRAINT fk_lineapedidos_pedidos FOREIGN KEY (id_pedido) REFERENCES t_pedidos (id_pedido),
    CONSTRAINT fk_lineapedidos_productos FOREIGN KEY (id_producto) REFERENCES t_producto (id_producto)
)ENGINE=InnoDB;




