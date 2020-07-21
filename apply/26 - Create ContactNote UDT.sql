USE AddressBook;

CREATE TYPE dbo.ContactNote
AS TABLE
(
 ContactId		INT,
 Note			VARCHAR(200)
);

GO