/*
-------------------------------------------------------------------------------------------------------------------
Que es un Modelo de Negocio:

Un modelo de negocio es la forma en que una empresa crea, entrega y captura valor. En otras palabras, 
es la forma en que una empresa genera ingresos y beneficios a través de la oferta de sus productos o 
servicios. Un modelo de negocio también puede incluir la estrategia de la empresa para mantener su 
posición en el mercado, cómo se relaciona con los clientes y cómo opera internamente. Los modelos de 
negocio pueden variar ampliamente según la industria, el tamaño de la empresa y otros factores, pero 
todos tienen en común la creación de valor para los clientes y la captura de parte de ese valor como 
ganancia para la empresa.

-------------------------------------------------------------------------------------------------------------------
Que es un Modelo de Negocio Online:

Un modelo de negocio en línea, también conocido como negocio digital o negocio electrónico, se refiere 
a cualquier empresa que realiza sus operaciones principalmente a través de internet. Este tipo de modelo
de negocio se ha vuelto cada vez más popular en los últimos años debido al creciente uso de la tecnología
y a la comodidad que ofrece a los consumidores.

-------------------------------------------------------------------------------------------------------------------
Algunas características comunes de un modelo de negocio en línea son:

Bajo costo de entrada: iniciar un negocio en línea generalmente requiere menos capital que iniciar un negocio tradicional.

Amplio alcance: una empresa en línea puede llegar a una audiencia global, lo que significa que el potencial de 
crecimiento y de generación de ingresos es mayor.

Flexibilidad: las empresas en línea pueden adaptarse más fácilmente a los cambios en el mercado y a las 
necesidades de los clientes.

Diversificación: las empresas en línea pueden diversificar sus fuentes de ingresos a través de la venta de 
diferentes productos o servicios, publicidad, suscripciones, entre otros.

Analítica: una empresa en línea tiene acceso a una gran cantidad de datos y análisis que puede utilizar para
mejorar sus operaciones y estrategias.

Interacción y participación: los clientes pueden interactuar y participar más fácilmente en los procesos de 
compra y en la toma de decisiones empresariales a través de medios digitales.

-------------------------------------------------------------------------------------------------------------------
Para diseñar la base de datos de la tienda de ropa, se deben seguir los siguientes pasos:
-------------------------------------------------------------------------------------------------------------------

Identificar las entidades del negocio: las principales entidades del negocio son: 
clientes, vendedores, productos, categoria, tipo de venta, tipo de pago y factura.

Identificar los atributos de cada entidad: para cada entidad se deben identificar los atributos que la describen.
Por ejemplo, para la entidad clientes se identifican los atributos: id_cliente, nombre, apellido, dirección, teléfono, email y país.

Establecer las propiedades de los atributos: para cada atributo se debe definir el tipo de dato, la longitud, 
si es requerido o no, si es clave primaria o no, entre otras.

Identificar las restricciones de los atributos: se deben definir las restricciones para cada atributo.
Por ejemplo, para el atributo teléfono de la entidad clientes, se debe definir que solo se pueden ingresar 
números y que la longitud máxima es de 10 caracteres.

Establecer las relaciones entre las entidades: se deben establecer las relaciones entre las entidades para
poder modelar la forma en que se relacionan los datos en el negocio. En este caso, se tienen las siguientes relaciones:

Un cliente puede hacer varias compras, pero una compra solo puede ser realizada por un cliente.
Un vendedor puede realizar varias ventas, pero una venta solo puede ser realizada por un vendedor.
Un producto puede ser vendido en varias ventas, pero una venta solo puede contener un producto.
Una venta debe tener un tipo de venta y un tipo de pago asociado.
Un cliente pertenece a un país y un vendedor pertenece a un cliente.
Normalizar las tablas: se debe aplicar la normalización a las tablas 
para evitar la redundancia de datos y mantener la integridad de los datos.

Definir las claves primarias y foráneas: se deben definir las claves primarias y foráneas 
para poder establecer las relaciones entre las tablas.

Crear las tablas: se deben crear las tablas siguiendo el diseño definido en los pasos anteriores.

Crear los índices y restricciones necesarias: se deben crear los índices y restricciones
necesarias para garantizar la integridad de los datos y mejorar el rendimiento de las consultas.

-------------------------------------------------------------------------------------------------------------------
La elección de una base de datos depende de varios factores, como las necesidades de la aplicación, el tamaño de los datos, 
la escalabilidad, el presupuesto y la experiencia del equipo de desarrollo. Algunas de las opciones más comunes son:
-------------------------------------------------------------------------------------------------------------------

MySQL: Es una base de datos de código abierto que es popular para aplicaciones web y móviles de tamaño mediano. Es compatible
con varios lenguajes de programación y es escalable y fácil de usar.

PostgreSQL: Es una base de datos relacional de código abierto con características avanzadas como soporte para transacciones ACID,
recuperación ante fallas y replicación maestro-esclavo. Es una buena opción para aplicaciones de alta disponibilidad y alta escalabilidad.

MongoDB: Es una base de datos NoSQL de código abierto que utiliza un modelo de datos de documentos. Es ideal para aplicaciones web 
y móviles que requieren una escalabilidad horizontal y una capacidad de procesamiento de grandes cantidades de datos.

Oracle: Es una base de datos relacional comercial con características avanzadas de seguridad, escalabilidad y disponibilidad. Es 
ideal para grandes aplicaciones empresariales y de misión crítica que requieren un alto rendimiento y confiabilidad.

Microsoft SQL Server: Es una base de datos relacional comercial de Microsoft con soporte para lenguajes de programación .NET y 
una integración profunda con otras herramientas de Microsoft como Visual Studio y Azure. Es ideal para aplicaciones empresariales
de tamaño mediano y grande.

*/
--PARA EL EJEMPLO VAMOS A VER UN MODELO BASICO DE UNA TIENDA ONLINE:

--CREAR UNA BASE DE DATOS CON CODIGO:
CREATE DATABASE TIENDA_ROPA_DB_v1;

--USAR LA BASE DE DATOS.
USE TIENDA_ROPA_DB_v1;

--CREAR TABLA pais
CREATE TABLE pais(
id_pais INT PRIMARY KEY IDENTITY(1,1),
nombre_pais VARCHAR(50) NOT NULL
);

--CREAR TABLA clientes
CREATE TABLE clientes(
id_cliente INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
id_pais INT NOT NULL,
FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

--CREAR TABLA vendedores
CREATE TABLE vendedores(
id_vendedor INT PRIMARY KEY IDENTITY(1,1),
nombre_vendedor VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

--CREAR TABLA categoria_productos
CREATE TABLE categoria_productos(
id_categoria INT PRIMARY KEY IDENTITY(1,1),
descripcion VARCHAR(50) NOT NULL
);


--CREAR TABLA producto
CREATE TABLE producto (
id_producto INT PRIMARY KEY IDENTITY(1,1),
nombre_producto VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
precio INT NOT NULL,
id_categoria INT not null,
FOREIGN KEY (id_categoria) REFERENCES categoria_productos(id_categoria)
);

--CREAR UNA TABLA PARA FOTOS_PRODUCTOS:
CREATE TABLE FOTO_PRODUCTOS(
id_foto_Prouctos int primary key identity(1,1),
url_foto varchar(max) not null,
id_producto INT
FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);



--CREAR TABLA tipoventa
CREATE TABLE tipoventa(
id_tipoventa INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL
);

--CREAR TABLA tipo_de_pago
CREATE TABLE tipo_de_pago(
id_tipo_pago INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL
);

--CREAR TABLA factura
CREATE TABLE factura(
id_factura INT PRIMARY KEY IDENTITY(1,1),
id_cliente INT NOT NULL,
id_vendedor INT NOT NULL,
id_producto INT NOT NULL,
fecha DATE NOT NULL,
id_tipoventa INT NOT NULL,
id_tipo_pago INT NOT NULL,
cantidad INT NOT NULL,
total DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
FOREIGN KEY (id_tipoventa) REFERENCES tipoventa(id_tipoventa),
FOREIGN KEY (id_tipo_pago) REFERENCES tipo_de_pago(id_tipo_pago)
);


--VAMOS A INSERTAR VARIOS DATOS EN CADA TABLA:

--Tabla "pais":

INSERT INTO pais (nombre_pais) VALUES ('Republica Dominicana');
INSERT INTO pais (nombre_pais) VALUES ('México');
INSERT INTO pais (nombre_pais) VALUES ('Estados Unidos');
INSERT INTO pais (nombre_pais) VALUES ('Canadá');
INSERT INTO pais (nombre_pais) VALUES ('España');
INSERT INTO pais (nombre_pais) VALUES ('Argentina');
INSERT INTO pais (nombre_pais) VALUES ('Francia');
INSERT INTO pais (nombre_pais) VALUES ('Italia');
INSERT INTO pais (nombre_pais) VALUES ('Brasil');
INSERT INTO pais (nombre_pais) VALUES ('China');
INSERT INTO pais (nombre_pais) VALUES ('Japón');


--Tabla "clientes":

INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Juan', 'García', 'Calle 12 #123', '555-123-4567', 'juan.garcia@example.com', 1);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('María', 'López', 'Avenida 5 #567', '555-987-6543', 'maria.lopez@example.com', 2);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Pedro', 'Hernández', 'Boulevard 2 #234', '555-555-1212', 'pedro.hernandez@example.com', 1);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Ana', 'Gómez', 'Calle 8 #890', '555-777-8888', 'ana.gomez@example.com', 3);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Carlos', 'Sánchez', 'Plaza 3 #345', '555-999-0000', 'carlos.sanchez@example.com', 4);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Laura', 'Pérez', 'Calle 7 #890', '555-777-8888', 'laura.perez@example.com', 4);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Santiago', 'Vargas', 'Avenida 9 #567', '555-123-4567', 'santiago.vargas@example.com', 1);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Isabella', 'Fernández', 'Boulevard 1 #123', '555-555-1212', 'isabella.fernandez@example.com', 2);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Ricardo', 'Gutiérrez', 'Calle 3 #345', '555-999-0000', 'ricardo.gutierrez@example.com', 3);
INSERT INTO clientes (nombre, apellido, direccion, telefono, email, id_pais) VALUES ('Gabriela', 'González', 'Plaza 2 #234', '555-987-6543', 'gabriela.gonzalez@example.com', 1);


--Tabla "vendedores":

INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Luis', 'Calle 20 #345', '555-123-4567', 'luis@example.com', 1);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Ana', 'Avenida 1 #234', '555-987-6543', 'ana@example.com', 2);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Pedro', 'Boulevard 4 #567', '555-555-1212', 'pedro@example.com', 1);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Marta', 'Calle 10 #890', '555-777-8888', 'marta@example.com', 3);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Mario', 'Plaza 5 #123', '555-999-0000', 'mario@example.com', 4);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Fernando', 'Avenida 4 #234', '555-987-6543', 'fernando@example.com', 5);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Marcela', 'Calle 9 #890', '555-777-8888', 'marcela@example.com', 2);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('José', 'Boulevard 6 #567', '555-555-1212', 'jose@example.com', 1);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Sofía', 'Calle 5 #123', '555-123-4567', 'sofia@example.com', 3);
INSERT INTO vendedores (nombre_vendedor, direccion, telefono, email, id_cliente) VALUES ('Diego', 'Plaza 6 #345', '555-999-0000', 'diego@example.com', 4);


--Tabla "categoria_productos":

INSERT INTO categoria_productos (descripcion) VALUES ('Camisas');
INSERT INTO categoria_productos (descripcion) VALUES ('Pantalones');
INSERT INTO categoria_productos (descripcion) VALUES ('Zapatos');
INSERT INTO categoria_productos (descripcion) VALUES ('Accesorios');
INSERT INTO categoria_productos (descripcion) VALUES ('Ropa Interior');
INSERT INTO categoria_productos (descripcion) VALUES ('Blusas');
INSERT INTO categoria_productos (descripcion) VALUES ('Shorts');
INSERT INTO categoria_productos (descripcion) VALUES ('Vestidos');
INSERT INTO categoria_productos (descripcion) VALUES ('Bolsas');
INSERT INTO categoria_productos (descripcion) VALUES ('Ropa Deportiva');

--Tabla "producto":

INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Camisa blanca', 'Camisa de algodón blanca para caballero', 500, 1);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Pantalón de mezclilla', 'Pantalón de mezclilla para caballero', 800, 2);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Zapatos negros', 'Zapatos de piel negros para caballero', 1200, 3);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Reloj de pulsera', 'Reloj de pulsera de acero inoxidable', 1500, 4);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Boxer de algodón', 'Boxer de algodón para caballero', 200, 5);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Blusa rosa', 'Blusa de algodón rosa para dama', 450, 1);	
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Shorts de mezclilla', 'Shorts de mezclilla para caballero', 650, 2);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Vestido negro', 'Vestido negro para dama', 1200, 3);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Bolsa de piel', 'Bolsa de piel café para dama', 1500, 4);
INSERT INTO producto (nombre_producto, descripcion, precio, id_categoria) VALUES ('Leggings deportivos', 'Leggings deportivos para dama', 500, 5);

--hacemos un select a la tabla:

select * from producto

--hacemos un select a la tabla:

select * from FOTO_PRODUCTOS


INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://www.youniforms.cl/wp-content/uploads/2019/06/OXFORD-BLANCA-ML-600x870.png',1);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://portalropaempresas.cl/wp-content/uploads/2022/07/JEANS-MEZCLILLA-CRUDA-14-OZ.png',2);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://escarbato.com/wp-content/uploads/2023/03/ZAP140-2-PhotoRoom.png-PhotoRoom.png',3);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://argimirojoyero.com/wp-content/uploads/2022/03/toccata_5585-ST-650001_2_1.png',4);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://media.nidux.net/pull/599/800/10334/1849-product-60ca3e9e542bf-new-project-17.png',5);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://media.admininhouse.com/uploads/dummy/gal_16662/blusa%20mujer%20algodon%20cuello%20V_scaled.png',6);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://http2.mlstatic.com/D_NQ_NP_900307-MCO48948010917_012022-W.jpg',7);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://media.vogue.mx/photos/62797eb4331a7efa6720d5e6/master/w_1600%2Cc_limit/blackwedding_130422_floorsweeper4.png',8);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://www.prada.com/content/dam/pradanux_products/1/1BG/1BG339/2DKVF0YIH/1BG339_2DKV_F0YIH_V_OOM_SLF.png',9);
INSERT INTO FOTO_PRODUCTOS (url_foto,id_producto) VALUES ('https://i.pinimg.com/originals/1f/9e/38/1f9e382a9ad75545bbba9e14ea4872a7.png',10);



--Tabla "tipoventa":

INSERT INTO tipoventa (nombre) VALUES ('Contado');
INSERT INTO tipoventa (nombre) VALUES ('Crédito');
INSERT INTO tipoventa (nombre) VALUES ('Cheque');
INSERT INTO tipoventa (nombre) VALUES ('Pago Online');
INSERT INTO tipoventa (nombre) VALUES ('Apartado');
INSERT INTO tipoventa (nombre) VALUES ('Devolución');
INSERT INTO tipoventa (nombre) VALUES ('Cambio');

--Tabla "tipo_de_pago":

INSERT INTO tipo_de_pago (nombre) VALUES ('Efectivo');
INSERT INTO tipo_de_pago (nombre) VALUES ('Tarjeta de crédito');
INSERT INTO tipo_de_pago (nombre) VALUES ('Tarjeta de débito');
INSERT INTO tipo_de_pago (nombre) VALUES ('Transferencia bancaria');
INSERT INTO tipo_de_pago (nombre) VALUES ('Cheque');

--Tabla "factura":

INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 1, 1, '2023-04-20', 1, 1, 2, 1000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 2, 2, '2023-04-21', 2, 2, 1, 800.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 3, 3, '2023-04-19', 1, 1, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 4, 4, '2023-04-18', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 5, 5, '2023-04-17', 1, 1, 3, 600.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 2, 6, '2023-04-22', 2, 2, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 4, 4, '2023-04-19', 1, 1, 2, 3000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 5, 7, '2023-04-21', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 1, 5, '2023-04-20', 2, 2, 2, 1000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 3, 8, '2023-04-18', 1, 1, 3, 4500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 1, 9, '2023-04-17', 3, 3, 2, 2400.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 4, 6, '2023-04-16', 2, 2, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 3, 10, '2023-04-15', 1, 1, 3, 4500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 2, 4, '2023-04-14', 2, 2, 2, 2000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 5, 7, '2023-04-13', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 1, 1, '2023-04-12', 1, 1, 2, 3000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 2, 2, '2023-04-11', 2, 2, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 3, 3, '2023-04-10', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 4, 4, '2023-04-09', 1, 1, 2, 3000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 5, 5, '2023-04-08', 2, 2, 1, 1000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 2, 6, '2023-04-07', 3, 3, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 3, 7, '2023-04-06', 1, 1, 3, 4500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 4, 8, '2023-04-05', 2, 2, 2, 3000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 5, 9, '2023-04-04', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 1, 10, '2023-04-03', 1, 1, 2, 2400.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 3, 1, '2023-04-02', 2, 2, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 4, 2, '2023-04-01', 3, 3, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 5, 3, '2023-03-31', 1, 1, 2, 3000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 1, 4, '2023-03-30', 2, 2, 1, 1000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 2, 5, '2023-03-29', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 3, 6, '2023-03-28', 1, 1, 2, 2400.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 4, 7, '2023-03-27', 2, 2, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (3, 5, 8, '2023-03-26', 3, 3, 1, 1500.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (4, 1, 9, '2023-03-25', 1, 1, 2, 3000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (5, 2, 10, '2023-03-24', 2, 2, 1, 1000.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (1, 3, 1, '2023-03-23', 3, 3, 1, 1200.00);
INSERT INTO factura (id_cliente, id_vendedor, id_producto, fecha, id_tipoventa, id_tipo_pago, cantidad, total) VALUES (2, 4, 2, '2023-03-22', 1, 1, 3, 4500.00);


--AHORA VAMOS A REALIZAR VARIAS CONSULTAS DESDE CERO AVANZADO:

--Seleccionar todos los países:


SELECT * FROM pais;

--Seleccionar todos los clientes que vivan en "Buenos Aires":


SELECT * FROM clientes WHERE direccion LIKE '%Avenida 5 #567%';

 --Seleccionar todos los clientes que sean del pais con el ID 1:

SELECT * FROM clientes WHERE id_pais ='1';

--Seleccionar todos los vendedores y su país de origen:


SELECT v.*, p.nombre_pais FROM vendedores v JOIN clientes c ON v.id_cliente = c.id_cliente JOIN pais p ON c.id_pais = p.id_pais;

--Seleccionar todos los productos y su categoría:


SELECT p.*, c.descripcion FROM producto p JOIN categoria_productos c ON p.id_categoria = c.id_categoria;

--Seleccionar todas las ventas realizadas en el año actual:


SELECT * FROM factura WHERE YEAR(fecha) = YEAR(GETDATE());

--Seleccionar todas las ventas que sean de tipo "efectivo" o "tarjeta":


SELECT * FROM factura WHERE id_tipo_pago IN (SELECT id_tipo_pago FROM tipo_de_pago WHERE nombre IN ('efectivo', 'tarjeta'));

--Seleccionar todas las ventas que sean de tipo "efectivo" o "tarjeta" y pon el nombre al final tarjeta

SELECT f.*, tp.nombre 
FROM factura f 
JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago 
WHERE tp.nombre IN ('efectivo', 'tarjeta');

--Seleccionar todas las ventas con el nombre cliente, vendedor, producto, tipo_venta, tipo_pago, cantidad, y total con join":

SELECT f.id_factura, c.nombre AS nombre_cliente, v.nombre_vendedor, p.nombre_producto, f.fecha, 
tv.nombre AS tipo_venta, tp.nombre AS tipo_pago, f.cantidad, f.total 
FROM factura f 
JOIN clientes c ON f.id_cliente = c.id_cliente 
JOIN vendedores v ON f.id_vendedor = v.id_vendedor 
JOIN producto p ON f.id_producto = p.id_producto 
JOIN tipoventa tv ON f.id_tipoventa = tv.id_tipoventa 
JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago;


--Seleccionar todas las ventas de productos cuyo precio sea menores a $800:


SELECT * FROM factura f JOIN producto p ON f.id_producto = p.id_producto WHERE p.precio <=800;

--Seleccionar el número total de ventas realizadas:


SELECT COUNT(*) as total_ventas FROM factura;

--Seleccionar el número de ventas realizadas por tipo de pago:


SELECT t.nombre, COUNT(*) as total_ventas FROM factura f JOIN tipo_de_pago t ON f.id_tipo_pago = t.id_tipo_pago GROUP BY t.nombre;

--Seleccionar el número de ventas realizadas por tipo de pago y el pais:

SELECT t.nombre AS tipo_pago, COUNT(*) AS total_ventas, p.nombre_pais AS pais 
FROM factura f 
JOIN tipo_de_pago t ON f.id_tipo_pago = t.id_tipo_pago 
JOIN clientes c ON f.id_cliente = c.id_cliente 
JOIN pais p ON c.id_pais = p.id_pais 
GROUP BY t.nombre, p.nombre_pais;

--Seleccionar el número de ventas realizadas por tipo de pago y el pais y el monto:

SELECT t.nombre AS tipo_pago, COUNT(*) AS total_ventas, p.nombre_pais AS pais, SUM(f.total) AS monto_total_ventas
FROM factura f 
JOIN tipo_de_pago t ON f.id_tipo_pago = t.id_tipo_pago 
JOIN clientes c ON f.id_cliente = c.id_cliente 
JOIN pais p ON c.id_pais = p.id_pais 
GROUP BY t.nombre, p.nombre_pais;





--Seleccionar el precio total de todas las ventas realizadas:


SELECT SUM(total) as precio_total FROM factura;

--Seleccionar el promedio de precio de los productos vendidos:


SELECT AVG(precio) as precio_promedio FROM producto;

--Seleccionar el precio mínimo y máximo de los productos vendidos:


SELECT MIN(precio) as precio_minimo, MAX(precio) as precio_maximo FROM producto;

--Seleccionar los clientes que no hayan realizado ninguna compra:

SELECT * FROM clientes c WHERE c.id_cliente NOT IN (SELECT id_cliente FROM factura);

--Seleccionar los productos más vendidos por cantidad:

SELECT p.id_producto, p.nombre_producto, SUM(f.cantidad) AS cantidad_total 
FROM factura f 
JOIN producto p ON f.id_producto = p.id_producto 
GROUP BY p.id_producto, p.nombre_producto
ORDER BY cantidad_total DESC;



--Seleccionar los vendedores y su ranking de ventas:

SELECT v.*, 
       RANK() OVER (ORDER BY (SELECT SUM(cantidad) FROM factura f WHERE f.id_vendedor = v.id_vendedor) DESC) AS ranking_ventas 
FROM vendedores v;


--Seleccionar los vendedores y su ranking de ventas y su monto:

SELECT v.id_vendedor, v.nombre_vendedor, 
       RANK() OVER (ORDER BY (SELECT SUM(cantidad) FROM factura f WHERE f.id_vendedor = v.id_vendedor) DESC) AS ranking_ventas,
       SUM(f.total) AS monto_total_ventas
FROM vendedores v
JOIN factura f ON f.id_vendedor = v.id_vendedor
GROUP BY v.id_vendedor, v.nombre_vendedor;


--Ver las ventas por vendedor, cliente, país, producto, tipo de pago, monto, por mes # y año:

SELECT 
    YEAR(f.fecha) AS anio,
    MONTH(f.fecha) AS mes,
    v.nombre_vendedor AS vendedor,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    tp.nombre AS tipo_pago,
    f.total AS monto,
    pa.nombre_pais AS pais,
    COUNT(*) AS cantidad_ventas
FROM 
    factura f
    JOIN vendedores v ON f.id_vendedor = v.id_vendedor
    JOIN clientes c ON f.id_cliente = c.id_cliente
    JOIN pais pa ON c.id_pais = pa.id_pais
    JOIN producto p ON f.id_producto = p.id_producto
    JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago
GROUP BY 
    YEAR(f.fecha),
    MONTH(f.fecha),
    v.nombre_vendedor,
    c.nombre,
    p.nombre_producto,
    tp.nombre,
    f.total,
    pa.nombre_pais
ORDER BY 
    anio DESC,
    mes DESC,
    vendedor,
    cliente,
    pais,
    producto,
    tipo_pago,
    monto DESC;

----Ver las ventas por vendedor, cliente, país, producto, tipo de pago, monto, por mes nombre y año:
SELECT 
    YEAR(f.fecha) AS anio,
    DATENAME(month, f.fecha) AS mes,
    v.nombre_vendedor AS vendedor,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    tp.nombre AS tipo_pago,
    f.total AS monto,
    pa.nombre_pais AS pais,
    COUNT(*) AS cantidad_ventas
FROM 
    factura f
    JOIN vendedores v ON f.id_vendedor = v.id_vendedor
    JOIN clientes c ON f.id_cliente = c.id_cliente
    JOIN pais pa ON c.id_pais = pa.id_pais
    JOIN producto p ON f.id_producto = p.id_producto
    JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago
GROUP BY 
    YEAR(f.fecha),
    DATENAME(month, f.fecha),
    v.nombre_vendedor,
    c.nombre,
    p.nombre_producto,
    tp.nombre,
    f.total,
    pa.nombre_pais
ORDER BY 
    anio DESC,
    mes DESC,
    vendedor,
    cliente,
    pais,
    producto,
    tipo_pago,
    monto DESC;

--Crear una Vista con la consulta anterior:

CREATE or alter VIEW ventas_por_mes AS 
SELECT 
    YEAR(f.fecha) AS anio,
    DATENAME(month, f.fecha) AS mes,
    v.nombre_vendedor AS vendedor,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    tp.nombre AS tipo_pago,
    f.total AS monto,
    pa.nombre_pais AS pais,
    COUNT(*) AS cantidad_ventas
FROM 
    factura f
    JOIN vendedores v ON f.id_vendedor = v.id_vendedor
    JOIN clientes c ON f.id_cliente = c.id_cliente
    JOIN pais pa ON c.id_pais = pa.id_pais
    JOIN producto p ON f.id_producto = p.id_producto
    JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago
GROUP BY 
    YEAR(f.fecha),
    DATENAME(month, f.fecha),
    v.nombre_vendedor,
    c.nombre,
    p.nombre_producto,
    tp.nombre,
    f.total,
    pa.nombre_pais

--VER LA VISTA ventas_por_mes

select * from ventas_por_mes


CREATE OR ALTER VIEW ventas_por_mes_por_Categoria AS 
SELECT 
    YEAR(f.fecha) AS anio,
    DATENAME(month, f.fecha) AS mes,
    v.nombre_vendedor AS vendedor,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    cp.descripcion AS categoria,
    tp.nombre AS tipo_pago,
    f.total AS monto,
    pa.nombre_pais AS pais,
    COUNT(*) AS cantidad_ventas
FROM 
    factura f
    JOIN vendedores v ON f.id_vendedor = v.id_vendedor
    JOIN clientes c ON f.id_cliente = c.id_cliente
    JOIN pais pa ON c.id_pais = pa.id_pais
    JOIN producto p ON f.id_producto = p.id_producto
    JOIN categoria_productos cp ON p.id_categoria = cp.id_categoria
    JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago
GROUP BY 
    YEAR(f.fecha),
    DATENAME(month, f.fecha),
    v.nombre_vendedor,
    c.nombre,
    p.nombre_producto,
    cp.descripcion,
    tp.nombre,
    f.total,
    pa.nombre_pais;

--VER LA VISTA ventas_por_mes

select * from ventas_por_mes_por_Categoria


--Crear un procedimiento Almacenado con Parametros de Fecha_inicial y Final:

CREATE OR ALTER PROCEDURE ventas_por_mes_sp
    @fecha_inicial DATE,
    @fecha_final DATE
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        YEAR(f.fecha) AS anio,
        DATENAME(month, f.fecha) AS mes,
        v.nombre_vendedor AS vendedor,
        c.nombre AS cliente,
        p.nombre_producto AS producto,
        cp.descripcion AS categoria,
        tp.nombre AS tipo_pago,
        f.total AS monto,
        pa.nombre_pais AS pais,
        COUNT(*) AS cantidad_ventas
    FROM 
        factura f
        JOIN vendedores v ON f.id_vendedor = v.id_vendedor
        JOIN clientes c ON f.id_cliente = c.id_cliente
        JOIN pais pa ON c.id_pais = pa.id_pais
        JOIN producto p ON f.id_producto = p.id_producto
        JOIN categoria_productos cp ON p.id_categoria = cp.id_categoria
        JOIN tipo_de_pago tp ON f.id_tipo_pago = tp.id_tipo_pago
    WHERE
        f.fecha BETWEEN @fecha_inicial AND @fecha_final
    GROUP BY 
        YEAR(f.fecha),
        DATENAME(month, f.fecha),
        v.nombre_vendedor,
        c.nombre,
        p.nombre_producto,
        cp.descripcion,
        tp.nombre,
        f.total,
        pa.nombre_pais;
        
END;



---Para ejecutar el procedimiento almacenado, simplemente llámalo y pasa las fechas correspondientes como parámetros:

EXEC ventas_por_mes_sp '2021-01-01', '2023-12-31';


