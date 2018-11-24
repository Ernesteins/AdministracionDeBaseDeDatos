/*
Created: 27/10/2018
Modified: 31/10/2018
Project: Pedidos
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/

create database pedidos
on primary
( name = pedido1,
	filename = 'D:\Data\pedido1.mdf',
	size = 5,
	maxsize = 10,
	filegrowth = 10%),
FILEGROUP Secundario
( name = pedido2,
	filename = 'D:\Data\pedido2.mdf',
	size = 5,
	maxsize = 10,
	filegrowth = 10%),
	( name = pedido3,
	filename = 'D:\Data\pedido3.mdf',
	size = 5,
	maxsize = 10,
	filegrowth = 10%)
log on
(name = pedido1_log,
	filename = 'D:\Log\pedidolog.idf',
	size = 2MB,
	maxsize = 10MB,
	filegrowth = 10%)

CREATE TABLE [Ciudad]
(
 [cod_cuidad] Char(3) NOT NULL,
 [nombre] Varchar(20) NULL
)
go

-- Add keys for table Ciudad

--ALTER TABLE [Ciudad] ADD CONSTRAINT [PK_Ciudad] PRIMARY KEY ([cod_cuidad])
--go

-- Table Cliente

CREATE TABLE [Cliente]
(
 [cod_cliente] Char(3) NOT NULL,
 [credito] Decimal(5,2) NULL,
        --CONSTRAINT [chk-credito] CHECK (credito<2000),
 [direccionenvio] Varchar(200) NULL,
 [descuento] Decimal(5,2) NULL,
        --CONSTRAINT [chk-descuento] CHECK (0 < descuento < 100),
 [cod_cuidad] Char(3) NULL,
 [garante] Char(3) NULL
)
go

-- Create indexes for table Cliente
/*
CREATE INDEX [IX_Relationship18] ON [Cliente] ([cod_cuidad])
go

CREATE INDEX [IX_Relationship19] ON [Cliente] ([garante])
go*/

-- Add keys for table Cliente

--ALTER TABLE [Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY ([cod_cliente])
--go

-- Table Producto

CREATE TABLE [Producto]
(
 [cod_producto] Char(3) NOT NULL,
 [nombre] Varchar(200) NULL
)
go

-- Add keys for table Producto

--ALTER TABLE [Producto] ADD CONSTRAINT [PK_Producto] PRIMARY KEY ([cod_producto])
--go

-- Table CabeceraP

CREATE TABLE [CabeceraP]
(
 [fecha] Date NULL,
 [montoTotal] Decimal(7,2) NULL,
 [cod_pedido] Char(3) NOT NULL,
 [cod_cliente] Char(3) NOT NULL
)
go

-- Create indexes for table CabeceraP

--CREATE INDEX [IX_Relationship15] ON [CabeceraP] ([cod_cliente])
--go

-- Add keys for table CabeceraP

--ALTER TABLE [CabeceraP] ADD CONSTRAINT [PK_CabeceraP] PRIMARY KEY ([cod_pedido])
--go

-- Table DetalleP

CREATE TABLE [DetalleP]
(
 [numlinea] Smallint NOT NULL,
 [precioUnit] Char(1) NULL,
 [cantidad] Char(1) NULL,
 [cod_producto] Char(3) NOT NULL,
 [cod_pedido] Char(3) NOT NULL
)
go

-- Create indexes for table DetalleP

--CREATE INDEX [IX_Relationship8] ON [DetalleP] ([cod_producto])
--go

-- Add keys for table DetalleP

--ALTER TABLE [DetalleP] ADD CONSTRAINT [PK_DetalleP] PRIMARY KEY ([cod_pedido],[numlinea])
--go

-- Table Proveedor

CREATE TABLE [Proveedor]
(
 [codigo] Char(3) NOT NULL,
 [nombre] Varchar(20) NULL
)
go

-- Add keys for table Proveedor

--ALTER TABLE [Proveedor] ADD CONSTRAINT [PK_Proveedor] PRIMARY KEY ([codigo])
--go

-- Table Telefono

CREATE TABLE [Telefono]
(
 [numero] Char(10) NOT NULL,
 [codigo] Char(3) NOT NULL
)
go

-- Add keys for table Telefono

--ALTER TABLE [Telefono] ADD CONSTRAINT [PK_Telefono] PRIMARY KEY ([numero],[codigo])
--go

-- Table provee

CREATE TABLE [provee]
(
 [cod_producto] Char(3) NOT NULL,
 [codigo] Char(3) NOT NULL,
 [stock] Int NULL
)
go
/*
-- Add keys for table provee

ALTER TABLE [provee] ADD CONSTRAINT [PK_provee] PRIMARY KEY ([cod_producto],[codigo])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Telefono] ADD CONSTRAINT [Posee] FOREIGN KEY ([codigo]) REFERENCES [Proveedor] ([codigo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DetalleP] ADD CONSTRAINT [Pertenece] FOREIGN KEY ([cod_producto]) REFERENCES [Producto] ([cod_producto]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [provee] ADD CONSTRAINT [Proveido] FOREIGN KEY ([cod_producto]) REFERENCES [Producto] ([cod_producto]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [provee] ADD CONSTRAINT [ProveedorR] FOREIGN KEY ([codigo]) REFERENCES [Proveedor] ([codigo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DetalleP] ADD CONSTRAINT [Tiene] FOREIGN KEY ([cod_pedido]) REFERENCES [CabeceraP] ([cod_pedido]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [CabeceraP] ADD CONSTRAINT [Solicita] FOREIGN KEY ([cod_cliente]) REFERENCES [Cliente] ([cod_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Cliente] ADD CONSTRAINT [Ubica] FOREIGN KEY ([cod_cuidad]) REFERENCES [Ciudad] ([cod_cuidad]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Cliente] ADD CONSTRAINT [debetener] FOREIGN KEY ([garante]) REFERENCES [Cliente] ([cod_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION NOT FOR REPLICATION
go
*/


use pedidos
go
create schema catalogo
go
create schema movimiento
go
CREATE TABLE [catalogo].[Ciudad]
(
 [cod_cuidad] Char(3) NOT NULL,
 [nombre] Varchar(20) NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo].[Cliente]
(
 [cod_cliente] Char(3) NOT NULL,
 [credito] Decimal(7,2) NULL,
        --CONSTRAINT [chk-credito] CHECK (credito<2000),
 [direccionenvio] Varchar(200) NULL,
 [descuento] Decimal(7,2) NULL,
        --CONSTRAINT [chk-descuento] CHECK (0 < descuento < 100),
 [cod_cuidad] Char(3) NULL,
 [garante] Char(3) NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo].[Producto]
(
 [cod_producto] Char(3) NOT NULL,
 [nombre] Varchar(200) NULL
)
ON [Secundario]
go

CREATE TABLE [movimiento].[CabeceraP]
(
 [fecha] Date NULL,
 [montoTotal] Decimal(7,2) NULL,
 [cod_pedido] Char(3) NOT NULL,
 [cod_cliente] Char(3) NOT NULL
)
ON [Primary]
go

CREATE TABLE [movimiento].[DetalleP]
(
 [numlinea] Smallint NOT NULL,
 [precioUnit] Char(1) NULL,
 [cantidad] Char(1) NULL,
 [cod_producto] Char(3) NOT NULL,
 [cod_pedido] Char(3) NOT NULL
)
ON [Primary]
go


CREATE TABLE [catalogo].[Proveedor]
(
 [codigo] Char(3) NOT NULL,
 [nombre] Varchar(20) NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo].[Telefono]
(
 [numero] Char(10) NOT NULL,
 [codigo] Char(3) NOT NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo].[provee]
(
 [cod_producto] Char(3) NOT NULL,
 [codigo] Char(3) NOT NULL,
 [stock] Int NULL
)
ON [Secundario]
go
/*
ingresos
*/
delete from catalogo.proveedor
delete from catalogo.provee
delete from catalogo.producto
delete from catalogo.cliente
delete from catalogo.ciudad
delete from catalogo.telefono

insert into catalogo.ciudad values ('CI1','Quito')
insert into catalogo.ciudad values ('CI2','Guayaquil')
insert into catalogo.ciudad values ('CI3','Cuenca')
insert into catalogo.ciudad values ('CI4','Loja')
insert into catalogo.ciudad values ('CI5','Ambato')

select * from catalogo.ciudad
--delete from catalogo.ciudad

insert into catalogo.cliente
values('C01',1500.00,'NNUU y 10 de Agosto',10,'CI1','C01')
insert into catalogo.cliente
values('C01',1230.00,'Necochea y miller',10,'CI1','C01')
insert into catalogo.cliente
values('C01',1840.00,'Vicentina',10,'CI1','C01')
insert into catalogo.cliente
values('C01',780.00,'Floresta',10,'CI1','C01')
insert into catalogo.cliente
values('C01',689.00,'Magdalena',10,'CI1','C01')
select * from catalogo.cliente

insert into catalogo.producto values ('P01','Producto1')
insert into catalogo.producto values ('P02','Producto2')
insert into catalogo.producto values ('P03','Producto3')
insert into catalogo.producto values ('P04','Producto4')
insert into catalogo.producto values ('P05','Producto5')
insert into catalogo.producto values ('P06','Producto6')
select * from catalogo.producto

insert into catalogo.provee values ('P01','PR1',105)
insert into catalogo.provee values ('P02','PR2',110)
insert into catalogo.provee values ('P03','PR3',50)
insert into catalogo.provee values ('P04','PR4',11)
insert into catalogo.provee values ('P05','PR5',70)
insert into catalogo.provee values ('P06','PR6',10)
insert into catalogo.provee values ('P07','PR7',67)
select * from catalogo.provee

insert into catalogo.proveedor values('PR1','Proveedor1')
insert into catalogo.proveedor values('PR2','Proveedor2')
insert into catalogo.proveedor values('PR3','Proveedor3')
insert into catalogo.proveedor values('PR4','Proveedor4')
insert into catalogo.proveedor values('PR5','Proveedor5')
insert into catalogo.proveedor values('PR6','Proveedor6')
insert into catalogo.proveedor values('PR7','Proveedor7')
select * from catalogo.proveedor

insert into catalogo.telefono values ('0995193658','PR1')
insert into catalogo.telefono values ('0995193124','PR2')
insert into catalogo.telefono values ('0995193346','PR3')
insert into catalogo.telefono values ('0995145659','PR4')
insert into catalogo.telefono values ('0995138656','PR5')
insert into catalogo.telefono values ('0995679858','PR6')
insert into catalogo.telefono values ('0995193487','PR7')
select * from catalogo.telefono

INSERT INTO [movimiento].[CABECERAP]
values('2018/10/01', 500,'PD1','C07')
INSERT INTO [movimiento].[CABECERAP]
values('2018/10/11', 500,'PD2','C01')
INSERT INTO [movimiento].[CABECERAP]
values('2018/10/10', 500, 'PD3','C02')
INSERT INTO [movimiento].[CABECERAP]
values('2018/10/04', 500, 'PD4','C03')
INSERT INTO [movimiento].[CABECERAP]
values('2018/10/06', 500, 'PD5','C04')
select * from movimiento.cabecerap

INSERT INTO [movimiento].[DETALLEP]
values(1,'1','5', '10','P01','PD1')
INSERT INTO [movimiento].[DETALLEP]
values('L2'1,50, 10, 'P02','PD2')
INSERT INTO [movimiento].[DETALLEP]
values('L3'1,50, 10, 'P03','PD3')
INSERT INTO [movimiento].[DETALLEP]
values('L4'1,50, 10, 'P04','PD4')
INSERT INTO [movimiento].[DETALLEP]
values('L5'1,50, 10, 'P05','PD5')
INSERT INTO [movimiento].[DETALLEP]
values('L6'2,25, 10, 'P05','PD1')
select * from movimiento.detallep