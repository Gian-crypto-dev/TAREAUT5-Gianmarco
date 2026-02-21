drop database if exists centro_educativo;
create database centro_educativo;
use centro_educativo;

create table profesores
(
nombrePro varchar(10) unique,
apellido1Pro varchar(15),
apellido2pro varchar(15),
nifPro varchar(9),
dire varchar(30),
tituloPro varchar(30),
salario decimal(6,2) not null,
constraint pk_nifPro primary key(nifPro)
);

create table cursos
(
nombreCur varchar(10) unique,
codigoCur numeric(5) primary key,
nifPro varchar(9),
maxAlu numeric(3),
fechaIni date,
fechaFin date,
numHoto numeric(3) not null,
constraint fk_ foreign key (nifPro)
references profesores (nifPro) on delete cascade,
constraint ck_curso_fecha check (fechaFin > fechaIni)
);

create table alumnos
(
nombreAlu varchar(10),
apellido1Alu varchar(15),
apellido2Alu varchar(15),
nifAlu varchar(9) primary key,
direccionAlu varchar(30),
sexoAlu varchar(1),
fechaNaAlu date,
cursoAlu numeric(5),
constraint fk_cursoAlu_cursos foreign key (cursoAlu) 
references cursos (codigoCur),
constraint alu_sex_ck check (sexoAlu in ('H','M'))
);

