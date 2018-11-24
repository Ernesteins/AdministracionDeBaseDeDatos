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
go
	
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
 [credito] Money NULL,
        --CONSTRAINT [chk-credito] CHECK (credito<2000),
 [direccionenvio] Varchar(200) NULL,
 [descuento] Decimal(4,2) NULL,
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
 [montoTotal] Money NULL,
 [cod_pedido] Char(3) NOT NULL,
 [cod_cliente] Char(3) NOT NULL
)
ON [Primary]
go

CREATE TABLE [movimiento].[DetalleP]
(
 [numlinea] Smallint NOT NULL,
 [precioUnit] Money NULL,
 [cantidad] Int NULL,
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
values(1,10.5,5,'P01','PD1')
INSERT INTO [movimiento].[DETALLEP]
values(2,10.5,5,'P01','PD1')
INSERT INTO [movimiento].[DETALLEP]
values(1,10.5,5,'P02','PD2')
INSERT INTO [movimiento].[DETALLEP]
values(1,10.5,5,'P03','PD3')
INSERT INTO [movimiento].[DETALLEP]
values(1,10.5,5,'P04','PD4')
INSERT INTO [movimiento].[DETALLEP]
values(1,10.5,5,'P05','PD5')
INSERT INTO [movimiento].[DETALLEP]
values(1,10.5,5,'P05','PD1')
select * from movimiento.detallep

select * from [movimiento].[CuerpoCabeceraP]

CREATE TABLE [movimiento].[CuerpoCabeceraP]
(
 [cod_producto] Char(3) NOT NULL,
 [cod_pedido] Char(3) NOT NULL,
 [cod_cliente] Char(3) NOT NULL,
 [fecha] Date NULL,
 [montoTotal] Money NULL,
 [numlinea] Smallint NOT NULL,
 [precioUnit] Money NULL,
 [cantidad] Int NULL,
)
ON [Primary]
go

create procedure sp_insertar_cuerpocabecera
@AC_cod_producto Char(3),
@AC_cod_pedido Char(3),
@AC_cod_cliente Char(3),
@AD_fecha Date,
@AM_montoTotal Money,
@AI_numlinea Smallint,
@AM_precioUnit Money,
@AI_cantidad Int
AS 
BEGIN

	IF EXISTS (SELECT TOP 1 1 FROM [movimiento].[CuerpoCabeceraP] WHERE cod_pedido = @AC_cod_pedido and numlinea = @AI_numlinea)
	BEGIN
		UPDATE [movimiento].[CuerpoCabeceraP]
		SET
		cod_producto = @AC_cod_producto,
		cod_pedido = @AC_cod_pedido,
		cod_cliente = @AC_cod_cliente,
		fecha = @AD_fecha,
		montoTotal = @AM_montoTotal,
		numlinea = @AI_numlinea,
		precioUnit = @AM_precioUnit,
		cantidad = @AI_cantidad
		WHERE cod_pedido = @AC_cod_pedido and numlinea = @AI_numlinea 
	END
	ELSE
		BEGIN
		insert into [movimiento].[CuerpoCabeceraP] values (@AC_cod_producto, @AC_cod_pedido, @AC_cod_cliente, @AD_fecha, @AM_montoTotal, @AI_numlinea, @AM_precioUnit, @AI_cantidad)
		END
END
 
CREATE TRIGGER [movimiento].[tg_insertar_DETALLEP]
on [movimiento].[DETALLEP]
AFTER INSERT, UPDATE
AS
BEGIN
	
	DECLARE @LV_codPed char(3), @LD_fecha DATE, @LM_montoTotal MONEY, @LV_codCli CHAR(3), @LI_numLinea INT, @LM_precioU MONEY, @LI_cantidad INT,@LV_codPro CHAR(3)
	
	DECLARE Cursor1 CURSOR FOR SELECT inserted.cod_pedido, fecha, montoTotal, cod_cliente, numLinea, precioUnit, cantidad, cod_producto FROM inserted, [movimiento].[CABECERAP] where inserted.cod_pedido = CABECERAP.cod_pedido
	OPEN Cursor1
	FETCH NEXT FROM Cursor1 INTO @LV_codPed, @LD_fecha, @LM_montoTotal, @LV_codCli, @LI_numLinea, @LM_precioU, @LI_cantidad,@LV_codPro
	WHILE @@fetch_status = 0
	BEGIN
		
		exec [dbo].[sp_insertar_cuerpocabecera] @AC_cod_pedido = @LV_codPed, @AD_fecha = @LD_fecha, @AM_montoTotal = @LM_montoTotal, @AC_cod_cliente = @LV_codCli, @AI_numLinea = @LI_numLinea,  @AM_precioUnit = @LM_precioU, @AI_cantidad = @LI_cantidad, @AC_cod_producto = @LV_codPro
		

		FETCH NEXT FROM Cursor1 INTO @LV_codPed, @LD_fecha, @LM_montoTotal, @LV_codCli, @LI_numLinea, @LM_precioU, @LI_cantidad,@LV_codPro
	END
	CLOSE Cursor1
	DEALLOCATE Cursor1

END
GO


INSERT INTO [movimiento].[DETALLEP]
values(3,10.5,5,'P05','PD1')
select * from [movimiento].[CuerpoCabeceraP]
select * from movimiento.CabeceraP
