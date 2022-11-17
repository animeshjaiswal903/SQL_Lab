use Padhai;

/*where*/
select * 
from FilmLocations
where Title='Vertigo';

/*where-BETWEEN*/
/*where-between number1 and number2*/
select count(distinct Title)
from FilmLocations
where [Release Year] between 1940 and 1960;
/*where-between str1 and str2*/
select *
from FilmLocations
where Title between 'Greed' and 'Dark Passage'    /*this will not work as D comes before G (and it doesn't matter if order by is desc)*/
order by Title;
select *
from FilmLocations
where Title between 'Dark Passage' and 'Greed'    /*this will work as D comes before G (here if oreder by is desc, Greed will come first)*/
order by Title desc;


/*where-LIKE*/
/*WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"*/
select distinct(Title)
from FilmLocations
where Title like 'T%';

/*Wildcards
%	Represents zero or more characters	bl% finds bl, black, blue, and blob
_	Represents a single character	h_t finds hot, hat, and hit
[]	Represents any single character within the brackets	h[oa]t finds hot and hat, but not hit
^	Represents any character not in the brackets	h[^oa]t finds hit, but not hot and hat
-	Represents any single character within the specified range	c[a-b]t finds cat and cbt
*/
select *
from FilmLocations
where Title like 'Gr[a-z][a-z]%';


/*where-IN*/
select distinct(Title),[Release Year]
from FilmLocations
where [Release Year] in (1947,1941) 
/*where-in-select*/
select distinct Title
from FilmLocations
where [Release Year] in (select distinct([Release Year]) from /*another table which also has release year*/);



/*where-condition1 and/or condition2 and/or....*/
select * 
from FilmLocations
where (Title like 'T%') and ([Release Year] between 1940 and 1950);



/*where-not
syntax-where column1 (not in/not like/not between)*/
select distinct(Title),[Release Year]
from FilmLocations
where (not [Release Year] between 1940 and 1950) and ([Release Year] between 1930 and 1960);
