/*Finds how many copies of the book titled The Lost Tribe are owned by the library branch whose name
is"Sharpstown"*/
CREATE PROC LostTribeSharpstown
AS
BEGIN
SELECT bc.no_of_copies FROM Library_Branch AS lB 
INNER JOIN book_copies AS BC ON lb.BranchID = Bc.Branchid
INNER JOIN Book AS B ON B.bookid = bc.bookid
WHERE b.title='The Lost Tribe' AND LB.BranchName='Sharpstown'
END
GO
/*Finds how many copies of the book titled The Lost Tribe are owned by each library branch
*/
CREATE PROC LostTribeOwned
AS
BEGIN
SELECT b.title, bc.no_of_copies, lb.branchname FROM Library_Branch AS lB 
INNER JOIN book_copies AS BC ON lb.BranchID = Bc.Branchid
INNER JOIN Book AS B ON B.bookid = bc.bookid
WHERE b.title='The Lost Tribe' 
END
GO
/*Retrieves the names of all borrowers who do not have any books checked out.
*/
CREATE PROC IdleBorrower
AS
BEGIN
SELECT * FROM Borrower AS B LEFT JOIN Book_Loans AS BL
ON b.cardno = bl.cardno
WHERE BL.cardno IS NULL
END
GO
/*For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
retrieves the book title, the borrower's name, and the borrower's address.
*/
CREATE PROC SharpstownDue
AS
BEGIN
SELECT b.title, Br.name, br.address FROM Library_Branch AS lB 
INNER JOIN book_Loans AS BL ON lb.BranchID = BL.Branchid
INNER JOIN Book AS B ON B.bookid = bl.bookid
INNER JOIN Borrower AS BR ON br.cardNO = BL.cardno
WHERE lb.BranchName='Sharpstown' AND BL.DueDate='2016-08-12' 
END
GO
/*For each library branch, retrieves the branch name and the total number of books loaned out from
that branch.*/
CREATE PROC LoanedByBranch
AS
BEGIN
SELECT BranchName, COUNT(BranchName) AS TotalLoans FROM Library_Branch as LB INNER JOIN Book_Loans AS BL
ON LB.branchid=BL.branchid
GROUP BY BranchName 
END
GO
/*Retrieves the names, addresses, and number of books checked out for all borrowers who have more
than five books checked out.*/
CREATE PROC BusyBorrower
AS
BEGIN
SELECT name, address, COUNT(bl.cardno) AS BooksBorrowed FROM Book_Loans as BL INNER JOIN Borrower AS B
ON B.cardno=BL.cardno
GROUP BY b.name, address
HAVING COUNT(bl.cardno) > 5
END
GO
/*For each book authored (or co-authored) by "Stephen King", retrieves the title and the number of
copies owned by the library branch whose name is "Central"
*/
CREATE PROC KingCentralBranch
AS
BEGIN
SELECT Title, No_Of_Copies FROM Library_Branch AS LB 
INNER JOIN Book_Copies as BC ON LB.BranchID = BC.Branchid
INNER JOIN Book as B ON BC.Bookid=B.Bookid
INNER JOIN Book_Authors AS BA ON B.Bookid=BA.Bookid
WHERE BA.AuthorName='Stephen King' AND LB.BranchName='Central'
END
