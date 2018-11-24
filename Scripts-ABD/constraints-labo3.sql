-- Add keys for table Ciudad

ALTER TABLE [catalogo].[Ciudad] ADD CONSTRAINT [PK_Ciudad] PRIMARY KEY ([cod_cuidad])
go

-- Table Cliente


-- Create indexes for table Cliente

CREATE INDEX [IX_Relationship18] ON [catalogo].[Cliente] ([cod_cuidad])
go

CREATE INDEX [IX_Relationship19] ON [catalogo].[Cliente] ([garante])
go

-- Add keys for table Cliente

ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [PK_Cliente] PRIMARY KEY ([cod_cliente])
go
ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [chk-credito] CHECK (credito<2000)
go
ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [chk-descuento] CHECK (0 < descuento < 100)
go

-- Table Producto

-- Add keys for table Producto

ALTER TABLE [catalogo].[Producto] ADD CONSTRAINT [PK_Producto] PRIMARY KEY ([cod_producto])
go

-- Table CabeceraP

-- Create indexes for table CabeceraP

CREATE INDEX [IX_Relationship15] ON [movimiento].[CabeceraP] ([cod_cliente])
go

-- Add keys for table CabeceraP

ALTER TABLE [movimiento].[CabeceraP] ADD CONSTRAINT [PK_CabeceraP] PRIMARY KEY ([cod_pedido])
go

-- Table DetalleP

-- Create indexes for table DetalleP

CREATE INDEX [IX_Relationship8] ON [movimiento].[DetalleP] ([cod_producto])
go

-- Add keys for table DetalleP

ALTER TABLE [movimiento].[DetalleP] ADD CONSTRAINT [PK_DetalleP] PRIMARY KEY ([cod_pedido],[numlinea])
go

-- Table Proveedor

-- Add keys for table Proveedor

ALTER TABLE [catalogo].[Proveedor] ADD CONSTRAINT [PK_Proveedor] PRIMARY KEY ([codigo])
go

-- Table Telefono

-- Add keys for table Telefono

ALTER TABLE [catalogo].[Telefono] ADD CONSTRAINT [PK_Telefono] PRIMARY KEY ([numero],[codigo])
go

-- Table provee

-- Add keys for table provee

ALTER TABLE [catalogo].[provee] ADD CONSTRAINT [PK_provee] PRIMARY KEY ([cod_producto],[codigo])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [catalogo].[Telefono] ADD CONSTRAINT [Posee] FOREIGN KEY ([codigo]) REFERENCES [catalogo].[Proveedor] ([codigo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [movimiento].[DetalleP] ADD CONSTRAINT [Pertenece] FOREIGN KEY ([cod_producto]) REFERENCES [catalogo].[Producto] ([cod_producto]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [catalogo].[provee] ADD CONSTRAINT [Proveido] FOREIGN KEY ([cod_producto]) REFERENCES [catalogo].[Producto] ([cod_producto]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [catalogo].[provee] ADD CONSTRAINT [ProveedorR] FOREIGN KEY ([codigo]) REFERENCES [catalogo].[Proveedor] ([codigo]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [movimiento].[DetalleP] ADD CONSTRAINT [Tiene] FOREIGN KEY ([cod_pedido]) REFERENCES [movimiento].[CabeceraP] ([cod_pedido]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [movimiento].[CabeceraP] ADD CONSTRAINT [Solicita] FOREIGN KEY ([cod_cliente]) REFERENCES [catalogo].[Cliente] ([cod_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [Ubica] FOREIGN KEY ([cod_cuidad]) REFERENCES [catalogo].[Ciudad] ([cod_cuidad]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [catalogo].[Cliente] ADD CONSTRAINT [debetener] FOREIGN KEY ([garante]) REFERENCES [catalogo].[Cliente] ([cod_cliente]) ON UPDATE NO ACTION ON DELETE NO ACTION NOT FOR REPLICATION
go
