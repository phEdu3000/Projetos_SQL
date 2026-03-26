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

INSERT INTO Professor (nome, email, telefone, departamento) VALUES
('Alan Turing', 'turing@univ.edu', '11911111111', 'Computação'),
('Grace Hopper', 'hopper@univ.edu', '11922222222', 'Computação'),
('Marie Curie', 'curie@univ.edu', '11933333333', 'Ciências Naturais'),
('Albert Einstein', 'albert@univ.edu', '11944444444', 'Física'),
('Ada Lovelace', 'ada@univ.edu', '11955555555', 'Matemática'),
('Isaac Newton', 'newton@univ.edu', '11966666666', 'Física'),
('Sigmund Freud', 'freud@univ.edu', '11977777777', 'Psicologia'),
('Hannah Arendt', 'arendt@univ.edu', '11988888888', 'Filosofia'),
('Machado de Assis', 'machado@univ.edu', '11999999999', 'Letras'),
('Charles Darwin', 'darwin@univ.edu', '11900000000', 'Biologia');

select * from Professor;

INSERT INTO Disciplina (nome, carga_horaria, descricao, id_professor) VALUES
('Algoritmos', 80, 'Lógica de programação', 1),
('Banco de Dados', 60, 'Modelagem SQL', 2),
('Cálculo I', 80, 'Derivadas e integrais', 5),
('Direito Civil', 60, 'Contratos e obrigações', 8),
('Anatomia', 100, 'Estudo do corpo humano', 10),
('Estatística', 60, 'Probabilidade', 5),
('Física Quântica', 80, 'Partículas e ondas', 4),
('Gestão de Pessoas', 40, 'Recursos Humanos', 7),
('Estrutura de Dados', 80, 'Árvores e Grafos', 1),
('Sistemas Operacionais', 60, 'Kernel e Processos', 2);

select * from Disciplina;

INSERT INTO Aluno (nome, data_nascimento, sexo, email, telefone, endereco, data_ingresso)
VALUES
('Ana Silva', '2000-05-10', 'F', 'ana@email.com', '11980000001', 'Rua A, 1', '2024-02-01'),
('Bruno Costa', '1999-03-15', 'M', 'bruno@email.com', '11980000002', 'Rua B, 2', '2024-02-01'),
('Carla Dias', '2001-07-20', 'F', 'carla@email.com', '11980000003', 'Rua C, 3', '2024-02-01'),
('Daniel Melo', '1998-11-05', 'M', 'daniel@email.com', '11980000004', 'Rua D, 4', '2024-02-01'),
('Elena Rosa', '2002-01-12', 'F', 'elena@email.com', '11980000005', 'Rua E, 5', '2024-02-01'),
('Fabio Luz', '2000-08-30', 'M', 'fabio@email.com', '11980000006', 'Rua F, 6', '2024-02-01'),
('Gisele Vaz', '1997-04-22', 'F', 'gisele@email.com', '11980000007', 'Rua G, 7', '2024-02-01'),
('Hugo Lima', '1999-12-01', 'M', 'hugo@email.com', '11980000008', 'Rua H, 8', '2024-02-01'),
('Iara Sol', '2001-09-09', 'F', 'iara@email.com', '11980000009', 'Rua I, 9', '2024-02-01'),
('Joao Neto', '2000-02-14', 'M', 'joao@email.com', '11980000010', 'Rua J, 10', '2024-02-01'),
('Kelly Amor', '1998-06-25', 'F', 'kelly@email.com', '11980000011', 'Rua K, 11', '2024-02-01'),
('Luis Pires', '1999-10-10', 'M', 'luis@email.com', '11980000012', 'Rua L, 12', '2024-02-01'),
('Mara Lins', '2002-04-18', 'F', 'mara@email.com', '11980000013', 'Rua M, 13', '2024-02-01'),
('Nuno Vale', '2001-08-05', 'M', 'nuno@email.com', '11980000014', 'Rua N, 14', '2024-02-01'),
('Olga Reis', '1997-12-30', 'F', 'olga@email.com', '11980000015', 'Rua O, 15', '2024-02-01'),
('Paulo Jota', '2000-03-21', 'M', 'paulo@email.com', '11980000016', 'Rua P, 16', '2024-02-01'),
('Quenia Luz', '2002-07-07', 'F', 'quenia@email.com', '11980000017', 'Rua Q, 17', '2024-02-01'),
('Rui Silva', '1999-01-11', 'M', 'rui@email.com', '11980000018', 'Rua R, 18', '2024-02-01'),
('Sara Mendes', '2001-11-29', 'F', 'sara@email.com', '11980000019', 'Rua S, 19', '2024-02-01'),
('Theo Rocha', '2000-06-14', 'M', 'theo@email.com', '11980000020', 'Rua T, 20', '2024-02-01'),
('Uriel Faria', '1998-09-02', 'M', 'uriel@email.com', '11980000021', 'Rua U, 21', '2024-02-01'),
('Vera Cruz', '2002-02-22', 'F', 'vera@email.com', '11980000022', 'Rua V, 22', '2024-02-01'),
('Walter Gil', '2001-05-05', 'M', 'walter@email.com', '11980000023', 'Rua W, 23', '2024-02-01'),
('Xenia Lima', '1999-08-19', 'F', 'xenia@email.com', '11980000024', 'Rua X, 24', '2024-02-01'),
('Yago Brito', '2000-10-31', 'M', 'yago@email.com', '11980000025', 'Rua Y, 25', '2024-02-01'),
('Zilda Mara', '1998-04-12', 'F', 'zilda@email.com', '11980000026', 'Rua Z, 26', '2024-02-01'),
('Arthur King', '2001-12-12', 'M', 'arthur@email.com', '11980000027', 'Rua AA, 27', '2024-02-01'),
('Beatriz Oh', '2002-03-03', 'F', 'beatriz@email.com', '11980000028', 'Rua BB, 28', '2024-02-01'),
('Caio Cesar', '1999-09-09', 'M', 'caio@email.com', '11980000029', 'Rua CC, 29', '2024-02-01'),
('Dora Aventureira', '2000-01-01', 'F', 'dora@email.com', '11980000030', 'Rua DD, 30', '2024-02-01');

select * from Aluno;

INSERT INTO Matricula (id_aluno, id_curso, data_matricula, status) VALUES
(1, 1, '2024-02-01', 'Ativo'), (2, 1, '2024-02-01', 'Ativo'), (3, 1, '2024-02-01', 'Ativo'), (4, 1, '2024-02-01', 'Ativo'), (5, 1, '2024-02-01', 'Ativo'), (6, 1, '2024-02-01', 'Ativo'),
(7, 2, '2024-02-01', 'Ativo'), (8, 2, '2024-02-01', 'Ativo'), (9, 2, '2024-02-01', 'Ativo'), (10, 2, '2024-02-01', 'Ativo'), (11, 2, '2024-02-01', 'Ativo'), (12, 2, '2024-02-01', 'Ativo'),
(13, 3, '2024-02-01', 'Ativo'), (14, 3, '2024-02-01', 'Ativo'), (15, 3, '2024-02-01', 'Ativo'), (16, 3, '2024-02-01', 'Ativo'), (17, 3, '2024-02-01', 'Ativo'), (18, 3, '2024-02-01', 'Ativo'),
(19, 4, '2024-02-01', 'Ativo'), (20, 4, '2024-02-01', 'Ativo'), (21, 4, '2024-02-01', 'Ativo'), (22, 4, '2024-02-01', 'Ativo'), (23, 4, '2024-02-01', 'Ativo'), (24, 4, '2024-02-01', 'Ativo'),
(25, 5, '2024-02-01', 'Ativo'), (26, 5, '2024-02-01', 'Ativo'), (27, 5, '2024-02-01', 'Ativo'), (28, 5, '2024-02-01', 'Ativo'), (29, 5, '2024-02-01', 'Ativo'), (30, 5, '2024-02-01', 'Ativo');

select * from Matricula;

INSERT INTO Turma (id_disciplina, ano_semestre, horario, sala) VALUES
(1, '2024/1', '08:00-10:00', 'Sala 101'),
(2, '2024/1', '10:00-12:00', 'Sala 102'),
(3, '2024/1', '08:00-10:00', 'Sala 201'),
(4, '2024/1', '19:00-21:00', 'Sala 301'),
(5, '2024/1', '07:00-12:00', 'Laboratório A');

select * from Turma;


INSERT INTO Matricula_Disciplina (id_matricula, id_disciplina, ano_semestre, status)
SELECT id_matricula, 1, '2024/1', 'Aprovado' FROM Matricula WHERE id_matricula <= 30;

