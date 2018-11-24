--I. Eliminar las relaciones de la tabla Cliente
sp_help [movimiento.pagos]
alter table movimiento.pagos drop constraint FK_pagos_cliente

sp_help [movimiento.deudor]
alter table movimiento.deudor drop constraint FK_deudor_cliente

sp_help [movimiento.cabeceraP]
alter table movimiento.cabeceraP drop constraint Solicita  /*Eliminado cabeceraP*/

sp_help[catalogo.cliente]
alter table catalogo.cliente drop constraint PK_Cliente/*eliminado PK*/
alter table catalogo.cliente drop constraint debetener /*eliminado garante*/

drop index IX_Relationship19 on catalogo.cliente
drop index IX_Relationship15 on movimiento.cabeceraP

-- II.	Alterar la columna
alter table catalogo.cliente alter column garante varchar(6)
alter table catalogo.cliente alter column cod_cliente varchar(6) NOT NULL
alter table movimiento.cabeceraP alter column cod_cliente varchar(6)
alter table movimiento.deudor alter column garante varchar(6)
alter table movimiento.deudor alter column cod_cliente varchar(6)
alter table movimiento.pagos alter column cod_cliente varchar(6)

--III.	Actualizar los registros existentes
create table #tmp(
cod_cliente varchar(3),
nuevo_cod varchar(7))

insert into #tmp
select cod_cliente, CONCAT( SUBSTRING(cod_cliente, 1, 1), '0000', SUBSTRING(cod_cliente, 3,3))
from catalogo.CLIENTE

UPDATE
    Table_A
SET
    Table_A.cod_cliente = Table_B.nuevo_cod
FROM
    catalogo.CLIENTE as Table_A
    INNER JOIN #tmp AS Table_B
        ON Table_A.cod_cliente = Table_B.cod_cliente

--IV.	Crear las relaciones nuevamente
ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY ([cod_cliente])
CREATE INDEX [IX_Relationship19] ON [catalogo].[Cliente] ([garante])
CREATE INDEX [IX_Relationship15] ON [movimiento].[CabeceraP] ([cod_cliente])
ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [debetener] FOREIGN KEY ([garante]) REFERENCES [catalogo].[Cliente] ([cod_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION NOT FOR REPLICATION
ALTER TABLE [movimiento].[CabeceraP] ADD CONSTRAINT [Solicita] FOREIGN KEY ([cod_cliente]) REFERENCES [catalogo].[Cliente] ([cod_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION
alter table movimiento.deudor add CONSTRAINT [FK_deudor_cliente] foreign key(cod_cliente) references catalogo.cliente(cod_cliente)
alter table movimiento.pagos  add CONSTRAINT [FK_pagos_cliente]  foreign key(cod_cliente) references catalogo.cliente(cod_cliente)