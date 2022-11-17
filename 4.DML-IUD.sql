
/*Insert into*/
--syntax
/*
INSERT INTO table_name 
(column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
*/

INSERT INTO Customers 
(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

/*UPDate*/
--syntax

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;


/*DELETE*/
--syntax
DELETE FROM table_name 
WHERE condition;


