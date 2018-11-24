alter table catalogo.cliente
drop constraint [chk-credito]
go
ALTER TABLE [catalogo].[Cliente] 
ADD CONSTRAINT [chk-credito] CHECK (credito<2200)
