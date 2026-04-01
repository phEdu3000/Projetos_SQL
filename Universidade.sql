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


