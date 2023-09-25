create database agenda
go
use agenda
go
--Creamos las tablas--
create table Amigos(
id_amigo int primary key identity(1,1),
nombre varchar(max) not null,
apellido varchar(max) not null,
fecha_nacimiento date not null,
Email varchar(max) not null,
telefono varchar(max) not null,
id_categoria int not null,
id_genero int not null
)
create table Categoria(
id_categoria int primary key identity(1,1),
nombre_categoria varchar(max)
)
create table Genero(
id_genero int primary key identity(1,1),
nombre_genero varchar(max)
)
--Agregamos las relaciones--
alter table Amigos add constraint fk_categoria_amigos foreign key(id_categoria) references Categoria(id_categoria)
alter table Amigos add constraint fk_genero_amigos foreign key(id_genero) references Genero(id_genero)
select* from Amigos
--Insertamos en las respectivas tablas--
--tabla GENERO--
insert into Genero(nombre_genero)
values
('Masculino'),
('Femenino')
select*from Genero
--Tabla CATEGORIA--
insert into Categoria(nombre_categoria)
values
('Mejor Amigo'),
('Amigo'),
('Compañero de universidad'),
('Conocido'),
('Amigo del barrio'),
('Compañero de trabajo')
select* from Categoria
--Tabla AMIGOS--
insert into Amigos (nombre,apellido,fecha_nacimiento,Email,telefono,id_categoria,id_genero)
values
('Pedro Yunior','Cornielle Sufran','2000-9-24','pedroyunior2012@gmail.com','8294470426',1,1),
('Adrik Alejandro','Ortiz','2000-2-12','Adriklexus@gmail.com','8293254553',3,1),
('Daniel','Tejada','1998-2-15','DanielT23@gmail.com','8296322232',3,1),
('Samuel Alexander','Soto Reyes','2000-8-21','samuelmiduo@gmail.com','8295643321',1,1),
('Heriberto','Federico','1999-5-24','paradigma02@gmail.com','8094490388',2,1),
('Jose Rafael','Fulgencio Frias','1999-9-20','lanautica@gmail.com','8095330485',1,1),
('Cristal','Acevedo Ferrand','2002-4-21','Cristalacevedo21@gmail.com','8293138586',1,2),
('Gisselle','Soriano','2000-5-16','gsoriano16@gmail.com','8294470426',6,2),
('Andrea','Segura Nina','2001-2-8','Andreasegura@gmail.com','8091244565',3,2),
('Lisbeth','Sanchez','2001-3-5','sanchezlisbeth@gmail.com','8493248555',6,2)
select*from Amigos
--hacemos un inner join--
select Amigos.nombre,Amigos.apellido,Categoria.nombre_categoria as 'Tipo de amigo',Genero.nombre_genero as 'Genero'  from Amigos
join Categoria on Amigos.id_categoria=Categoria.id_categoria
join Genero on Amigos.id_genero=Genero.id_genero order by nombre
--hacemos una vista--
create view Datos_Amigos as
select Amigos.nombre,Amigos.apellido,Amigos.fecha_nacimiento ,Categoria.nombre_categoria,Genero.nombre_genero from Amigos
join Categoria on Amigos.id_categoria=Categoria.id_categoria
join Genero on Amigos.id_genero=Genero.id_genero
--Revisamos la vista--
select*from Datos_Amigos order by nombre
select COUNT(*) as 'Total de amigos que tengo' from Amigos 
