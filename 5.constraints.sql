/*constraints-
NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly*/

use Padhai;

--we can use these constraints in create table and alter table
--1) in create table
CREATE TABLE Persons (
    ID int NOT NULL ,--first way
    LastName varchar(255) NOT NULL unique,--second way (for multiple constraint)
    FirstName varchar(255) NOT NULL,
    Age int,
	CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)--third way for naming the constraint and adding the constraint on multiple columns and useful if u need to drop the constraint
);
--for foreign key
CREATE TABLE Orders (
    PersonID int FOREIGN KEY REFERENCES Persons(ID)
	--or
	CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);


--2) in alter table
ALTER TABLE Persons
Alter column Age int NOT NULL;--chnaging one column without name of constraint

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);--changing multiple column with name of constraint

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;
