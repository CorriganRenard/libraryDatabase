/*Finds how many copies of the book titled The Lost Tribe are owned by the library branch whose name
is"Sharpstown"*/
EXEC LostTribeSharpstown 


/*Finds how many copies of the book titled The Lost Tribe are owned by each library branch
*/
EXEC LostTribeOwned

/*Retrieves the names of all borrowers who do not have any books checked out.
*/
EXEC IdleBorrower

/*For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
retrieves the book title, the borrower's name, and the borrower's address.
*/
EXEC SharpstownDue

/*For each library branch, retrieves the branch name and the total number of books loaned out from
that branch.*/
EXEC LoanedByBranch

/*Retrieves the names, addresses, and number of books checked out for all borrowers who have more
than five books checked out.*/
EXEC BusyBorrower

/*For each book authored (or co-authored) by "Stephen King", retrieves the title and the number of
copies owned by the library branch whose name is "Central"*/
EXEC KingCentralBranch