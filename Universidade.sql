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
