/*
Created: 27/10/2018
Modified: 27/10/2018
Project: Pedidos
Model: Microsoft SQL Server 2017
Database: MS SQL Server 2017
*/


-- Create tables section -------------------------------------------------

-- Table Ciudad

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
 [credito] Decimal(5,2) NULL
        --CONSTRAINT [chk-credito] CHECK (credito<2000),
 [direccionenvio] Varchar(200) NULL,
 [descuento] Decimal(5,2) NULL
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



