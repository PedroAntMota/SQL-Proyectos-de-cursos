create database empleados2
go
use empleados2
go
create table Empleados(
id_empleado int primary key identity(1,1),
nombre varchar(max) not null,
apellido varchar(max) not null,
fecha_nacimiento date not null,
Email varchar(max) not null,
salario int not null,
id_departamento int not null foreign key(id_departamento) references Departamento(id_departamento),
id_ciudad int not null foreign key(id_ciudad) references Ciudad(id_ciudad),
id_genero int not null foreign key(id_genero) references Genero(id_genero)
)
go
create table Departamento(
id_departamento int primary key identity(1,1),
nombre_departamento varchar(max) not null
)
go
create table Ciudad(
id_ciudad int primary key identity(1,1),
nombre_ciudad varchar(max) not null
)
go
create table Genero(
id_genero int primary key identity(1,1),
nombre_genero varchar(max) not null
)
go
--INSERTANDO VALORES EN LA TABLA GENEROS--
insert into Genero(nombre_genero)
values
('Masculino'),
('Femenino')
go
--FIN--
--hacemos select--
select * from Genero
--fin/select--
--INSERTANDO VALORES EN LA TABLA CIUDAD--
insert into Ciudad(nombre_ciudad) values
('San Cristobal'),
('Monte Cristi'),
('Monte Plata'),
('Valverde'),
('La Romana'),
('Dajabón'),
('Santiago'),
('Santiago de los Caballeros')
--FIN--
--hacemos select--
select * from Ciudad
--fin/select--
--INSERTANDO VALORES EN LA TABLA DEPARTAMENTO--
insert into Departamento(nombre_departamento)
values
('Soporte Tecnico'),
('Contabilidad'),
('Recursos Humanos'),
('Marketing'),
('Venta y Compra'),
('Seguridad'),
('Control de calidad')
--FIN--
--hacemos select--
select * from Departamento
--fin/select--
--insertando en la tabla Empleados
insert into Empleados (nombre,apellido,fecha_nacimiento,Email,salario,id_departamento,id_ciudad,id_genero)
values
('Pedro Antonio','Mota Soriano', '2001/1/14','pedroantoniomota14@gmail.com',35000,1,1,1),
('Maria Anthonella','Mota Soriano', '2001/1/14','mariamotainf@gmail.com',55000,1,2,2),
('Gregorio Antonio','Mota Soriano', '1999/12/14','gregoriomota14@gmail.com',100000,6,3,1),
('Anthonella Maria','Mota Soriano', '2007/12/10','anthonellamota14@gmail.com',90000,6,4,2),
('Cristal','Acevedo Ferrand', '2004/4/20','cristalacvf20@gmail.com',55000,2,5,2),
('Pedro yunior','Cornielle Sufran', '2000/9/24','pedroyunior2012@gmail.com',7500oo0,7,6,1),
('Andrea','Segura', '2002/2/8','andreasegura08@gmail.com',70000,4,7,2),
('Jose Rafael','Fulgencio Frias', '1999/9/21','fulgenciofrias21@gmail.com',150000,5,8,1),
('Emely Elaine','Marmolejos Muñoz', '2002/2/2','marmolejosemely@gmail.com',250000,3,1,2),
('Antonio','Mota Hernandez', '1972/6/13','antoniomota@gmail.com',950000,6,3,1),
('Maritza Aracelis','Soriano Cespedes', '1977/1/4','maritza11410@hotmail.com',70000,4,5,2)
--fin--
--hacemos select--
select*from Empleados
--fin/select--

--comprobamos con un join como queda nuestras relaciones--
select * from Empleados join Departamento on Empleados.id_departamento=Departamento.id_departamento
join Genero on Empleados.id_genero=Genero.id_genero
join Ciudad on empleados.id_ciudad=Ciudad.id_ciudad
--Fin join--
--hacemos un count para saber el numero total de nuestros registros de nuestra tabla empleados
select count(*) as 'Numero Total de Empleados' from Empleados
--fin count--
--Comprobamos la suma total de todos los sueldos--
select sum(salario) as 'Total de todos los sueldos' from Empleados
--Fin sum--
--Comprobamos cuales personas corresponden a cierto departamento--
select Empleados.nombre, Empleados.apellido, Departamento.nombre_departamento from Empleados
join Departamento on empleados.id_departamento=Departamento.id_departamento order by nombre
--fin--
--creamos una vista--
create view Empleados_V as
select*from Empleados
--fin/vista--
--vemos la vista--
select*from Empleados_V
--fin/select--
--vista Extendida--
Create view Empleados_datos as
select Empleados.nombre, Empleados.apellido, Empleados.fecha_nacimiento, Empleados.salario, Ciudad.nombre_ciudad, Departamento.nombre_departamento, Genero.nombre_genero
from Empleados join Departamento on Empleados.id_departamento=Departamento.id_departamento
join Ciudad on Empleados.id_ciudad=Ciudad.id_ciudad
join Genero on empleados.id_genero=Genero.id_genero
--Fin de la vista extendida--
--hacemos un select a nuestra vista a ver como queda--
select * from Empleados_datos