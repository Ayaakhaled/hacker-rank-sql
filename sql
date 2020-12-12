🚩🚩 < USING MYSQL >> 🚩🚩 

📌 Weather Observation Station 9 : Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

✏️ 

SELECT DISTINCT(CITY) FROM STATION 
WHERE LEFT(CITY,1) NOT IN ('a','e','i','o','u')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

✏️ 
SELECT DISTINCT(CITY) FROM STATION
WHERE RIGHT(CITY,1) NOT IN ('a','e','i','o','u')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

✏️
SELECT DISTINCT(CITY) FROM STATION 
WHERE LEFT(CITY,1) NOT IN ('a','e','i','o','u') OR RIGHT(CITY,1) NOT IN ('a','e','i','o','u')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

✏️ 
SELECT DISTINCT(CITY) FROM STATION 
WHERE LEFT(CITY,1) NOT IN ('a','e','i','o','u') AND RIGHT(CITY,1) NOT IN ('a','e','i','o','u')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.


✏️
SELECT name 
FROM STUDENTS 
WHERE marks > 75 
ORDER BY RIGHT(name,3) , id ASC 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

✏️ 
SELECT * FROM CITY
WHERE CountryCode = 'USA' AND population > 100000

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌
We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers.

✏️
SELECT (salary * months) , COUNT(*) 
FROM employee
GROUP BY 1 
ORDER BY 1 DESC
LIMIT 1 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌
Query the following two values from the STATION table:
The sum of all values in LAT_N rounded to a scale of 2 decimal places.
The sum of all values in LONG_W rounded to a scale of 2 decimal places.

✏️

SELECT ROUND(SUM(LAT_N),2) , ROUND(SUM(LONG_W),2) FROM STATION 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880  and less than 137.2345 . Truncate your answer to 4 decimal places.

✏️
SELECT TRUNCATE(SUM(LAT_N),4) AS LAT_N_SUM
FROM STATION 
WHERE  LAT_N > 38.7880 AND LAT_N < 137.2345

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 . Truncate your answer to 4 decimal places.

✏️

SELECT TRUNCATE(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than  137.2345 . Round your answer to 4 decimal places.

✏️

SELECT round(LONG_W,4)
FROM STATION
WHERE LAT_N < 137.2345 
ORDER BY LAT_N DESC 
LIMIT 1 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Weather Observation Station 16

✏️
SELECT ROUND(MIN(LAT_N),4) FROM STATION WHERE  LAT_N > 38.7780
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Weather Observation Station 17

✏️
SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N ASC 
LIMIT 1 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Weather Observation Station 18

✏️ 
SELECT ROUND(ABS(a - c) + ABS(b - d) , 4 ) FROM 
(SELECT MIN(LAT_N) AS a , MIN(LONG_W) AS b , MAX(LAT_N) AS c , MAX(LONG_W) AS d 
FROM STATION ) AS points

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Weather Observation Station 19
✏️
SELECT TRUNCATE(SQRT(POW(a - b,2) + POW(c - d,2)),4) FROM 
(SELECT MIN(LAT_N) AS a , MAX(LAT_N) AS b , MIN(LONG_W) AS c , MAX(LONG_W) AS d 
FROM STATION ) AS points

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Asian Population
✏️
SELECT SUM(CITY.population)
FROM CITY 
INNER JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Asia'

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Revising Aggregations - The Count Function



Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical
(i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is 
the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.


✏️

SELECT CONCAT(name,'(',first_char,')')
FROM ( SELECT name , LEFT(OCCUPATION,1) AS first_char FROM OCCUPATIONS ) AS SUB
ORDER BY 1 ;

SELECT CONCAT('There are a total of ',occupation_count,' ',LOWER(occupation),'s.')
FROM ( SELECT occupation , COUNT(occupation) AS occupation_count
FROM OCCUPATIONS
GROUP BY 1

> there is a note here : you must convert the name to lower case although they did not mentioned that in the requirments 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Revising Aggregations - The Count Function

✏️ 
SELECT COUNT(*) FROM CITY 
WHERE Population > 100000

-------------------------------------------------------------------------------------------------------------------------------------------------------------------




