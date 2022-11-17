SELECT COUNT(DISTINCT `engine-location`) FROM automobile WHERE `engine-type` in ("ohc","ohcf");
SELECT DISTINCT `symboling`,`num-of-doors` from automobile where `horsepower`>160 limit 4
SELECT * FROM automobile LIMIT 15 OFFSET 5;

/* IUD/*/
INSERT INTO employees(c1,c2,c3,c4,c6,c7,c8,c9,c10,c11)
VALUES('E1011','John','Mor',123416,'M','surve',240,71000,45000,6),('E1012','Johny','Moriarty',123417,'M','surveyt',245,71005,45005,5);

UPDATE employees
SET `c11`=10,`c8`=50 where `c9`=70000;

DELETE FROM employees WHERE `c3`='Mor';

/*Create,alter,trunkate,drop*/
/*CREATE*/
CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
    );
INSERT INTO PETSALE VALUES
    (1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');
 /*ALTER*/   
ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;
UPDATE PETSALE SET `QUANTITY`=45 WHERE `ID`=1;
UPDATE PETSALE SET `QUANTITY`=54 WHERE `ID`=2;
UPDATE PETSALE SET `QUANTITY`=87 WHERE `ID`=3;
UPDATE PETSALE SET `QUANTITY`=21 WHERE `ID`=4;
UPDATE PETSALE SET `QUANTITY`=12 WHERE `ID`=5;

ALTER TABLE PETSALE
DROP COLUMN PROFIT;

ALTER TABLE PETSALE
MODIFY COLUMN PET VARCHAR(20);

ALTER TABLE PETSALE
RENAME COLUMN PET TO ANIMAL;
/*TRUNCATE AND DELETE*/
CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
    );
TRUNCATE TABLE PET; 
DROP TABLE PET;

ALTER TABLE employees
RENAME COLUMN c11 TO dep_id;





						               /*strings,ranges,sorting,grouping*/

                                                  /*strings*/
select `f_name`,`l_name` from employees
where `address` like "%Rice%";

                                                   /*ranges*/
select `f_name` from employees 
where (`salary` between 60000 and 80000) and `dep_id`=5; 

select f_name from employees
where salary>=60000 and salary<=80000
order by f_name;

select emp_id from employees
where f_name="John" or salary>70000;

                                              /*sorting----order by*/
select `f_name`,`dep_id` from employees
order by `f_name` desc,`dep_id` desc;
                                             /*grouping----group by*/
select `dep_id`,count(*),avg(salary) from employees
group by `dep_id`;

/*FUNTIONS*/
select sum(salary) as total_salary from employees;
select min(salary) as min_salary from employees;
select max(salary) as max_salary from employees;
select avg(salary) as avg_salary from employees;
select round(salary) from employees;
select UCASE(f_name) as f_name_in_uppercase from employees;
select * from employees where lcase(f_name) like "a%";
select * from employees where ucase(l_name)="JONES";

select * from petrescue;
select DAY(RESCUEDATE) from PETRESCUE where ANIMAL = 'Cat';
select SUM(QUANTITY) from PETRESCUE where MONTH(RESCUEDATE)='06';

/*NESTED SELECTS OR SUB QUERIES*/
/*CANNOT EVALUATE AGGREGATE FUNTIONS? USE NESTED SELECTS OR SUB QUERIES*/
select f_name from employees where salary>(select avg(salary) from employees);
select (select avg(salary) from employees) as avg_salary from employees;
select * from (select f_name,l_name,salary from employees) as salary_table; 

/*WORKING ON MULTIPLE TABLES*/
select * from employees where job_id in (select job_ident from jobs);
select job_title from jobs where job_ident in (select job_id from employees where `salary`>70000);
SELECT * FROM employees E,jobs J where E.job_id=J.job_ident;
select emp_id,min_salary from employees E,jobs J where E.job_id=J.job_ident;

SELECT * FROM EMPLOYEES WHERE DEP_ID = 

      ( SELECT MAX(DEP_ID) FROM EMPLOYEES   ) ;


