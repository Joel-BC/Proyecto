----------------------------------------------- Tablas  -----------------------------------------------------------
CREATE TABLE [dbo].[Roles](
	[idRol] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[nombreRol] [varchar](20) NOT NULL);

CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] PRIMARY KEY NOT NULL,
	[idTipoRol] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[clave] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
	CONSTRAINT fkTipoRol FOREIGN KEY ([idTipoRol]) REFERENCES [dbo].[Roles] ([idRol]));

CREATE TABLE [dbo].[Bitacora_Usuarios](
	[idUsuario] [int] PRIMARY KEY NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[idTipoRol] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[clave] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL);

CREATE TABLE [dbo].[Citas](
	[idCita] [int] PRIMARY KEY NOT NULL,
	[asunto] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[inicio] [datetime] NOT NULL,
	[fin] [datetime] NULL,
	[colorFondo] [nvarchar](10) NULL,
	[diaCompleto] [bit] NOT NULL);

CREATE TABLE [dbo].[Bitacora_Citas](
	[idCita] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[asunto] [nvarchar](100) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[inicio] [datetime] NOT NULL,
	[fin] [datetime] NULL,
	[colorFondo] [nvarchar](10) NULL,
	[diaCompleto] [bit] NOT NULL);

CREATE TABLE [dbo].[Proveedores](
	[idProveedor] [int] PRIMARY KEY NOT NULL,
	[nombreProveedor] [varchar](20) NOT NULL,
	[telefono] [varchar](11) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[correoElectronico] [varchar](50) NOT NULL,
	[nombreContacto] [varchar](20) NOT NULL,
	[estadoProveedor] [bit] NOT NULL);

CREATE TABLE [dbo].[Bitacora_Proveedores](
	[idProveedor] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[nombreProveedor] [varchar](20) NOT NULL,
	[telefono] [varchar](11) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[correoElectronico] [varchar](50) NOT NULL,
	[nombreContacto] [varchar](20) NOT NULL,
	[estadoProveedor] [bit] NOT NULL);

CREATE TABLE [dbo].[Bodegas](
	[idBodega] [int] PRIMARY KEY NOT NULL,
	[codigoBodega] [varchar](10) NOT NULL, 
	[nombreBodega] [varchar](100) NOT NULL);

CREATE TABLE [dbo].[Stock](
	[idStock] [int] PRIMARY KEY NOT NULL,
	[idBodega] int  NOT NULL, 
	[nombreProducto] [varchar](100) NOT NULL,
	[unidad] [int] NOT NULL,
	[codigoBodega] [varchar](10) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[estadoStock] [bit] NOT NULL,
	CONSTRAINT fkproveedor FOREIGN KEY ([idProveedor]) REFERENCES [dbo].[Proveedores] ([idProveedor]),
	CONSTRAINT fkbodega FOREIGN KEY ([idBodega]) REFERENCES [dbo].[Bodegas] ([idBodega]));

CREATE TABLE [dbo].[Bitacora_Stock](
	[idStock] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[idBodega] int  NOT NULL, 
	[nombreProducto] [varchar](100) NOT NULL,
	[unidad] [int] NOT NULL,
	[codigoBodega] [varchar](10) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[estadoStock] [bit] NOT NULL);

CREATE TABLE [dbo].[SalidaProductos](
	[idSalida] [int] PRIMARY KEY NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[codigoProducto] [varchar](10) NOT NULL,
	[nombreProducto] [varchar](100) NOT NULL,
	[unidad] [int] NOT NULL,
	[detalle] [varchar](255) NOT NULL,
	[estadoSalidaProducto] [bit] NOT NULL);

CREATE TABLE [dbo].[Bitacora_SalidaProductos](
	[idSalida] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[codigoProducto] [varchar](10) NOT NULL,
	[nombreProducto] [varchar](100) NOT NULL,
	[unidad] [int] NOT NULL,
	[detalle] [varchar](255) NOT NULL,
	[estadoSalidaProducto] [bit] NOT NULL);

CREATE TABLE [dbo].[Activos](
	[IdActivo] [int] PRIMARY KEY NOT NULL,
	[codigoActivo] [varchar](10) NOT NULL,
	[nombreActivo] [varchar](30) NOT NULL,
	[costoActivo] [decimal](18, 0) NOT NULL,
	[anno] [int] NOT NULL,
	[meses] [int] NOT NULL,
	[costoAnual] [decimal](18, 0) NOT NULL,
	[costoMensual] [decimal](18, 0) NOT NULL,
	[fechaActivo] [datetime] NOT NULL,
	[estadoActivo] [bit] NOT NULL);

CREATE TABLE [dbo].[Bitacora_Activos](
	[IdActivo] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[codigoActivo] [varchar](10) NOT NULL,
	[nombreActivo] [varchar](30) NOT NULL,
	[costoActivo] [decimal](18, 0) NOT NULL,
	[anno] [int] NOT NULL,
	[meses] [int] NOT NULL,
	[costoAnual] [decimal](18, 0) NOT NULL,
	[costoMensual] [decimal](18, 0) NOT NULL,
	[fechaActivo] [datetime] NOT NULL,
	[estadoActivo] [bit] NOT NULL);

CREATE TABLE [dbo].[Provincia](
	Cod char(1) primary key,
	Nombre varchar(50) unique);

CREATE TABLE [dbo].[Canton](
	Provincia char(1) references Provincia,
	Canton char(2),
	primary key(Provincia,Canton),
	Nombre varchar(50));

CREATE TABLE [dbo].[Distrito](
	Provincia char(1),
	Canton char(2),
	foreign key(Provincia,Canton) references Canton,
	Distrito char(2),
	primary key(Provincia,Canton,Distrito),
	Nombre varchar(50));

	CREATE TABLE [dbo].[TipoIdentificacion](
	[idTipoIdentificacion] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[tipoIdentificacion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL);

CREATE TABLE Empleado (
	[IdEmpleado] [int] NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[Direccion] [varchar](100),
	[fechaNacimiento] [datetime],
	[departamento] [varchar](30),
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Provincia] [char](1) NOT NULL,
	[Canton] [char](2) NOT NULL,
	[Distrito] [char](2) NOT NULL,
	[fechaEntrada] [datetime],
	[fechaSalida] [datetime],
	[Estado] [bit] NOT NULL,
	[estadoEmpleado] [bit] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Bitacora_Empleado] (
	[IdEmpleado] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[Direccion] [varchar](100),
	[fechaNacimiento] [datetime],
	[departamento] [varchar](30),
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Provincia] [char](1) NOT NULL,
	[Canton] [char](2) NOT NULL,
	[Distrito] [char](2) NOT NULL,
	[fechaEntrada] [datetime],
	[fechaSalida] [datetime],
	[Estado] [bit] NOT NULL,
	[estadoEmpleado] [bit] NOT NULL)
GO

CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Cedula] [varchar](10) NOT NULL,
	[Sexo] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[ApellidoP] [varchar](26) NOT NULL,
	[ApellidoM] [varchar](26) NOT NULL);


CREATE TABLE [dbo].[Departamentos](
	[idDepartamento] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[nombreDepartamento] [varchar](20) NOT NULL);

CREATE TABLE [dbo].[Sanciones](
	[idSanciones] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[fechaSancion] DateTime,
	[codigo] [varchar](10)  NOT NULL, 
	[nombre] [varchar](20) NOT NULL,
	[departamento] [varchar](30),
	[detalle] [varchar](30),
	[estadoSancion] [bit] NOT NULL,
	CONSTRAINT FK_Sanciones_Empleado FOREIGN KEY ([IdEmpleado]) REFERENCES [dbo].[Empleado] ([IdEmpleado]),
	CONSTRAINT FK_Sanciones_Departamentos FOREIGN KEY ([idDepartamento]) REFERENCES [dbo].[Departamentos] ([idDepartamento]));

CREATE TABLE [dbo].[Bitacora_Sanciones](
	[idSanciones] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[fechaSancion] DateTime,
	[codigo] [varchar](10)  NOT NULL, 
	[nombre] [varchar](20) NOT NULL,
	[departamento] [varchar](30),
	[detalle] [varchar](30),
	[estadoSancion] [bit] NOT NULL);

CREATE TABLE [dbo].[Compra](
	[idCompra] [int] PRIMARY KEY NOT NULL,
	[idColaborador] [int] NOT NULL,
	[nombreProducto] [varchar](50) NOT NULL,
	[cantidadCompra] [int] NOT NULL,
	[detalleCompra] [varchar](250) NOT NULL,
	[estadoCompra] [bit] NOT NULL
	CONSTRAINT FK_Compra_Colaborador FOREIGN KEY ([idColaborador]) REFERENCES [dbo].[Empleado] ([idEmpleado]));

CREATE TABLE [dbo].[Bitacora_Compra](
	[idCompra] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[idColaborador] [int] NOT NULL,
	[nombreProducto] [varchar](50) NOT NULL,
	[cantidadCompra] [int] NOT NULL,
	[detalleCompra] [varchar](250) NOT NULL,
	[estadoCompra] [bit] NOT NULL);

CREATE TABLE [dbo].[Cotizacion](
	[idCotizacion] [int] PRIMARY KEY NOT NULL,
	[idColaborador] [int] NOT NULL,
	[nombreProductoCotizacion] [varchar](50) NOT NULL,
	[cantidadProductoCotizacion] [int] NOT NULL,
	[detalleCotizacion] [varchar](250) NOT NULL,
	[estadoCotizacion] [bit] NOT NULL
	CONSTRAINT FK_Cotizacion_Proveedor FOREIGN KEY ([idColaborador]) REFERENCES [dbo].[Empleado] ([idEmpleado]));
	GO

CREATE TABLE [dbo].[Bitacora_Cotizacion](
	[idCotizacion] [int] PRIMARY KEY NOT NULL,
	[idUsuario] [int] NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[fechaCambio] [datetime] NOT NULL,
	[idColaborador] [int] NOT NULL,
	[nombreProductoCotizacion] [varchar](50) NOT NULL,
	[cantidadProductoCotizacion] [int] NOT NULL,
	[detalleCotizacion] [varchar](250) NOT NULL,
	[estadoCotizacion] [bit] NOT NULL);
	GO

----------------------------------------------- CRUD Usuarios ------------------------------------------------
--------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[ExisteUsuario]
@usuario as varchar(50),
@clave as varchar(50)
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from Usuarios where usuario=@usuario and clave=@clave
END
GO
----------------------------------------------- Consulta Usuario -----------------------------------------------

CREATE Procedure [dbo].[ConsultaUsuario]
@idUsuario as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Usuarios where idUsuario=@idUsuario
END
GO
----------------------------------------------- Consultar Usuario -----------------------------------------------
CREATE Procedure [dbo].[ConsultarUsuario]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Usuarios
END
GO

----------------------------------------------- CRUD Sancion -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Sancion -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarSancion]
@IdEmpleado as INT,
@idDepartamento as int,
@fechaSancion as DateTime,
@codigo as varchar (10), 
@nombre as varchar (20),
@departamento as varchar (30),
@detalle as varchar (30),
@estadoSancion as bit
AS
BEGIN

Declare @CodigoP int

Select @CodigoP=isnull(MAX(idSanciones),0)+1 from Sanciones

INSERT INTO [dbo].[Sanciones]
           ([IdEmpleado],
			[idDepartamento],
			[fechaSancion],
			[codigo], 
			[nombre],
			[departamento],
			[detalle],
			[estadoSancion])
     VALUES
           (@IdEmpleado
           ,@idDepartamento
		   ,@fechaSancion
		   ,@codigo
		   ,@nombre
		   ,@departamento
		   ,@detalle
		   ,@estadoSancion)
END		
GO

----------------------------------------------- Actualizar Sancion -----------------------------------------------

CREATE PROCEDURE [dbo].[ActualizarSancion]
@idSanciones as int,
@IdEmpleado as INT,
@idDepartamento as int,
@fechaSancion as DateTime,
@codigo as varchar (10), 
@nombre as varchar (20),
@departamento as varchar (30),
@detalle as varchar (30),
@estadoSancion as bit
AS
BEGIN

UPDATE [dbo].[Sanciones]
   SET [IdEmpleado] = @IdEmpleado
      ,[idDepartamento] = @idDepartamento
	  ,[fechaSancion] = @fechaSancion
	  ,[codigo] = @codigo
	  ,[nombre] = @nombre
	  ,[departamento] = @departamento
	  ,[detalle] = @detalle
	  ,[estadoSancion] = @estadoSancion
 WHERE idSanciones=@idSanciones
END	
GO

----------------------------------------------- Deshabilitar Sancion -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarSancion]
@idSanciones as int
AS
BEGIN
    Update [dbo].[Sanciones] set
            [estadoSancion]=0
		where idSanciones=@idSanciones
END
GO

----------------------------------------------- Consulta Sancion-----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaSancion]
@idSanciones as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sanciones where idSanciones=@idSanciones
END
GO

----------------------------------------------- Consultar Sancion -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultarSancion]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Sanciones
END
GO

----------------------------------------------- CRUD TipoIdentificacion -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar TipoIdentificacion -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarTipoIdentificacion]
@TipoIdentificacion as varchar(50),
@Estado as bit
AS
BEGIN

Declare @Codigo int

Select @Codigo=isnull(MAX(IdTipoIdentificacion),0)+1 from TipoIdentificacion

INSERT INTO [dbo].[TipoIdentificacion]
           ([IdTipoIdentificacion]
           ,[TipoIdentificacion]
           ,[Estado])
     VALUES
           (@Codigo
           ,@TipoIdentificacion
           ,@Estado)
END		
GO

----------------------------------------------- Actualizar TipoIdentificacion -----------------------------------------------

CREATE PROCEDURE [dbo].[ActualizarTipoIdentificacion]
@IdTipoIdentificacion as int,
@TipoIdentificacion as varchar(50),
@Estado as bit
AS
BEGIN

UPDATE [dbo].[TipoIdentificacion]
   SET [TipoIdentificacion] = @TipoIdentificacion
      ,[Estado] = @Estado
 WHERE IdTipoIdentificacion=@IdTipoIdentificacion
END	
GO

----------------------------------------------- Consulta TipoIdentificacion-----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaTiposIdentificacion]
@TipoIdentificacion as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from TipoIdentificacion where TipoIdentificacion=@TipoIdentificacion
END
GO

----------------------------------------------- Consultar TipoIdentificacion -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultarTiposIdentificacion]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from TipoIdentificacion
END
GO

----------------------------------------------- CRUD Cotizacion -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Cotizacion -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarCotizacion]
@idColaborador as int,
@nombreProductoCotizacion as varchar(50),
@cantidadProductoCotizacion as int,
@detalleCotizacion as varchar(250),
@estadoCotizacion as bit
AS
BEGIN

Declare @CodigoP int

Select @CodigoP=isnull(MAX(idCotizacion),0)+1 from Cotizacion

INSERT INTO [dbo].[Cotizacion]
           ([idCotizacion]
           ,[idColaborador]
           ,[nombreProductoCotizacion]
           ,[cantidadProductoCotizacion]
           ,[detalleCotizacion]
		   ,[estadoCotizacion])
     VALUES
           (@CodigoP
           ,@idColaborador
           ,@nombreProductoCotizacion
           ,@cantidadProductoCotizacion
           ,@detalleCotizacion
		   ,@estadoCotizacion)
END
GO

----------------------------------------------- Actualizar Cotizacion -----------------------------------------------

CREATE PROCEDURE [dbo].[ActualizarCotizacion]
@idCotizacion as int,
@idColaborador as int,
@nombreProductoCotizacion as varchar(50),
@cantidadProductoCotizacion as int,
@detalleCotizacion as varchar(250),
@estadoCotizacion as bit
AS
BEGIN
    Update [dbo].[Cotizacion] set
            [idColaborador]=@idColaborador
           ,[nombreProductoCotizacion]=@nombreProductoCotizacion
           ,[cantidadProductoCotizacion]=@cantidadProductoCotizacion
           ,[detalleCotizacion]=@detalleCotizacion
		   ,[estadoCotizacion]=@estadoCotizacion
		where idCotizacion=@idCotizacion
END
GO

----------------------------------------------- Deshabilitar Cotizacion -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarCotizacion]
@idCotizacion as int
AS
BEGIN
    Update [dbo].[Cotizacion] set
            [estadoCotizacion]=0
		where idCotizacion=@idCotizacion
END
GO

----------------------------------------------- Consulta Cotizacion -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaCotizacion]
@idCotizacion as int

AS
BEGIN
   Select * from Cotizacion where idCotizacion=@idCotizacion
	
END
GO

----------------------------------------------- Consultar Cotizacion -----------------------------------------------

CREATE Procedure [dbo].[ConsultarCotizacion] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Cotizacion
END
GO

----------------------------------------------- CRUD Citas ------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------------------------------------- Agregar Citas -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarCita]
@Asunto as nvarchar(100),
@Descripcion as nvarchar(200),
@Inicio as Datetime,
@Fin as DateTime,
@ColorFondo as nvarchar(200),
@DiaCompleto as bit

AS
BEGIN
Declare @Codigo int

Select @Codigo=isnull(MAX(idCita),0)+1 from Citas

    INSERT INTO Citas
           (idCita
		   ,asunto
           ,descripcion
           ,inicio
           ,fin
           ,colorFondo
           ,diaCompleto)
     VALUES
           (@Codigo
           ,@Asunto
           ,@Descripcion
           ,@Inicio
           ,@Fin
           ,@ColorFondo
		   ,@DiaCompleto)
	
END
GO

----------------------------------------------- Actualizar Citas -----------------------------------------------

CREATE PROCEDURE [dbo].[ActualizarCita]
@IdCita as int,
@Asunto as nvarchar(100),
@Descripcion as nvarchar(200),
@Inicio as Datetime,
@Fin as DateTime,
@ColorFondo as nvarchar(200),
@DiaCompleto as bit

AS
BEGIN
    Update [dbo].[Citas] set
            [asunto]=@Asunto
           ,[descripcion]=@Descripcion
           ,[inicio]=@Inicio
           ,[fin]=@Fin
           ,[colorFondo]=@ColorFondo
           ,[diaCompleto]=@DiaCompleto
		where idCita=@IdCita
END
GO
----------------------------------------------- Consulta Citas -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaCita]
@idCita as int

AS
BEGIN
   Select * from Citas where idCita=@idCita
	
END
GO

----------------------------------------------- Consultar Citas -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultarCita]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Citas
END
GO

----------------------------------------------- CRUD Roles-----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Roles -----------------------------------------------
	
----------------------------------------------- Actualizar Roles -----------------------------------------------

----------------------------------------------- Consulta Roles-----------------------------------------------

----------------------------------------------- Consultar Roles -----------------------------------------------

CREATE Procedure [dbo].[ConsultarRol]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Roles
END

----------------------------------------------- CRUD Activos ------------------------------------------------

--------------------------------------------------------------------------------------------------------------
----------------------------------------------- Agregar Activos -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarActivo]
@codigoActivo as varchar(10),
@nombreActivo as varchar(30),
@costoActivo as decimal,
@anno as int,
@meses as int, 
@fechaActivo datetime,
@estadoActivo as bit
AS
BEGIN
Declare @IdActivo int
Declare @costoAnual decimal, @costoMensual decimal
Select @IdActivo=isnull(MAX(IdActivo),0)+1 from Activos
set @costoAnual = @costoActivo / @anno;
set @costoMensual = @costoActivo / @meses;

    INSERT INTO Activos
           ([IdActivo]
		   ,codigoActivo
		   ,[nombreActivo]
           ,[costoActivo]
		   ,anno
		   ,meses
		   ,costoAnual
		   ,costoMensual
		   ,fechaActivo
		   ,estadoActivo)
     VALUES
           (@IdActivo
		   ,@codigoActivo
           ,@nombreActivo
           ,@costoActivo
           ,@anno
		   ,@meses
		   ,@costoAnual
		   ,@costoMensual
		   ,@fechaActivo
		   ,@estadoActivo)
	
END
GO

----------------------------------------------- Actualizar Activos -----------------------------------------------

CREATE Procedure [dbo].[ActualizarActivo]

@IdActivo as int,
@codigoActivo as varchar(10),
@nombreActivo as varchar(30),
@costoActivo as decimal,
@anno as int,
@meses as int, 
@fechaActivo datetime,
@estadoActivo as bit
AS
BEGIN

UPDATE [dbo].[Activos]
   SET 
		codigoActivo=@codigoActivo
      ,[nombreActivo] = @nombreActivo
      ,[costoActivo] = @costoActivo
      ,anno=@anno
	  ,meses=@meses
	  ,costoAnual=@costoActivo/@anno
	  ,costoMensual=@costoActivo/@meses
	  ,fechaActivo=@fechaActivo
	  ,estadoActivo=@estadoActivo

 WHERE IdActivo=@IdActivo
END
GO

----------------------------------------------- Deshabilitar Activo -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarActivo]
@idActivo as int
AS
BEGIN
    Update [dbo].[Activos] set
            [estadoActivo]=0
		where idActivo=@idActivo
END
GO

----------------------------------------------- Consulta Activos -----------------------------------------------

Create Procedure [dbo].[ConsultaActivo]
@idActivo as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Activos where idActivo=@idActivo
END
GO

----------------------------------------------- Consultar Activos -----------------------------------------------

Create PROCEDURE [dbo].[ConsultarActivo]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Activos
END
GO

----------------------------------------------- CRUD SalidaProductos -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar SalidaProductos -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarSalidaProducto]
@fechaSalida datetime,
@codigoProducto varchar(10),
@nombreProducto varchar(100),
@unidadSalida int,
@detalle as varchar(255),
@estadoSalidaProducto as bit

AS
BEGIN

Declare @CodigoP int
Select @CodigoP=isnull(MAX(idSalida),0)+1 from salidaProductos


	INSERT INTO salidaProductos
			(idSalida
			,fechaSalida 
			,codigoProducto
			,nombreProducto
			,unidad 
			,detalle
			,estadoSalidaProducto)
     VALUES
			(@CodigoP
			,@fechaSalida 
			,@codigoProducto 
			,@nombreProducto
			,@unidadSalida
			,@detalle
			,@estadoSalidaProducto)

	Update [dbo].[Stock] SET
          unidad=unidad - @unidadSalida
		   where codi=@codigoProducto
END
GO

----------------------------------------------- Actualizar SalidaProductos -----------------------------------------------

CREATE Procedure [dbo].[ActualizarSalidaProducto]
@idSalida as int,
@fechaSalida datetime,
@codigoProducto varchar(10),
@nombreProducto varchar(100),
@unidadSalida int,
@detalle as varchar(255),
@estadoSalidaProducto as bit
AS
BEGIN

UPDATE [dbo].[SalidaProductos]
   SET 
			
			fechaSalida = @fechaSalida,
			codigoProducto = @codigoProducto ,
			nombreProducto = @nombreProducto,
			unidad = @unidadSalida,
			detalle = @detalle,
			estadoSalidaProducto = @estadoSalidaProducto

 WHERE idSalida =@idSalida
END
GO

----------------------------------------------- Deshabilitar salida productos -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarSalidaProducto]
@idSalida as int
AS
BEGIN
    Update [dbo].[SalidaProductos] set
            [estadoSalidaProducto]=0
		where idSalida=@idSalida
END
GO

----------------------------------------------- Consulta SalidaProductos-----------------------------------------------

Create Procedure [dbo].[ConsultaSalidaProducto]
@idSalida as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from SalidaProductos where  idSalida =@idSalida
END
GO

----------------------------------------------- Consultar SalidaProductos -----------------------------------------------

Create Procedure [dbo].[ConsultarSalidaProducto]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from salidaProductos
END
GO

----------------------------------------------- CRUD Stock --------------------------------------------------
-------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Stock ------------------------------------------------

Create PROCEDURE [dbo].[AgregarStock]
@idBodega as int,
@nombreProducto as varchar(100),
@unidad as int,
@codigoBodega varchar (10),
@idProveedor int,
@estadoStock as bit

AS
BEGIN
Declare @CodigoP int
Select @CodigoP=isnull(MAX(idStock),0)+1 from Stock

    INSERT INTO [dbo].[Stock]
           ([idStock]
		   ,[idBodega]
		   ,[nombreProducto]
           ,[unidad]
		   ,[codigoBodega]
		   ,[idProveedor]
		   ,[estadoStock])
     VALUES
           (@CodigoP
		   ,@idBodega
           ,@nombreProducto
           ,@unidad
		   ,@codigoBodega
		   ,@idProveedor
		   ,@estadoStock)
END
GO

----------------------------------------------- Actualizar Stock -----------------------------------------------

Create PROCEDURE [dbo].[ActualizarStock]
@idStock as int,
@idBodega as int,
@nombreProducto as varchar(100),
@unidad as int,
@codigoBodega varchar (10),
@idProveedor int,
@estadoStock as bit

AS
BEGIN

    UPDATE [dbo].[Stock]
		SET [idBodega]=@idBodega
		   ,[nombreProducto]=@nombreProducto
           ,[unidad]=@unidad
		   ,[codigoBodega]=@codigoBodega
		   ,[idProveedor]=@idProveedor
		   ,[estadoStock]=@estadoStock
		   
  WHERE idStock=@idStock   
END
GO

----------------------------------------------- Deshabilitar Stock -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarStock]
@idStock as int
AS
BEGIN
    Update [dbo].[Stock] set
            [estadoStock]=0
		where idStock=@idStock
END
GO

----------------------------------------------- Consulta Stock -----------------------------------------------

Create Procedure [dbo].[ConsultaStock]
@idStock as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Stock where idStock=@idStock 
END
GO

----------------------------------------------- Consultar Stock -----------------------------------------------

Create  PROCEDURE [dbo].[ConsultarStock]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Stock
END
GO

----------------------------------------------- CRUD Proveedores -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Proveedores -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarProveedor]
@nombreProveedor as varchar(20),
@telefono as varchar(11),
@direccion as varchar(20),
@correoElectronico as varchar(50),
@nombreContacto as varchar(40),
@estadoProveedor as bit

AS
BEGIN

Declare @CodigoP int

Select @CodigoP=isnull(MAX(idProveedor),0)+1 from Proveedores

INSERT INTO [dbo].[Proveedores]
           ([idProveedor]
           ,[nombreProveedor]
           ,[telefono]
           ,[direccion]
           ,[correoElectronico]
		   ,[nombreContacto]
		   ,[estadoProveedor])
     VALUES
           (@CodigoP
           ,@nombreProveedor
           ,@telefono
           ,@direccion
           ,@correoElectronico
		   ,@nombreContacto
		   ,@estadoProveedor)
END
GO

----------------------------------------------- Agregar Bitacora Proveedores -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarBitacoraProveedor]
@idUsuario as int,
@nombreUsuario as varchar(50),
@fechaCambio as datetime,
@nombreProveedor as varchar(20),
@telefono as varchar(11),
@direccion as varchar(20),
@correoElectronico as varchar(50),
@nombreContacto as varchar(40),
@estadoProveedor as bit

AS
BEGIN

Declare @CodigoP int

Select @CodigoP=isnull(MAX(idProveedor),0)+1 from Proveedores

INSERT INTO [dbo].[Bitacora_Proveedores]
           ([idProveedor]
		   ,[idUsuario]
		   ,[nombreUsuario]
		   ,[fechaCambio]
           ,[nombreProveedor]
           ,[telefono]
           ,[direccion]
           ,[correoElectronico]
		   ,[nombreContacto]
		   ,[estadoProveedor])
     VALUES
           (@CodigoP
		   ,@idUsuario
		   ,@nombreUsuario
		   ,@fechaCambio
           ,@nombreProveedor
           ,@telefono
           ,@direccion
           ,@correoElectronico
		   ,@nombreContacto
		   ,@estadoProveedor)
END
GO

----------------------------------------------- Actualizar Proveedores -----------------------------------------------

CREATE Procedure [dbo].[ActualizarProveedor]
@idProveedor as int,
@nombreProveedor as varchar(20),
@telefono as varchar(20),
@direccion as varchar(20),
@correoElectronico as varchar(50),
@nombreContacto as varchar(40),
@estadoProveedor as bit
AS
BEGIN

UPDATE [dbo].[Proveedores]
   SET [nombreProveedor] = @nombreProveedor
      ,[telefono] = @telefono
      ,[direccion] = @direccion
      ,[correoElectronico] = @correoElectronico
	  ,[nombreContacto] = @nombreContacto
	  ,[estadoProveedor] = @estadoProveedor

 WHERE idProveedor=@idProveedor
END
GO

----------------------------------------------- Deshabilitar Proveedor -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarProveedor]
@idProveedor as int
AS
BEGIN
    Update [dbo].[Proveedores] set
            [estadoProveedor]=0
		where idProveedor=@idProveedor
END
GO

----------------------------------------------- Consulta Proveedores -----------------------------------------------

CREATE Procedure [dbo].[ConsultaProveedor]
@idProveedor as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Proveedores where idProveedor=@idProveedor
END
GO

----------------------------------------------- Consultar Proveedores -----------------------------------------------

CREATE Procedure [dbo].[ConsultarProveedor]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Proveedores
END
GO

----------------------------------------------- CRUD Empleado -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[AgregarEmpleado]
@IdTipoIdentificacion as int,
@Identificacion as varchar(20),
@Nombre as varchar(50),
@Apellido1 as varchar(50),
@Apellido2 as varchar(50),
@Direccion varchar(100),
@fechaNacimiento datetime,
@departamento varchar(30),
@Correo as varchar(50),
@Telefono as varchar(15),
@Provincia as char(1),
@Canton as char(2),
@Distrito as char(2),
@fechaEntrada datetime,
@fechaSalida datetime,
@Estado as bit,
@estadoEmpleado as bit
AS
BEGIN

Declare @Codigo int

Select @Codigo=isnull(MAX(IdEmpleado),0)+1 from Empleado

INSERT INTO [dbo].[Empleado]
           ([IdEmpleado]
           ,[IdTipoIdentificacion]
           ,[Identificacion]
           ,[Nombre]
           ,[Apellido1]
           ,[Apellido2]
		   ,[Direccion]
		   ,[fechaNacimiento]
		   ,[departamento]
           ,[Correo]
           ,[Telefono]
           ,[Provincia]
           ,[Canton]
           ,[Distrito]
		   ,[fechaEntrada]
		   ,[fechaSalida]
           ,[Estado]
		   ,[estadoEmpleado])
     VALUES
           (@Codigo
           ,@IdTipoIdentificacion
           ,@Identificacion
           ,@Nombre
           ,@Apellido1
           ,@Apellido2
		   ,@Direccion
		   ,@fechaNacimiento
		   ,@departamento
           ,@Correo
           ,@Telefono
           ,@Provincia
           ,@Canton
           ,@Distrito
		   ,@fechaEntrada
		   ,@fechaSalida
           ,@Estado
		   ,@estadoEmpleado)
END
GO

----------------------------------------------- Actualizar Empleado -----------------------------------------------

CREATE Procedure [dbo].[ActualizarEmpleado]
@IdEmpleado as int,
@IdTipoIdentificacion as int,
@Identificacion as varchar(20),
@Nombre as varchar(50),
@Apellido1 as varchar(50),
@Apellido2 as varchar(50),
@Direccion as varchar(100),
@fechaNacimiento as datetime,
@departamento as varchar(30),
@Correo as varchar(50),
@Telefono as varchar(15),
@Provincia as char(1),
@Canton as char(2),
@Distrito as char(2),
@fechaEntrada as datetime,
@fechaSalida as datetime,
@Estado as bit,
@estadoEmpleado as bit
AS
BEGIN

UPDATE [dbo].[Empleado]
   SET [IdTipoIdentificacion] = @IdTipoIdentificacion
      ,[Identificacion] = @Identificacion
      ,[Nombre] = @Nombre
      ,[Apellido1] = @Apellido1
      ,[Apellido2] = @Apellido2
	  ,[Direccion] = @Direccion
	  ,[fechaNacimiento] = @fechaNacimiento
	  ,[departamento] = @departamento
      ,[Correo] = @Correo
      ,[Telefono] = @Telefono
      ,[Provincia] = @Provincia
      ,[Canton] = @Canton
      ,[Distrito] = @Distrito
	  ,[fechaEntrada] = @fechaEntrada
	  ,[fechaSalida] = @fechaSalida
      ,[Estado] = @Estado
	  ,[estadoEmpleado] = @estadoEmpleado

 WHERE IdEmpleado=@IdEmpleado
END
GO

----------------------------------------------- Deshabilitar Empleado -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarEmpleado]
@IdEmpleado as int
AS
BEGIN
    Update [dbo].[Empleado] set
            [estadoEmpleado]=0
		where IdEmpleado=@IdEmpleado
END
GO

----------------------------------------------- Consulta Empleado -----------------------------------------------

CREATE Procedure [dbo].[ConsultaEmpleado]
@IdEmpleado as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Empleado where IdEmpleado=@IdEmpleado
END

----------------------------------------------- Consultar Empleado -----------------------------------------------

CREATE Procedure [dbo].[ConsultarEmpleado]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Empleado
END

----------------------------------------------- CRUD Persona -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Persona -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarPersona]
@Cedula varchar(10),
@Sexo int,
@Nombre varchar(30),
@ApellidoP varchar(26),
@ApellidoM varchar(26)

AS
BEGIN
	
	Declare @Codigo int;

	if exists (SELECT * from Persona where Cedula=@Cedula)
	Begin
		update persona set
			sexo=@Sexo,
			Nombre=@Nombre,
			ApellidoP=@ApellidoP,
			ApellidoM=@ApellidoM
		where Cedula=@Cedula
	end else
	Begin
		
		Select @Codigo=isnull(MAX(IdPersona),0)+1 from Persona
		
		insert INTO Persona (IdPersona,Cedula,Sexo,Nombre,ApellidoP,ApellidoM) 
		values (@Codigo,@Cedula,@Sexo,@Nombre,@ApellidoP,@ApellidoM)
	END
END

----------------------------------------------- Consulta Persona -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaPersona]
@Cedula varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Persona where Cedula=@Cedula
END

----------------------------------------------- CRUD Compra -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Agregar Compra -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarCompra]
@idColaborador as int,
@nombreProducto as varchar(50),
@cantidadCompra as int,
@detalleCompra as varchar(350),
@estadoCompra as bit
AS
BEGIN

Declare @Codigo int

Select @Codigo=isnull(MAX(idCompra),0)+1 from Compra

INSERT INTO [dbo].[Compra]
           ([idCompra]
		   ,[idColaborador]
           ,[nombreProducto]
           ,[cantidadCompra]
           ,[detalleCompra]
		   ,[estadoCompra])
     VALUES
           (@Codigo
		   ,@idColaborador
           ,@nombreProducto
           ,@cantidadCompra
           ,@detalleCompra
		   ,@estadoCompra)
END
GO

----------------------------------------------- Actualizar Compra -----------------------------------------------

CREATE PROCEDURE [dbo].[ActualizarCompra]
@idCompra as int,
@idColaborador as int,
@detalleCompra as varchar(50),
@cantidadCompra as int,
@pesoCompra as decimal,
@fechaCompra as datetime
AS
BEGIN
    Update [dbo].[Compra] set
			[idColaborador]=@idColaborador
           ,[detalleCompra]=@detalleCompra
           ,[cantidadCompra]=@cantidadCompra
           ,[pesoCompra]=@pesoCompra
           ,[fechaCompra]=@fechaCompra
		where idCompra=@idCompra
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------- Deshabilitar Compra -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarCompra]
@idCompra as int
AS
BEGIN
    Update [dbo].[Compra] set
            [estadoCompra]=0
		where idCompra=@idCompra
END
GO

----------------------------------------------- Consulta Compra -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaCompra]
@idCompra as int

AS
BEGIN
   Select * from Compra where idCompra=@idCompra
	
END
GO

----------------------------------------------- Consultar Compra -----------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ConsultarCompra] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Compra
END

----------------------------------------------- CRUD Provincia -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[Provincias]
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from Provincia order by Cod
END

----------------------------------------------- Consulta Provincia -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaProvincia]
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from Provincia order by cod
END

----------------------------------------------- CRUD Cantones -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[Cantones]
@Provincia as char(1)
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from Canton where Provincia=@Provincia order by Provincia,Canton 
END

----------------------------------------------- Consulta Cantones -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaCanton]
@provincia as char(1)
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from Canton where provincia=@provincia order by provincia,canton
END

----------------------------------------------- CRUD Distrito -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[Distritos]
@Provincia as char(1),
@Canton as char(2)
AS
BEGIN

    -- Insert statements for procedure here
	SELECT * from Distrito where Provincia=@Provincia and Canton=@Canton order by Provincia,Canton,Distrito
END

----------------------------------------------- Agregar Usuario -----------------------------------------------

CREATE PROCEDURE [dbo].[AgregarUsuario]
@idTipoRol as int,
@usuario as varchar(50),
@clave as varchar(50),
@estado as bit
AS
BEGIN

Declare @Codigo int

Select @Codigo=isnull(MAX(idUsuario),0)+1 from Usuarios

INSERT INTO [dbo].[Usuarios]
           ([idUsuario]
		   ,[idTipoRol]
           ,[usuario]
           ,[clave]
           ,[estado])
     VALUES
           (@Codigo
		   ,@idTipoRol
           ,@usuario
           ,@clave
           ,@estado)
END
GO


----------------------------------------------- Actualizar editar usuario -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEditarUsuario]
@idUsuario as int,
@idTipoRol as int,
@usuario as varchar(50),
@clave as varchar(50),
@estado as bit
AS
BEGIN
    Update [dbo].[Usuarios] set
			idUsuario=@idUsuario,
			idTipoRol=@idTipoRol,
			usuario=@usuario,
			clave=@clave,
			estado=@estado
		where usuario=@usuario
END
GO

----------------------------------------------- Actualizar usuario -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarUsuario]
@usuario as varchar(50),
@clave as varchar(50)
AS
BEGIN
    Update [dbo].[Usuarios] set
			clave=@clave            
		where usuario=@usuario
END
GO

----------------------------------------------- Deshabilitar usuario -----------------------------------------------

CREATE PROCEDURE [dbo].[DeshabilitarUsuario]
@idUsuario as int
AS
BEGIN
    Update [dbo].[Usuarios] set
            [estado]=0
		where idUsuario=@idUsuario
END
GO

----------------------------------------------- Consultar nombre bodega -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ConsultarNombreBodega] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT codigoBodega, nombreBodega from Bodegas
END
GO

----------------------------------------------- Consultar id bodega -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultaIdBodega]
@codigoBodega as varchar(10)
AS
BEGIN

	Declare @ID int

	Select @ID=idBodega from Bodegas where codigoBodega=@codigoBodega
    return @ID
END
GO

----------------------------------------------- Consultar correo proveedor -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ConsultarCorreoProveedor] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT nombreProveedor, correoElectronico from Proveedores
	WHERE estadoProveedor = 1;
END
GO

----------------------------------------------- Consultar id proveedor -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ConsultarIdProveedor] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT nombreProveedor, idProveedor from Proveedores
	WHERE estadoProveedor = 1;
END
GO

----------------------------------------------- Consultar estado usuario -----------------------------------------------
--------------------------------------------------------------------------------------------------------------

----------------------------------------------- Consultar Id usuarios -----------------------------------------------

CREATE PROCEDURE [dbo].[ConsultarIdUsuario]
@usuario as varchar(10)
AS
BEGIN

	Declare @ID int

	Select @ID=idUsuario from Usuarios where usuario=@usuario
    return @ID
END
GO

----------------------------------------------- Consultar usuarios -----------------------------------------------

CREATE PROCEDURE ConsultarEstadoUsuario  
@usuario as varchar(50)  
AS
BEGIN
    if  ((Select estado from Usuarios where usuario=@usuario) = 1)
   RETURN 1  
   ELSE
   if  ((Select estado from Usuarios where usuario=@usuario) = 0)
   RETURN 0 
END
GO

----------------------------------------------- Consultar rol usuario -----------------------------------------------
--------------------------------------------------------------------------------------------------------------


----------------------------------------------- Consultar roles -----------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ConsultarRoles] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT nombreRol, idRol from Roles
END

----------------------------------------------- Consultar usuarios -----------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ConsultarUsuarios] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Usuarios
END

----------------------------------------------- Consultar usuarios -----------------------------------------------

CREATE PROCEDURE ConsultarRolUsuario  
@usuario as varchar(50)  

AS
BEGIN
   if  ((Select idTipoRol from Usuarios where usuario=@usuario) = 1)
   RETURN 1  
   ELSE
   if  ((Select idTipoRol from Usuarios where usuario=@usuario) = 2)
   RETURN 2  
   ELSE
   if  ((Select idTipoRol from Usuarios where usuario=@usuario) = 3)
   RETURN 3  
END
GO
---------------------------------------------------- API Padron Electoral ----------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Padron 
(cedula varchar (10),
direc varchar (10),
sexo int,
fecha varchar(20),
cero varchar (10),
nombre varchar (30),
apellidoP varchar (26),
apellidoM varchar (26));

BULK
INSERT Padron
FROM 'C:\Users\Valery\Desktop\Padron\PADRON_COMPLETO.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
GO
	CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Cedula] [varchar](10) NOT NULL,
	[Sexo] [int] NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[ApellidoP] [varchar](26) NOT NULL,
	[ApellidoM] [varchar](26) NOT NULL);

INSERT INTO Persona( Cedula, Sexo, Nombre, ApellidoP, ApellidoM )
SELECT cedula, sexo,nombre, apellidoP, apellidoM FROM Padron

select * from Padron
select * from Persona

---------------------------------------------------- insertar roles ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

insert into Roles values (1, 'Admin');
insert into Roles values (2, 'Regular');
insert into Roles values (3, 'Bodega');

---------------------------------------------------- insertar bodegas ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

insert into Bodegas values (1, 'B-1', 'Bodega 1');
insert into Bodegas values (2, 'B-2', 'Bodega 2');
insert into Bodegas values (3, 'B-3', 'Bodega 3');

---------------------------------------------------- insertar departamentos ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

insert into Departamentos values ('Bodega');

---------------------------------------------------- SELECT ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

SELECT * FROM Colaboradores
SELECT * FROM Empleado;
SELECT * FROM Persona
SELECT * FROM Usuarios 
SELECT * FROM Citas
SELECT * FROM TipoIdentificacion
select * from Proveedores
select * from Stock
select * from Bodegas
select * from SalidaProductos
select * from Roles


-- Para hacer que la parte de enviar correos de ordenes de compra funcione, hay que insertar un empleado en la base de datos y
--poner el id del empleado en el campo especificado:

insert into TipoIdentificacion values
('Nacional', 1);

insert into Empleado values
(1, '123', 'Joel','Bejarano','Cubero',1,'San José','2020-10-10 10:10:10','bodega','loquesea@hotmail.com', '888888888', 'a','a','a','2020-10-10 10:10:10','2020-10-10 10:10:10'
,1);

