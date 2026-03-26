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

CREATE TABLE Aluno (
id_aluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
data_nascimento DATE,
sexo CHAR(1),
email VARCHAR(100),
telefone VARCHAR(20),
endereco VARCHAR(255),

data_ingresso DATE
);

CREATE TABLE Disciplina (
id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
carga_horaria INT,
descricao TEXT,
id_professor INT,
FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Turma (
id_turma INT PRIMARY KEY AUTO_INCREMENT,
id_disciplina INT,
ano_semestre VARCHAR(10),
horario VARCHAR(50),
sala VARCHAR(20),
FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE Matricula (
id_matricula INT PRIMARY KEY AUTO_INCREMENT,
id_aluno INT,
id_curso INT,
data_matricula DATE,

status ENUM('Ativo', 'Inativo', 'Trancado'),
FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

