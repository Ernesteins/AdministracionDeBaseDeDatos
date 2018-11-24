use pedidos
go
create schema catalogo
go
create schema movimiento
go
CREATE TABLE [catalogo.Ciudad]
(
 [cod_cuidad] Char(3) NOT NULL,
 [nombre] Varchar(20) NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo.Cliente]
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
ON [Secundario]
go

CREATE TABLE [catalogo.Producto]
(
 [cod_producto] Char(3) NOT NULL,
 [nombre] Varchar(200) NULL
)
ON [Secundario]
go

CREATE TABLE [movimiento.CabeceraP]
(
 [fecha] Date NULL,
 [montoTotal] Decimal(7,2) NULL,
 [cod_pedido] Char(3) NOT NULL,
 [cod_cliente] Char(3) NOT NULL
)
ON [Primary]
go

CREATE TABLE [movimiento.DetalleP]
(
 [numlinea] Smallint NOT NULL,
 [precioUnit] Char(1) NULL,
 [cantidad] Char(1) NULL,
 [cod_producto] Char(3) NOT NULL,
 [cod_pedido] Char(3) NOT NULL
)
ON [Primary]
go


CREATE TABLE [catalogo.Proveedor]
(
 [codigo] Char(3) NOT NULL,
 [nombre] Varchar(20) NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo.Telefono]
(
 [numero] Char(10) NOT NULL,
 [codigo] Char(3) NOT NULL
)
ON [Secundario]
go

CREATE TABLE [catalogo.provee]
(
 [cod_producto] Char(3) NOT NULL,
 [codigo] Char(3) NOT NULL,
 [stock] Int NULL
)
ON [Secundario]
go
