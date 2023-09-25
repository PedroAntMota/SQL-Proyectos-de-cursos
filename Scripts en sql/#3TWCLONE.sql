create database TWclone
go
use TWclone
--creamos la tabla--
create table Usuarios(
id_usuario int primary key identity(1,1),
nombre_usuario varchar(max),
correo_electronico varchar(max),
fecha_creacion date,
descripcion varchar(max)
)
--Insertamos En la tabla Uusuario--
insert into Usuarios (nombre_usuario, correo_electronico,fecha_creacion,descripcion)
values
('Pedrosword','pedroantoniomota14@gmail.com','2023/5/26','Estoy arpendiendo a crear bases de datos'),
('leecham','pedroyunior2012@gmail.com','2023/6/27','Acabo de crear mi cuenta en esta red social clonada de tweeter'),
('ytmariamota','mariamotainf@gmail.com','2023/5/20','Cada vez mas cerca de la musica'),
('ufg43','gregoriomota123@gmail.com','2023/5/27','Aprendiendo a ser cada dia mas como zenon'),
('HishCotorra','samuelmiduo@gmail.com','2023/5/26','Cada dia mas hablador')
select*from Usuarios
--probamos hacer un update--
update Usuarios set nombre_usuario='FFayanokoji' where id_usuario=5
update Usuarios set descripcion='Solo somos espejismos' where id_usuario=5
--end--
go
create table Tweets(
id_tweets int primary key identity(1,1),
contenido varchar(max),
fecha_creacion date,
id_usuario int foreign key references Usuarios(id_usuario)
)
--Insertando En la tabla Tweets--
insert into Tweets (contenido,fecha_creacion,id_usuario) 
values
('Cada Segundo es un regalo #FlashRebirth.','2023/5/26',1),
('Debias darle equilibrio a la fuerza, no dejarla en la oscuridad #starwars','2023/06/27',2),
('Escuchar getaway car un dia lluvioso es una experiencia unica #Taylorswift','2023/5/20',3),
('Quiero ser como una nube.... #Naruto','2023/05/27',4),
('Todos somos herramientas, solo trata de encontrar alguien que te de buen uso y te cuide #COTE','2023/05/26',5)
select*from Tweets
--End--
--hacemos un update en 2 casos--
update Tweets set contenido= 'Cada Segundo es un regalo #FlashRebirth. @leecham' where id_tweets=1
update Tweets set contenido= 'Debias darle equilibrio a la fuerza, no dejarla en la oscuridad #starwars @pedrosword' where id_tweets=2
go
create table Retweets(
id_retweets int primary key identity(1,1),
id_tweet_original int foreign key references Tweets(id_tweets),
id_usuario int foreign key references Usuarios(id_usuario),
fecha_creacion date
select*from Retweets
)
--insertamos en la tabla Retweets--
insert into Retweets (id_tweet_original,id_usuario,fecha_creacion)
values
(1,2,'2023/05/27'),
(2,1,'2023/6/28'),
(3,4,'2023/5/29')
select*from Retweets
--end--
go
create table Menciones(
id_mencion int primary key identity(1,1),
id_usuario_mencionado int foreign key references Usuarios(id_usuario),
id_tweet int foreign key references Tweets(id_tweets)
)
--insertamos en la tabla menciones--
insert into Menciones (id_usuario_mencionado, id_tweet)
values
(2,1),
(1,2)
select*from Menciones
--end--
go
create table Seguidores (
id_seguidor int primary key identity(1,1),
id_usuario_seguidor int foreign key references Usuarios(id_usuario),
id_usuario_seguido int foreign key references Usuarios(id_usuario),
fecha_creacion date
)
--insertamos en la tabla seguidores--
insert into Seguidores(id_usuario_seguidor,id_usuario_seguido,fecha_creacion)
values
(1,3,'2023/6/28'),
(2,3,'2023/7/2'),
(4,3,'2023/8/3'),
(5,3,'2023/9/4')
select*from Seguidores
--end--
go
create table hashtags(
id_hashtags int primary key identity(1,1),
nombre_hashtag varchar(max),
id_tweet int foreign key references Tweets(id_tweets)
)
--insertamos en la tabla hashtags--
insert into hashtags (nombre_hashtag,id_tweet)
values
('FlashRebirth',1),
('starwars',2),
('Taylorswift',3),
('Naruto',4),
('COTE',5)
--end--
--Procedemos a hacer un inner join--
select * from Usuarios
join Tweets on Usuarios.id_usuario=Tweets.id_usuario
full join Retweets on Usuarios.id_usuario=Retweets.id_usuario
full join Menciones on Usuarios.id_usuario=Menciones.id_usuario_mencionado
full join Seguidores on Usuarios.id_usuario=Seguidores.id_seguidor
join hashtags on Tweets.id_tweets= hashtags.id_tweet order by id_usuario_seguido asc
--end---
select Usuarios.nombre_usuario as 'Nombre de usuario' from Usuarios 
select count (id_usuario_seguido) as 'cantidad de seguidores' from Seguidores 
select count(id_usuario_seguido) from Seguidores
--creamos una vista solo para ver el tw, quien lo publico y las menciones--
create view SEE_TW_menciones as
select Usuarios.nombre_usuario, Tweets.contenido,hashtags.nombre_hashtag, Menciones.id_usuario_mencionado from Usuarios
join Tweets on Usuarios.id_usuario=Tweets.id_usuario
join hashtags on Tweets.id_tweets=hashtags.id_tweet
join Menciones on Usuarios.id_usuario=Menciones.id_usuario_mencionado
select*from SEE_TW_menciones
