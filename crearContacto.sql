USE Agenda;

DROP PROCEDURE IF EXISTS dbo.CrearContacto;

GO

CREATE PROCEDURE dbo.CrearContacto
(
    @Id					INT,
    @Nombre				VARCHAR(100),
    @FechaNacimiento	DATE,
	@Telefono			VARCHAR(9),
	@Observaciones		VARCHAR(500),
	@Imagen				VARCHAR(MAX)
)
AS
BEGIN;

	SET NOCOUNT ON;

    BEGIN TRANSACTION;

		BEGIN TRY

			INSERT INTO Contactos (Nombre, FechaNacimiento, Telefono, Observaciones, Imagen)
			VALUES (@Nombre, @FechaNacimiento, @Telefono, @Observaciones, @Imagen);

			COMMIT;

		END TRY
		BEGIN CATCH

			ROLLBACK;
			RAISERROR('Error creating contact. Transaction rolled back.', 16, 1);

		END CATCH;
END;
