drop database if exists insituto;
create database instituto;
use instituto;


create table docente (
id_docente int auto_increment primary key,
nombre varchar(100) not null
);

create table modulo (
id_modulo int auto_increment primary key,
nombre varchar(100) not null,
id_docente int,
constraint fk_id_docente foreign key (id_docente) references docente(id_docente)
);

create table alumno (
    id_alumno int auto_increment primary key,
    nombre varchar(100) not null
);

create table matricula
(
	id_alumno int,
    id_modulo int,
    constraint pk_id_alumno_id_modulo primary key (id_alumno, id_modulo),
    constraint fk_id_alumno foreign key (id_alumno) references alumno(id_alumno),
    constraint fk_id_modulo foreign key (id_modulo) references modulo(id_modulo)
);


