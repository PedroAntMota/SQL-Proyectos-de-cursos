create database blog
go
use blog
go
--creamos la tabla Autores--
create table Autores(
id_autor int primary key identity(1,1),
nombre varchar(max) not null,
apellido varchar(max) not null,
correo_electronico varchar(max) not null
)
--end--
--Creamos la tabla Categorias--
go
create table Categorias(
id_categoria int primary key identity(1,1),
nombre_categoria varchar(max) not null
)
--end--
--Creamos la tabla Articulos--
go
Create table Articulos(
id_articulo int primary key identity(1,1),
titulo varchar(max),
contenido varchar(max),
fecha_publicacion date,
id_autor int,
id_categoria int
)
--end--
--Creamos la tabla Comentarios--
go
Create table Comentarios(
id_comentario int primary key identity(1,1),
contenido varchar(max),
fecha_publicacion date,
id_articulo int
)
--AGREGAMOS LAS FK
alter table Comentarios add constraint FK_articulo foreign key (id_articulo) references Articulos(id_articulo)
alter table Articulos add constraint FK_Artautor foreign key (id_autor) references Autores(id_autor)
alter table Articulos add constraint FK_Art foreign key (id_categoria) references Categorias(id_categoria)
--fin--
--hacemos los select--
select*from Autores
select*from Categorias
select*from Articulos
select*from Comentarios
--end--
--insertamos en la tabla Categorias
insert into Categorias (nombre_categoria)
values
('Ciencia y Tecnologia'),
('Politica'),
('Animes y Peliculas'),
('Videojuegos'),
('Dia a Dia')
select*from Categorias
--end--
--Insertamos en la tabla Autores--
insert into Autores (nombre,apellido,correo_electronico)
values
('Pedro Antonio','Mota Soriano','pedroantoniomota14@gmail.com'),
('Maria Anthonella','Mota Soriano','mariamotainf@gmail.com'),
('Gregorio Antonio','Mota Soriano','gregorio123@gmail.com'),
('Anthonella Maria','Mota Soriano','Anthonellam10@gmail.com'),
('Pedro Yunior','Cornielle Sufran','pedroyunior2012@gmail.com')
select*from Autores
--end--
--Insertamos en la tabla Comentarios--
insert into Comentarios(contenido,fecha_publicacion,id_articulo)
values
('Estuvo excelente el articulo acerca de flash, es mi personaje favorito','2023/4/27',1),
('Muy interesante el tema de chatgpt ahora los junior nos acercaremos mas facil a los senior!','2023/4/28',2),
('WAOO I AM SO excited!! no sabia que sacarian una pelicula de psycho pass','2023/4/29',3),
('Jedi survivor va a romper el esquema de todos los juegos de star wars estoy muy emocionado y mas ahora que sabemos que es canonico','2023/4/30',4)
select*from Comentarios
--Insertamos en la tabla Articulos
insert into Articulos (titulo,contenido,fecha_publicacion,id_autor,id_categoria)
values
('Flash Rompe internet con su nuevo trailer','Al parecer la pelicula de the flash nos traera un sin numero de cameos muy importantes contandonos la historia adaptada del comics the flashpoint','2023/3/1',1,3),
('Chatgpt, toma mas auge entre los estudiantes de software','chatgpt la nueva inteligencia artificial que ayuda a los programadores a mejorar su eficiencia y eficacia en un 200% ahora esta en fase beta y gratis.','2023/3/1',2,1),
('Psycho pass lanza nuevo trailer de su nueva pelicula','Al parecer la pelicula nueva de psycho pass contara el pasado del padre de arata y su relacion con akane lo cual lleva a su despido de inspectora y pase a ser ejecutora','2023/3/4',3,3),
('Nuevo trailer del juego jedi survivor','El nuevo trailer de jedi survivor nos revelo muchisimas cosas nuevas en la mecanica de juego en cuanto a los estilos de combate de cal kestis','2023/3/5',4,4)
select*from Articulos
--end--
select Autores.nombre,Articulos.titulo,Articulos.contenido,Categorias.nombre_categoria,Comentarios.contenido
from Autores
join Articulos on Autores.id_autor=Articulos.id_autor
join Categorias on Articulos.id_categoria=Categorias.id_categoria
join Comentarios on Articulos.id_articulo=Comentarios.id_articulo order by nombre
--creamos una vista para ver los articulos y quien publico dicho articulo--
create view ART_WHO as
select Articulos.titulo, Autores.nombre from Articulos
join Autores on Articulos.id_autor=Autores.id_autor
--endview--
--vemos la vista--
select*from ART_WHO