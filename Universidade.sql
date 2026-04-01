create database Universidade;
use Universidade;

create table Aula(
id int auto_increment primary key,
nome varchar(50),
data_nascimento date,
sexo varchar(15),
email varchar(50),
telefone varchar(13),
endereço varchar(50),
data_curso date

);

create table Curso(
id int auto_increment primary key,
Nome varchar(50) not null,
Duração int not null,
Descrição varchar(100)
);

create table Disciplina(
id int auto_increment primary key,
Nome varchar(50) not null,
carga_horaria int,
descricao varchar(50)
);

create table Professor(
id int auto_increment primary key,
Nome varchar(50),
email varchar(50),
telefone varchar(50),
departamento varchar(50)
);

CREATE TABLE Matricula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    status ENUM('Ativo', 'Inativo', 'Trancado'),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id),
    FOREIGN KEY (id_curso) REFERENCES Curso(id)
);

CREATE TABLE Matricula_Disciplina (
    id_matricula_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT,
    id_disciplina INT,
    ano_semestre VARCHAR(10),
    status ENUM('Aprovado', 'Reprovado', 'Em andamento'),

    FOREIGN KEY (id_matricula) REFERENCES Matricula(id),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id)
);

CREATE TABLE Nota (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula_disciplina INT UNIQUE,
    nota1 DECIMAL(5,2),
    nota2 DECIMAL(5,2),
    nota_final DECIMAL(5,2),
    data_avaliacao DATE,

    FOREIGN KEY (id_matricula_disciplina)
        REFERENCES Matricula_Disciplina(id_matricula_disciplina)
);

rename table aula to aluno;

CREATE TABLE Turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_disciplina INT,
    ano_semestre VARCHAR(10),
    horario VARCHAR(20),
    sala VARCHAR(20),

    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id)
);

INSERT INTO Aluno (nome, data_nascimento, sexo, email, telefone, endereço) VALUES
('Ana Silva','2000-01-15','F','ana@email.com','11999999999','Rua A'),
('Bruno Costa','1999-05-20','M','bruno@email.com','11988888888','Rua B'),
('Carlos Souza','2001-08-30','M','carlos@email.com','11977777777','Rua C'),
('Daniela Lima','2000-12-12','F','daniela@email.com','11966666666','Rua D'),
('Eduardo Rocha','1998-03-10','M','eduardo@email.com','11955555555','Rua E'),
('Fernanda Alves','2001-07-25','F','fernanda@email.com','11944444444','Rua F'),
('Gustavo Melo','1999-11-02','M','gustavo@email.com','11933333333','Rua G'),
('Helena Pinto','2000-09-09','F','helena@email.com','11922222222','Rua H'),
('Igor Santos','2001-04-14','M','igor@email.com','11911111111','Rua I'),
('Juliana Martins','1998-06-18','F','juliana@email.com','11900000000','Rua J');

INSERT INTO Curso (nome, Duração, Descrição) VALUES
('Engenharia','48','Engenharia Civil'),
('Medicina','72','Curso de Medicina'),
('Direito','60','Curso de Direito'),
('Administração','48','Curso de Administração'),
('Enfermagem','48','Curso de Enfermagem'),
('Computação','48','Curso de Ciência da Computação'),
('Arquitetura','48','Curso de Arquitetura'),
('Física','48','Curso de Física'),
('Matemática','48','Curso de Matemática'),
('Química','48','Curso de Química');

INSERT INTO Disciplina (Nome, carga_horaria, descricao) VALUES
('Algoritmos', 80, 'Logica de programacao'),
('Banco de Dados', 60, 'Modelagem e SQL'),
('Estrutura de Dados', 80, 'Listas, pilhas e filas'),
('Sistemas Operacionais', 60, 'Processos e memoria'),
('Redes de Computadores', 60, 'Protocolos e comunicacao'),
('Engenharia de Software', 80, 'Metodologias e projetos'),
('Inteligencia Artificial', 60, 'Aprendizado de maquina'),
('Programacao Web', 60, 'HTML, CSS e PHP'),
('Seguranca da Informacao', 40, 'Criptografia e seguranca'),
('Computacao em Nuvem', 40, 'Cloud e servicos online');