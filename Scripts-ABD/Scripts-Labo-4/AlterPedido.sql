alter table movimiento.detalleP
drop constraint Tiene
go
alter table movimiento.detalleP
drop constraint PK_DetalleP
go
alter table movimiento.cabeceraP
drop constraint PK_CabeceraP
go
alter table movimiento.detalleP
alter column cod_pedido varchar(10) NOT NULL
go
alter table movimiento.cabeceraP
alter column cod_pedido varchar(10) NOT NULL


update movimiento.CabeceraP
set cod_pedido = 'PE00000003'
where cod_pedido = 'PD3'

select * from movimiento.CabeceraP
select * from movimiento.DetalleP

ALTER TABLE [movimiento].[CabeceraP] ADD CONSTRAINT [PK_CabeceraP] PRIMARY KEY ([cod_pedido])
go
ALTER TABLE [movimiento].[DetalleP] ADD CONSTRAINT [PK_DetalleP] PRIMARY KEY ([cod_pedido],[numlinea])
go
ALTER TABLE [movimiento].[DetalleP] ADD CONSTRAINT [Tiene] FOREIGN KEY ([cod_pedido]) REFERENCES [movimiento].[CabeceraP] ([cod_pedido]) ON UPDATE NO ACTION ON DELETE NO ACTION
go