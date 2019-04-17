CREATE DATABASE db_library2test

USE db_library2test

CREATE TABLE tbl_libraryBranch (
	libraryBranch_id INT PRIMARY KEY NOT NULL,
	libraryBranch_name VARCHAR (50) NOT NULL,
	libraryBranch_address VARCHAR (150)NOT NULL,
);

INSERT INTO tbl_libraryBranch
	(libraryBranch_id, libraryBranch_name, libraryBranch_address)
	VALUES 
	('424', 'Sharpstown', '7660 Clarewood Dr'),
	('221', 'Louisville', '951 Spruce St'),
	('785', 'Springfield', '5655 Jillson St'),
	('623', 'Rosewood', '7152 Gainsway Ave'),
	('592', 'Central', '8821 Fairview St')
;
SELECT * FROM tbl_libraryBranch;

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR (50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR (150) NOT NULL,
	publisher_phone VARCHAR (12) NOT NULL
); 

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES 
	('Reuters', '333 Bay Street', '646-223-4000'),
	('Random House', '400 Hahn Rd', '410-848-1900'),
	('Wolters', '2 Pennsylvania Plaza', '212-594-3342')
;
SELECT * FROM tbl_publisher;

CREATE TABLE tbl_books (
	bookId INT PRIMARY KEY NOT NULL,
	books_title VARCHAR (50) NOT NULL,
	books_publisherName VARCHAR (50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
); 

INSERT INTO tbl_books
	(bookId, books_title, books_publisherName)
	VALUES
	('116324', 'The Lost Tribe', 'Reuters'),
	('201147', 'Needful Things', 'Random House'),
	('102966', 'The Shining', 'Wolters'),
	('145475', 'To Kill a Mockingbird', 'Wolters'),
	('245682', 'Animal Farm', 'Reuters'),
	('145977', 'The Great Gatsby', 'Reuters'),
	('265478', 'Me Before You', 'Random House'),
	('234741', 'The Greatest Salesman in the World', 'Wolters'),
	('225797', 'Night Circus', 'Random House'),
	('197544', 'Water for Elephants', 'Reuters'),
	('124568', 'The Leftovers', 'Reuters'),
	('118812', 'The Help', 'Random House'),
	('174586', 'Room', 'Wolters'),
	('121156', 'Beneath a Marble Sky', 'Wolters'),
	('208357', 'A Dogs Purpose', 'Reuters'),
	('211849', 'Gone Girl', 'Reuters'),
	('237911', 'Harry Potter and the Sorcerers Stone', 'Random House'),
	('100045', 'The Girl with the Dragon Tattoo', 'Wolters'),
	('187413', 'Blessings', 'Random House'),
	('154742', 'The Amityville Horror', 'Reuters')
;
SELECT * FROM tbl_books;

CREATE TABLE tbl_bookAuthor (
	bookAuthor_id INT PRIMARY KEY NOT NULL CONSTRAINT fk_bookId FOREIGN KEY REFERENCES tbl_books(bookId) ON UPDATE CASCADE ON DELETE CASCADE,
	bookAuthor_authorName VARCHAR (50) NOT NULL,
); 

INSERT INTO tbl_bookAuthor
	(bookAuthor_id, bookAuthor_authorName)
	VALUES
	('116324', 'Lee, Mark W.'),
	('201147', 'King, Stephen'),
	('102966', 'King, Stephen'),
	('145475', 'Lee, Harper'),
	('245682', 'Orwell, George'),
	('145977', 'Fitzgerald, F. Scott'),
	('265478', 'Moyes, Jojo'),
	('234741', 'Mandino, Og'),
	('225797', 'Morgenstern, Erin'),
	('197544', 'Gruen, Sarah'),
	('124568', 'Perrotta, Tom'),
	('118812', 'Stockett, Kathryn'),
	('174586', 'Donoghue, Emma'),
	('121156', 'Shors, John'),
	('208357', 'Cameron, W. Bruce'),
	('211849', 'Flynn, Jillian'),
	('237911', 'Rowling, J.K.'),
	('100045', 'Larsson, Stieg'),
	('187413', 'Quindlen, Anna'),
	('154742', 'Anson, Jay')
;
SELECT * FROM tbl_bookAuthor;

CREATE TABLE tbl_borrower (
	borrower_cardNo BIGINT PRIMARY KEY NOT NULL,
	borrower_name VARCHAR (50) NOT NULL,
	borrower_address VARCHAR (150) NOT NULL,
	borrower_phone VARCHAR (12) NOT NULL
); 

INSERT INTO tbl_borrower
	(borrower_cardNo, borrower_name, borrower_address, borrower_phone)
	VALUES
	('59289896342938', 'Smith, Jane', '4 Randall Mill St.', '601-276-9192'), 
	('82354308927148', 'Thomas, Susan', '437 E. Creekside Dr.', '349-975-1282'), 
	('64337576896103', 'Stines, Rudy', '368 Park St.', '603-914-2754'), 
	('72767230882694', 'Doss, Angela', '133 Bedford Lane', '288-991-5681'), 
	('32434129068226', 'Doom, Bronson', '411 Low River Ave.', '731-734-3496'), 
	('38252526820792', 'Pratt,  Sarah', '12 Edgewater St.', '990-273-9065'), 
	('16857647514452', 'Collins, Faun', '8250 Rockville Ave.', '322-923-0001'), 
	('51618163986036', 'Riggin, Nathan', '9576 Old Riverview St.', '545-681-6706')
;
SELECT * FROM tbl_borrower;

CREATE TABLE tbl_bookLoans (
	bookLoans_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookLoans_bookId INT NOT NULL CONSTRAINT fk_bookLoans_bId FOREIGN KEY REFERENCES tbl_books(bookId) ON UPDATE CASCADE ON DELETE CASCADE,
	bookLoans_branchId INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_libraryBranch(libraryBranch_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	bookLoans_cardNo BIGINT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	bookLoans_dateOut VARCHAR (10) NOT NULL,
	bookLoans_dateDue VARCHAR (10) NOT NULL
); 

INSERT INTO tbl_bookLoans
	(bookLoans_bookId, bookLoans_branchId, bookLoans_cardNo, bookLoans_dateOut, bookLoans_dateDue)
	VALUES
	('116324','424','59289896342938','11/4/2018','12/19/2018'),
	('201147','592','72767230882694','12/17/2018','1/31/2019'),
	('102966','592','64337576896103','2/15/2019','4/1/2019'),
	('145475','623','72767230882694','3/1/2019','4/15/2019'),
	('245682','592','32434129068226','3/23/2019','5/7/2019'),
	('145977','424','38252526820792','2/1/2019','3/18/2019'),
	('265478','221','16857647514452','3/8/2019','4/22/2019'),
	('234741','785','51618163986036','3/14/2019','4/28/2019'),
	('225797','424','59289896342938','2/24/2019','4/10/2019'),
	('197544','221','16857647514452','2/28/2019','4/14/2019'),
	('124568','785','64337576896103','3/8/2019','4/22/2019'),
	('118812','623','72767230882694','3/12/2019','4/26/2019'),
	('174586','592','32434129068226','3/17/2019','5/1/2019'),
	('121156','424','59289896342938','3/4/2019','4/18/2019'),
	('208357','424','59289896342938','3/4/2019','4/18/2019'),
	('211849','424','59289896342938','3/4/2019','4/18/2019'),
	('237911','592','32434129068226','3/20/2019','5/4/2019'),
	('100045','592','32434129068226','3/20/2019','5/4/2019'),
	('187413','592','32434129068226','3/20/2019','5/4/2019'),
	('154742','785','51618163986036','2/14/2019','3/31/2019'),
	('116324','424','72767230882694','3/1/2019','4/15/2019'),
	('201147','592','64337576896103','3/23/2019','5/7/2019'),
	('102966','592','72767230882694','2/1/2019','3/18/2019'),
	('145475','623','32434129068226','3/8/2019','4/22/2019'),
	('245682','592','38252526820792','3/14/2019','4/28/2019'),
	('145977','424','16857647514452','2/24/2019','4/10/2019'),
	('265478','221','51618163986036','2/28/2019','4/14/2019'),
	('234741','785','59289896342938','3/8/2019','4/22/2019'),
	('225797','424','16857647514452','3/12/2019','4/26/2019'),
	('197544','221','64337576896103','3/17/2019','5/1/2019'),
	('124568','785','72767230882694','3/4/2019','4/18/2019'),
	('118812','623','32434129068226','3/4/2019','4/18/2019'),
	('174586','592','59289896342938','3/4/2019','4/18/2019'),
	('121156','424','59289896342938','3/20/2019','5/4/2019'),
	('208357','424','59289896342938','3/1/2019','4/15/2019'),
	('211849','424','32434129068226','3/23/2019','5/7/2019'),
	('237911','592','32434129068226','2/1/2019','3/18/2019'),
	('100045','592','32434129068226','3/8/2019','4/22/2019'),
	('187413','592','51618163986036','3/14/2019','4/28/2019'),
	('154742','785','59289896342938','2/24/2019','4/10/2019'),
	('102966','592','51618163986036','2/28/2019','4/14/2019'),
	('145475','623','72767230882694','3/8/2019','4/22/2019'),
	('245682','592','64337576896103','3/12/2019','4/26/2019'),
	('145977','424','72767230882694','3/17/2019','5/1/2019'),
	('265478','221','32434129068226','3/4/2019','4/18/2019'),
	('234741','785','38252526820792','3/4/2019','4/18/2019'),
	('225797','424','16857647514452','3/4/2019','4/18/2019'),
	('197544','221','51618163986036','3/20/2019','5/4/2019'),
	('124568','785','59289896342938','3/1/2019','4/15/2019'),
	('118812','623','16857647514452','3/23/2019','5/7/2019')
;
SELECT * FROM tbl_bookLoans;

CREATE TABLE tbl_bookCopies (
	bookCopies_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookCopies_bookId INT NOT NULL CONSTRAINT fk_bookCopiesId FOREIGN KEY REFERENCES tbl_books(bookId) ON UPDATE CASCADE ON DELETE CASCADE,
	bookCopies_branchId INT NOT NULL CONSTRAINT fk_branchId FOREIGN KEY REFERENCES tbl_libraryBranch(libraryBranch_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	bookCopies_NumberOfCopies INT NOT NULL
); 

INSERT INTO tbl_bookCopies
	(bookCopies_bookId, bookCopies_branchId, bookCopies_NumberOfCopies)
	VALUES
	('116324', '424', '10'),
	('201147', '592', '10'),
	('102966', '592', '10'),
	('145475', '623', '10'),
	('245682', '592', '10'),
	('145977', '424', '10'),
	('265478', '221', '10'),
	('234741', '785', '10'),
	('225797', '424', '10'),
	('197544', '221', '10'),
	('124568', '785', '10'),
	('118812', '623', '10'),
	('174586', '592', '10'),
	('121156', '424', '10'),
	('208357', '424', '10'),
	('211849', '424', '10'),
	('237911', '592', '10'),
	('100045', '592', '10'),
	('187413', '592', '10'),
	('154742', '785', '10'),
	('201147', '424', '10')
;
SELECT * FROM tbl_bookCopies;

/*1.*/
GO
CREATE PROC dbo.uspGetBranchTitleCopies @Branch nvarchar(20), @Title nvarchar(50)
AS
SELECT
	tbl_libraryBranch.libraryBranch_name, tbl_bookCopies.bookCopies_NumberOfCopies, tbl_books.books_title FROM tbl_bookCopies
	INNER JOIN tbl_books ON tbl_books.bookId = tbl_bookCopies.bookCopies_bookId
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.libraryBranch_id = tbl_bookCopies.bookCopies_branchId
WHERE libraryBranch_name = @Branch AND books_title = @Title
GO
EXEC dbo.uspGetBranchTitleCopies @Branch = 'Sharpstown', @Title = 'The Lost Tribe'
;

/*2.*/
GO
CREATE PROC dbo.uspGetBranchCopies @Titles nvarchar(50)
AS
SELECT
	tbl_libraryBranch.libraryBranch_name, tbl_bookCopies.bookCopies_NumberOfCopies, tbl_books.books_title FROM tbl_bookCopies
	INNER JOIN tbl_books ON tbl_books.bookId = tbl_bookCopies.bookCopies_bookId
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.libraryBranch_id = tbl_bookCopies.bookCopies_branchId
WHERE books_title = @Titles
GO
EXEC dbo.uspGetBranchCopies @Titles = 'The Lost Tribe'
;

/*3.*/
GO
CREATE PROC dbo.uspGetBorrowers @Borrowers nvarchar(50)
AS
SELECT
	tbl_borrower.borrower_name FROM tbl_borrower
	FULL OUTER JOIN tbl_bookLoans ON tbl_bookLoans.bookLoans_cardNo = tbl_borrower.borrower_cardNo
WHERE bookLoans_cardNo IS NULL
GO
EXEC dbo.uspGetBorrowers @Borrowers = '*'
;
DROP PROC dbo.uspGetBorrowers;

/*4.*/
GO
CREATE PROC dbo.uspGetDueDate @Branch nvarchar(20), @DueDate nvarchar(20)
AS
SELECT
	tbl_books.books_title, tbl_borrower.borrower_name, tbl_borrower.borrower_address FROM tbl_bookLoans
	INNER JOIN tbl_borrower ON tbl_borrower.borrower_cardNo = tbl_bookLoans.bookLoans_cardNo
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.libraryBranch_id = tbl_bookLoans.bookLoans_branchId
	INNER JOIN tbl_books ON tbl_books.bookId = tbl_bookLoans.bookLoans_bookId
WHERE libraryBranch_name = @Branch AND bookLoans_dateDue = @DueDate
GO
EXEC dbo.uspGetDueDate @Branch = 'Sharpstown', @DueDate = '4/10/2019'
;

/*5.*/
GO
CREATE PROC dbo.uspGetBooksLoaned @BooksLoaned nvarchar(20)
AS
SELECT COUNT(*) AS 'Loaned Books',
	tbl_libraryBranch.libraryBranch_name FROM tbl_bookLoans
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.libraryBranch_id = tbl_bookLoans.bookLoans_branchId
	INNER JOIN tbl_bookCopies ON tbl_bookCopies.bookCopies_bookId = tbl_bookLoans.bookLoans_bookId
GROUP BY tbl_libraryBranch.libraryBranch_name
GO
EXEC dbo.uspGetBooksLoaned @BooksLoaned = '%'
;

/*6.*/
GO
CREATE PROC dbo.uspGetBookLoanAmount @BookLoans nvarchar(20)
AS
SELECT COUNT (*),
	tbl_borrower.borrower_name, tbl_borrower.borrower_address FROM tbl_bookLoans
	INNER JOIN tbl_borrower ON tbl_borrower.borrower_cardNo = tbl_bookLoans.bookLoans_cardNo
GROUP BY tbl_borrower.borrower_name, tbl_borrower.borrower_address
HAVING COUNT (*) >5
GO
EXEC dbo.uspGetBookLoanAmount @BookLoans = '%'
;

/*7.*/
GO
CREATE PROC dbo.uspGetKingBooks @Branch nvarchar(20), @Author nvarchar(50)
AS
SELECT tbl_bookCopies.bookCopies_NumberOfCopies COUNT,
	tbl_books.books_title FROM tbl_bookCopies
	INNER JOIN tbl_books ON tbl_books.bookId = tbl_bookCopies.bookCopies_bookId
	INNER JOIN tbl_bookAuthor ON tbl_bookAuthor.bookAuthor_id = tbl_bookCopies.bookCopies_bookId
	INNER JOIN tbl_libraryBranch ON tbl_libraryBranch.libraryBranch_id = tbl_bookCopies.bookCopies_branchId
WHERE libraryBranch_name = @Branch AND bookAuthor_authorName = @Author
GROUP BY tbl_books.books_title, tbl_bookCopies.bookCopies_NumberOfCopies
GO
EXEC dbo.uspGetKingBooks @Branch = 'Central', @Author = 'King, Stephen'
;
