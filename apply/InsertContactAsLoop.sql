USE Mercato1

GO

ALTER PROCEDURE InsertContact
(
 @FirstName			VARCHAR(40),
 @LastName			VARCHAR(40),
 @Note				NOTE READONLY,
 @ContactId			INT		= NULL		OUTPUT
)
AS
BEGIN

SET NOCOUNT ON

DECLARE @TempNotes		TABLE (NoteId	INT IDENTITY(1,1), Note		VARCHAR(200), IsProcessed BIT DEFAULT (0))
DECLARE @Counter		INT,
		@Index			INT,
		@NoteId			INT

SELECT @ContactId = ContactId FROM Contacts WHERE FirstName = @FirstName AND LastName = @LastName

IF (@ContactId IS NULL)
 BEGIN

	INSERT INTO Contacts (FirstName, LastName) VALUES (@FirstName, @LastName)

	SELECT	@ContactId = SCOPE_IDENTITY()

 END

INSERT INTO @TempNotes (Note)
	SELECT Note FROM @Note

SELECT	@Counter = COUNT(*),
		@Index	 = 0
FROM @TempNotes

DELETE FROM @TempNotes 
	WHERE LTRIM(RTRIM(COALESCE(Note, ''))) = ''

DELETE TN FROM @TempNotes TN
	WHERE EXISTS (SELECT 1 FROM ContactNotes WHERE Note = TN.Note AND ContactId =  @ContactId)

INSERT INTO ContactNotes (ContactId, Note)
	SELECT @ContactId, Note
		FROM @TempNotes

--IF (LTRIM(RTRIM(COALESCE(@Note, ''))) != ''
--	AND NOT EXISTS (SELECT 1 FROM ContactNotes WHERE Note = @Note AND ContactId = @ContactId))
-- BEGIN
--	INSERT INTO ContactNotes (ContactId, Note) VALUES (@ContactId, @Note)
-- END

SELECT @ContactId AS ContactId

SET NOCOUNT OFF

END

--public void Update(string fName, string lName)
--{
--   int x = 0;
--}

