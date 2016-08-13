--Ensure we are on master database

USE master
GO 

--If the database already exists, drop it

IF EXISTS (SELECT* FROM sys.databases WHERE [name] = 'dbLibrary')
DROP DATABASE dbLibrary
GO

--Create the database

CREATE DATABASE dbLibrary
GO

-- Switch to the database we just created

USE
dbLibrary
GO
--Populate the database with tables

CREATE TABLE Publisher
(
Name Varchar(50) PRIMARY KEY NOT NULL,
Address Varchar(50) NOT NULL,
Phone Varchar(20) NOT NULL
)

CREATE TABLE Book
(
Bookid int PRIMARY KEY NOT NULL,
Title Varchar(50) NOT NULL,
PublisherName Varchar(50) FOREIGN KEY REFERENCES Publisher(name) NOT NULL
)

CREATE TABLE Book_Authors
(
Bookid int PRIMARY KEY FOREIGN KEY REFERENCES book(bookid) NOT NULL,
AuthorName Varchar (30) NOT NULL
)

CREATE TABLE Library_Branch
(
Branchid int PRIMARY KEY NOT NULL,
BranchName Varchar(30) NOT NULL,
Address Varchar(50) NOT NULL
)

CREATE TABLE Borrower
(
CardNo int PRIMARY KEY NOT NULL,
Name Varchar(30) NOT NULL,
Address Varchar(50) NOT NULL,
Phone Varchar(20) NOT NULL
)


CREATE TABLE Book_Copies
(
BookID int FOREIGN KEY REFERENCES Book(bookid) NOT NULL,
Branchid int FOREIGN KEY REFERENCES Library_Branch(Branchid) NOT NULL,
No_Of_Copies int NOT NULL
PRIMARY KEY (BookID, Branchid)
)

CREATE TABLE Book_Loans
(
Bookid int FOREIGN KEY REFERENCES book(Bookid) NOT NULL,
Branchid int FOREIGN KEY REFERENCES Library_Branch(Branchid) NOT NULL,
CardNo int FOREIGN KEY REFERENCES Borrower(CardNo) NOT NULL,
DateOut date NOT NULL,
DueDate date NOT NULL
PRIMARY KEY (Bookid, CardNo, Branchid, DateOut)
)

--populate publisher table

INSERT INTO Publisher
VALUES ('Harper Perennial Modern Classics','1111 SE Arden Ln Portland OR 97283','1549459922'),
('Modern Library','1111 SE Arden Ln Portland OR 97283','3569987896'),
('Amazon Books','2222 SE Arden Ln Portland OR 97283','2569987785'),
('Jones and Sons','3333 SE Arden Ln Portland OR 97283','3659874569'),
('Haskler Co','4444 SE Arden Ln Portland OR 97283','6549235987'),
('Benjamin Classics','5555 SE Arden Ln Portland OR 97283','9137985234')

--Populate Book table

INSERT INTO Book
VALUES (01,'To Kill a Mockingbird','Harper Perennial Modern Classics'),
(02,'Pride and Prejudice','Modern Library'),
(03,'The Lost Tribe','Amazon Books'),
(04,'Expert Expectations','Jones and Sons'),
(05,'Haunted Pitfalls','Haskler Co'),
(06,'Destination Unencumbered','Benjamin Classics'),
(07,'The Next Generation','Harper Perennial Modern Classics'),
(08,'Police To The Rescue','Modern Library'),
(09,'James Jorgenson Biography','Amazon Books'),
(10,'Souveneers of the 17th Century','Jones and Sons'), 
(11,'Never Been Again','Haskler Co'),
(12,'Estimations of Life','Benjamin Classics'),
(13,'The Calling','Harper Perennial Modern Classics'),
(14,'The Calling II','Modern Library'),
(15,'The Calling III','Amazon Books'),
(16,'The Seven','Jones and Sons'),
(17,'Soup and Potato','Haskler Co'),
(18,'Estimations of Life','Benjamin Classics'),
(19,'The Next Generation','Harper Perennial Modern Classics'),
(20,'Police To The Rescue','Modern Library'),
(21,'James Jorgenson Biography','Amazon Books'),
(22,'Souveneers of the 17th Century','Jones and Sons'),
(23,'Never Been Again','Haskler Co'),
(24,'Estimations of Life','Benjamin Classics')
 
 --Populate library branch table

INSERT INTO Library_Branch
VALUES (01,'Sharpstown','1111 SE Arden Ln Portland OR 97283'),
(02,'Central','2222 SE Arden Ln Portland OR 97283'),
(03,'Downtown','3333 SE Arden Ln Portland OR 97283'),
(04,'Uptown','4444 SE Arden Ln Portland OR 97283'),
(05,'Bingham','5555 SE Arden Ln Portland OR 97283')

--Populate Book Authors table

INSERT INTO Book_Authors
VALUES (01,'Harper Lee'),
(02,'Stephen King'),
(03,'Jack Stanley'),
(04,'Ryan Bogg'),
(05,'Stephen King'),
(06,'Gray Moore'),
(07,'Stephen King'),
(08,'Irene Yu'),
(09,'Stephen King'),
(10,'Ryan Bogg'),
(11,'Sleepy Shepard'),
(12,'Sleepy Shepard')

--Populate Book Copies table

INSERT INTO Book_Copies
VALUES (01, 01, 2),
(08, 01, 2),
(17, 01, 2),
(21, 01, 2),
(18, 01, 2),
(11, 01, 2),
(04, 01, 2),
(07, 01, 2),
(22, 01, 2),
(03, 01, 2),
(06, 01, 2),
(08, 02, 2),
(17, 02, 2),
(21, 02, 2),
(18, 02, 2),
(11, 02, 2),
(04, 02, 2),
(05, 02, 2),
(22, 02, 2),
(03, 02, 2),
(06, 02, 2),
(08, 03, 2),
(17, 03, 2),
(21, 03, 2),
(18, 03, 2),
(11, 03, 2),
(04, 03, 2),
(05, 03, 2),
(22, 03, 2),
(03, 03, 2),
(06, 03, 2),
(08, 04, 2),
(17, 04, 2),
(21, 04, 2),
(18, 04, 2),
(11, 04, 2),
(04, 04, 2),
(05, 04, 2),
(22, 04, 2),
(03, 04, 2),
(06, 04, 2),
(08, 05, 2),
(17, 05, 2),
(21, 05, 2),
(18, 05, 2),
(11, 05, 2),
(04, 05, 2),
(05, 05, 2),
(22, 05, 2),
(03, 05, 2),
(06, 05, 2)

--Populate Borrower Table

INSERT INTO Borrower
VALUES (01,'John Smith','1111 SE Arden Ln Portland OR 97283','1273433444'),
(02,'Jimmy Gram','2222 SE Arden Ln Portland OR 97283','3569987896'),
(03,'Frank Hannoly','3333 SE Arden Ln Portland OR 97283','12335465667'),
(04,'Barry Summer','4444 SE Arden Ln Portland OR 97283','234657875'),
(05,'Polly Right','5555 SE Arden Ln Portland OR 97283','344212678'),
(06,'Mary Winson','6666 SE Arden Ln Portland OR 97283','3569987896'),
(07,'Alice Freabanks','7777 SE Arden Ln Portland OR 97283','3569987896'),
(08,'Yaniv Slone','6666 SE Arden Ln Portland OR 97283','3569987896')

--Populate Books Loaned Out Table

INSERT INTO Book_Loans
VALUES(03,04,08,'2016-08-01','2016-08-12'),
(04,04,08,'2016-08-01','2016-08-12'),
(05,04,08,'2016-08-01','2016-08-12'),
(06,04,08,'2016-08-01','2016-08-12'),
(08,04,08,'2016-08-01','2016-08-12'),
(22,04,08,'2016-08-01','2016-08-12'),
(03,04,03,'2016-08-01','2016-08-12'),
(04,04,03,'2016-08-01','2016-08-12'),
(05,04,03,'2016-08-01','2016-08-12'),
(06,04,03,'2016-08-01','2016-08-12'),
(08,04,03,'2016-08-01','2016-08-12'),
(19,04,03,'2016-08-01','2016-08-12'),
(03,01,01,'2016-08-01','2016-08-12'),
(04,01,01,'2016-08-01','2016-08-12'),
(05,01,01,'2016-08-01','2016-08-12'),
(06,01,01,'2016-08-01','2016-08-12'),
(08,01,01,'2016-08-01','2016-08-12'),
(22,01,01,'2016-08-01','2016-08-12'),
(03,02,02,'2016-08-10','2016-08-12'),
(04,02,02,'2016-08-10','2016-08-12'),
(05,02,02,'2016-08-10','2016-08-12'),
(06,02,02,'2016-08-01','2016-08-12'),
(08,02,02,'2016-08-01','2016-09-12'),
(22,02,02,'2016-08-01','2016-09-12'),
(03,02,02,'2016-08-01','2016-09-12'),
(04,02,02,'2016-08-01','2016-09-12'),
(05,02,02,'2016-08-01','2016-08-12'),
(06,02,02,'2016-08-14','2016-08-12'),
(08,02,02,'2016-08-14','2016-08-12'),
(23,02,02,'2016-08-01','2016-08-12'),
(03,03,04,'2016-08-01','2016-08-12'),
(04,03,04,'2016-08-01','2016-08-12'),
(05,03,04,'2016-08-01','2016-08-12'),
(06,03,04,'2016-08-01','2016-08-12'),
(08,03,04,'2016-08-01','2016-08-12'),
(22,03,04,'2016-08-05','2016-08-12'),
(03,03,04,'2016-08-06','2016-08-12'),
(04,03,04,'2016-08-07','2016-08-12'),
(05,03,04,'2016-08-08','2016-08-12'),
(06,03,04,'2016-08-09','2016-08-12'),
(08,03,04,'2016-08-10','2016-08-12'),
(22,03,04,'2016-08-11','2016-08-12'),
(08,03,04,'2016-08-11','2016-08-31'),
(22,05,04,'2016-08-11','2016-08-21')

