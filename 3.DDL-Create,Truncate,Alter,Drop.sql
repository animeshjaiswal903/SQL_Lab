/*Database*/
use padhai;
create database Padhai2;
drop database Padhai2;


/*Create,drop,truncate*/
/*Create Table*/
--create new table
create table Customers
([customer id] int,
customername varchar(75),
country varchar(50)
);

--Drop(delete entire table)
drop table Customers;



/*Alter*/
--alter table, add column1 datatype
alter table customers
add newcolumn varchar(50);
--alter table,alter column column1 datatype
alter table customers
alter column newcolumn int;
--alter table, drop column column1
alter table customers
drop column newcolumn;

--truncate(only remove the data and not the column and its name)
Truncate table Customers;