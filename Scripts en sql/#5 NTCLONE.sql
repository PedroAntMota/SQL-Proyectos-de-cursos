Create database NTclone
go
use NTclone
go
Create table Usuarios(
id_usuario int primary key identity(1,1),
nombre_usuario varchar(max),
correo_electronico varchar(max),
fecha_creacion date
)
Create table Peliculas(
id_pelicula int primary key identity(1,1),
titulo varchar(max),
descripcion varchar(max),
año date,
duracion varchar(max),
director varchar(max)
)
create table Series(
id_serie int primary key identity(1,1),
titulo varchar(max),
descripcion varchar(max),
año_inicio date,
año_fin date,
num_temp int
)
Create table Temporadas(
id_temporada int primary key identity(1,1),
id_serie int
)
alter table Temporadas add num_temporada int
Create table Episodios(
id_episodio int primary key identity(1,1),
titulo varchar(max),
descripcion varchar(max),
duracion varchar(max),
num_episodio int,
id_temporada int
)
Create table Episodios_en_listas(
id_episodio_en_lista int primary key identity(1,1),
id_episodio int,
id_reproduccion int
)
Create table Peliculas_en_listas(
id_pelicula_en_lista int primary key identity(1,1),
id_pelicula int,
id_reproduccion int
)
Create table Listas_en_reproduccion(
id_lista_reproduccion int primary key identity(1,1),
nombre varchar(max),
id_usuario int
)
--hacemos las respectivas relaciones entre tablas--
Alter table Listas_en_reproduccion add constraint FK_LISTA_EN_REPRODUCCION foreign key (id_usuario) references Usuarios(id_usuario)
Alter table Peliculas_en_listas add constraint FK_PELICULAS_EN_LISTAS foreign key (id_pelicula) references Peliculas(id_pelicula)
Alter table Peliculas_en_listas add constraint FK_PELICULAS_EN_LISTAS_Rep foreign key (id_reproduccion) references Listas_en_reproduccion(id_lista_reproduccion)
Alter table Temporadas add constraint FK_TMP_SER foreign key (id_serie) references Series(id_serie)
Alter table Episodios add constraint FK_EP_TEMP foreign key (id_temporada) references Temporadas(id_temporada)
Alter table Episodios_en_listas add constraint FK_EP_PEL foreign key (id_episodio) references Peliculas_en_listas(id_pelicula_en_lista)
Alter table Episodios_en_listas add constraint FK_EP_LIST_REP foreign key (id_reproduccion) references Listas_en_reproduccion(id_lista_reproduccion)
--fin--
--insertamos en la tabla usuarios--
insert into Usuarios(nombre_usuario, correo_electronico, fecha_creacion)
values
('Pedrosword','pedroantoniomota14@gmail.com','2023/4/28'),
('Leecham','pedroyunior2012@gmail.com','2023/4/28')
--Insertamos en la tabla Peliculas--
insert into Peliculas(titulo,descripcion,año,duracion,director)
values
('Star wars la venganza de los sith','Un jedi cae, los sith se levantan, para cobrar su venganza','2023/4/1','2h:30m','George Lucas'),
('Mario bros','Pelicula infantil que cuenta las aventuras de mario','2023/4/18','1h:30m','	Aaron Horvath Michael Jelenic')
select titulo,YEAR(año) as 'año de lanzamiento' from Peliculas
--Insertamos en tabla Series--
insert into Series(titulo,descripcion,año_inicio,año_fin)
values
alter table Series drop num_temp
('The last of us','Serie de zombie','2023/1/24','2023/3/5','1')
select * from Series
--Insertamos en tabla temporadas--
insert into Temporadas (num_temporada,id_serie)
values
(1,1)
--Insertamos en episodios--
Insert into Episodios(titulo,descripcion,duracion,num_episodio,id_temporada)
values
('When You’re Lost in the Darkness','Primer capitulo','1h:5m',1,1),
('Infected','Segundo capitulo','1h',2,1)
--insertamos en la tabla lista de reproduccion--
insert into Listas_en_reproduccion(nombre,id_usuario)
values
('Pelicula de mario',2)
('Series de zombie',1)
update Listas_en_reproduccion set nombre='Pelicula de star wars' where id_lista_reproduccion=1
--insertamos en la tabla peliculas en listas--
insert into Peliculas_en_listas(id_pelicula, id_reproduccion)
values
(2,2)
(1,1)
--insertamos en Episodios en listas--
insert into Episodios_en_listas(id_episodio,id_reproduccion)
values
(1,1),
(2,2)
--hacemos un join, para saber cuantos capitulos tiene la serie de the last of us--
select Series.titulo,Episodios.titulo,Episodios.num_episodio
from Series
left join Temporadas on Series.id_serie=Temporadas.id_serie
left join Episodios on Temporadas.id_temporada=Episodios.id_temporada
--hacemos una vista para ver los usuarios y su lista de reproduccion--
create view USUARIOS_LIST_VIEW as
select Usuarios.nombre_usuario, Listas_en_reproduccion.nombre
from Usuarios
join Listas_en_reproduccion on Usuarios.id_usuario=Listas_en_reproduccion.id_usuario
select * from USUARIOS_LIST_VIEW