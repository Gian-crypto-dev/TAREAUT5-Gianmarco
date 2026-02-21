DROP TABLE IF EXISTS entradas;
create database entradas;
use entradas;

create table recintos
(
cod_recinto int,
nombre varchar(10) not null,
direccion varchar(10) not null,
ciudad varchar(10) not null,
telefono varchar(10) not null,
horario varchar(10) not null,
constraint pk_recintos primary key (cod_recinto)
);

create table espectadores
(
dni_cliente varchar(9),
nombre varchar(10),
direccion varchar(10),
telefono varchar(9),
ciudad varchar(10),
ntarjate int not null,
constraint pk_espectadores primary key (dni_cliente)
);

create table zona_recintos
(
cod_recinto int,
zona varchar(10) not null,
capacidad int not null,
constraint pk_zonas_recintos primary key (cod_recinto, zona)
);

create table espectaculos
(
cod_espectaculo int,
nombre varchar(10) not null,
tipo varchar(10),
fecha_inicial date,
fecha_final date,
interprete varchar(15),
cod_recinto int,
constraint pk_espectaculos primary key (cod_espectaculo),
constraint fk_espectaculos_cod_recinto foreign key (cod_recinto) references recintos (cod_recinto)
);

create table representaciones
(
cod_espectaculo int,
fecha date not null,
hora varchar(10),
constraint pk_representaciones primary key (cod_espectaculo, fecha, hora),
constraint fk_representaciones_cod_espectaculo foreign key (cod_espectaculo) references espectaculos (cod_espectaculo)
);

create table precios_espectaculos
(
cod_espectaculo int,
cod_recinto int,
zona varchar(10),
precio decimal(5,2) default(0),
constraint pk_precios_espectaculos primary key (cod_espectaculo, cod_recinto, zona),
constraint fk_precios_espectaculos_cod_espectaculo foreign key (cod_espectaculo) references espectaculos (cod_espectaculo),
constraint fk_precios_zonas_recintos foreign key (cod_recinto, zona) references zona_recintos(cod_recinto, zona)
);

create table asientos
(
cod_recinto int,
zona varchar(10),
fila int,
numero int,
constraint pk_asientos primary key (cod_recinto, zona, fila, numero),
constraint fk_asientos foreign key (cod_recinto, zona) references zona_recintos(cod_recinto, zona)
);

create table entradas
(
cod_espectaculo int,
fecha date,
hora varchar(10),
cod_recinto int,
fila int,
numero int,
zona varchar(10),
dni_cliente varchar(9),
constraint pk_entradas primary key (cod_espectaculo, fecha, hora, cod_recinto, fila, numero, zona, dni_cliente),
constraint fk_entradas_espectadores foreign key (dni_cliente) references espectadores (dni_cliente),
constraint fk_entradas_representaciones foreign key (cod_espectaculo, fecha, hora) references representaciones (cod_espectaculo, fecha, hora),
constraint fk_entradas_asiento foreign key (cod_recinto, zona, fila, numero) references asientos (cod_recinto, zona, fila, numero)
);




































