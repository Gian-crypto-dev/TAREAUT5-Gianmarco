drop database if exists videoclub;
create database videoclub;
use videoclub;

create table director (
    dni varchar(9) auto_increment primary key,
    nombre varchar(100),
    nacionalidad varchar(50)
);

create table pelicula (
    titulo varchar(150),
    nacionalidad varchar(50),
    productora varchar(100),
    fecha date,
    dni_director varchar(9)
);

create table actor (
    nombre varchar(100),
    nacionalidad varchar(50),
    sexo varchar(1)
);

create table participa (
    titulo varchar(150),
    nombre_actor varchar(100),
    tipo_participacion varchar(20)
);

create table ejemplar (
    titulo varchar(150),
    num_ejemplar int,
    estado varchar(50)
);

create table socio (
    dni varchar(9),
    nombre varchar(100),
    telefono varchar(20),
    direccion varchar(150),
    dni_avalador varchar(9)
);

create table prestamo (
    dni_socio varchar(9),
    titulo varchar(150),
    num_ejemplar int,
    fecha_prestamo date,
    fecha_devolucion date
);

create table alquiler (
     num_ejemplar int,
     titulo varchar(150),
     dni_socio varchar(9),
     fecha_prestamo date,
     fecha_devolucion date
);

alter table director add primary key (dni);

alter table pelicula add primary key (titulo);

alter table actor add primary key (nombre);

alter table participa add primary key (titulo, nombre_actor);

alter table ejemplar add primary key (titulo, num_ejemplar);

alter table socio add primary key (dni);

alter table prestamo add primary key (dni_socio, titulo, num_ejemplar, fecha_prestamo);

alter table alquiler add primary key (dni_socio, titulo, num_ejemplar, fecha_prestamo);

alter table pelicula add foreign key (dni_director) references director(dni);

alter table participa add foreign key (titulo) references pelicula(titulo);

alter table participa add foreign key (nombre_actor) references actor(nombre);

alter table ejemplar add foreign key (titulo) references pelicula(titulo);

alter table prestamo add foreign key (dni_socio) references socio(dni);

alter table prestamo add foreign key (titulo, num_ejemplar) references ejemplar(titulo, num_ejemplar);

alter table socio add foreign key (dni_avalador) references socio(dni);

alter table alquiler add foreign key (titulo, num_ejemplar) references ejemplar(titulo, num_ejemplar);

alter table socio add fechanac date;

alter table prestamo add importe decimal(5,2) not null;

alter table prestamo add constraint chk_fechas check (fecha_devolucion >= fecha_prestamo);

alter table pelicula add column DineroGenerado decimal(10,4) not null;