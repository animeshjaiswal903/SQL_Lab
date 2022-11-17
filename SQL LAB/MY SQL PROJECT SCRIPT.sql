use IBM_assignment
select * from ChicagoCensusData 
select * from ChicagoCrimeData
select * from ChicagoPublicSchools

/*Problem 1: Find the total number of crimes recorded in the CRIME table.*/
select count(*) 
from ChicagoCrimeData;



/*Problem 2: List community areas with per capita income less than 11000*/
select COMMUNITY_AREA_NUMBER,COMMUNITY_AREA_NAME
FROM ChicagoCensusData  
where PER_CAPITA_INCOME<11000;



/*Problem 3: List all case numbers for crimes  involving minors?*/
SELECT CASE_NUMBER
FROM ChicagoCrimeData
WHERE DESCRIPTION like '%MINOR%'



/*Problem 4: List all kidnapping crimes involving a child?*/
SELECT CASE_NUMBER,PRIMARY_TYPE,DESCRIPTION
FROM ChicagoCrimeData 
WHERE (PRIMARY_TYPE like '%KIDNAPPING%') AND DESCRIPTION LIKE '%CHILD%';



/*Problem 5: What kind of crimes were recorded at schools?*/
SELECT CASE_NUMBER,PRIMARY_TYPE,DESCRIPTION,LOCATION_DESCRIPTION FROM ChicagoCrimeData WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%';



/*Problem 6: List the average safety score for all types of schools.*/
select ElementaryMiddleOrHighSchool,count(*),avg(SAFETY_SCORE)
from ChicagoPublicSchools
group by ElementaryMiddleOrHighSchool;



/*Problem 7: List 5 community areas with highest % of households below poverty line*/
select  top 5 COMMUNITY_AREA_NUMBER,COMMUNITY_AREA_NAME,PERCENT_HOUSEHOLDS_BELOW_POVERTY
from ChicagoCensusData
ORDER BY  PERCENT_HOUSEHOLDS_BELOW_POVERTY desc;


/*Problem 8: Which community area(number) is most crime prone?*/
select COMMUNITY_AREA_NUMBER,PERCENT_OF_HOUSING_CROWDED
FROM ChicagoCensusData 
WHERE PERCENT_OF_HOUSING_CROWDED=(SELECT MAX(PERCENT_OF_HOUSING_CROWDED) FROM ChicagoCensusData);


/*Problem 9: Use a sub-query to find the name of the community area with highest hardship index.*/
select COMMUNITY_AREA_NAME,HARDSHIP_INDEX
FROM ChicagoCensusData 
WHERE HARDSHIP_INDEX=(SELECT MAX(HARDSHIP_INDEX) FROM ChicagoCensusData);


/*Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?*/
SELECT  COMMUNITY_AREA_NAME FROM ChicagoCensusData CEN
where CEN.COMMUNITY_AREA_NUMBER = (select top 1 COMMUNITY_AREA_NUMBER from ChicagoCrimeData GROUP BY COMMUNITY_AREA_NUMBER ORDER BY COUNT(*) DESC ); 