CREATE DATABASE GestaoAcademica;
use GestaoAcademica;

CREATE TABLE Curso (
id_curso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
duracao INT,
descricao TEXT
);

CREATE TABLE Professor (
id_professor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100),
telefone VARCHAR(20),
departamento VARCHAR(100)
);