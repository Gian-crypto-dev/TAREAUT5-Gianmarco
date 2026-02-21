create database ventas;
use ventas;

create table comercial
(
id_comercial int auto_increment primary key,
nombre varchar(100),
apellido1 varchar(100),
apellido2 varchar(100),
ciudad varchar(100),
comision float
);

create table cliente
(
id_cliente int auto_increment primary key,
nombre varchar(25),
primer_apellido varchar(15),
ciudad varchar(100),
categoria int

);

alter table cliente  modify nombre varchar(100) not null;

alter table cliente change primer_apellido apellido1 varchar(100) not null;

alter table cliente add apellido2 varchar(100) null after apellido1;

alter table cliente drop column categoria;

alter table comercial modify comision decimal(5,2) default 10;

