CREATE TABLE Cliente 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,  
    cpf VARCHAR(14) NOT NULL,  
    nome VARCHAR(100) NOT NULL,  
    email VARCHAR(100) NOT NULL,  
    celular VARCHAR(20) NOT NULL,  
    senha INT,  
    UNIQUE (cpf)
); 

CREATE TABLE endereco 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,  
    idCliente INT,  
    estado VARCHAR(2) NOT NULL,  
    cidade VARCHAR(100) NOT NULL,  
    bairro VARCHAR(100) NOT NULL,  
    numero VARCHAR(10) NOT NULL,  
    rua VARCHAR(150) NOT NULL,  
    FOREIGN KEY (idCliente) REFERENCES Cliente (id)
); 

CREATE TABLE Compra 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,  
    idCliente INT NOT NULL,  
    idendereco INT,  
    data DATETIME NOT NULL,  
    forma_pagamento VARCHAR(50) NOT NULL,  
    valor_total INT,  
    FOREIGN KEY (idCliente) REFERENCES Cliente (id),
    FOREIGN KEY (idendereco) REFERENCES endereco (id)
); 

CREATE TABLE produto 
( 
    id INT PRIMARY KEY AUTO_INCREMENT,  
    nome VARCHAR(100) NOT NULL,  
    descricao VARCHAR(255) NOT NULL,  
    categoria VARCHAR(50) NOT NULL,  
    preco INT,  
    quantidade INT
); 

CREATE TABLE possui 
( 
    idCompra INT NOT NULL,  
    idProduto INT NOT NULL,  
    valor_unitario FLOAT NOT NULL,  
    quantidade INT NOT NULL,  
    PRIMARY KEY (idCompra, idProduto),
    FOREIGN KEY (idCompra) REFERENCES Compra (id),
    FOREIGN KEY (idProduto) REFERENCES produto (id)
);
