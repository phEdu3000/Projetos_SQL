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

CREATE TABLE Matricula_Disciplina (
id_matricula_disciplina INT PRIMARY KEY AUTO_INCREMENT,
id_matricula INT,
id_disciplina INT,
ano_semestre VARCHAR(10),
status ENUM('Aprovado', 'Reprovado', 'Em andamento'),
FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

CREATE TABLE Nota (
id_nota INT PRIMARY KEY AUTO_INCREMENT,
id_matricula_disciplina INT UNIQUE,
nota1 DECIMAL(4,2),
nota2 DECIMAL(4,2),
nota_final DECIMAL(4,2),
data_avaliacao DATE,
FOREIGN KEY (id_matricula_disciplina) REFERENCES Matricula_Disciplina(id_matricula_disciplina)
);

INSERT INTO Curso (nome, duracao, descricao) VALUES
('Engenharia de Software', 10, 'Desenvolvimento e arquitetura de sistemas.'),
('Ciência de Dados', 8, 'Análise estatística e IA.'),
('Direito', 10, 'Estudo das normas e leis.'),
('Administração', 8, 'Gestão empresarial e financeira.'),
('Medicina', 12, 'Saúde e cuidados humanos.');

select * from Curso;