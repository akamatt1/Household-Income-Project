# US Household Income Exploratory Data Analysis


SELECT *
FROM us_project.us_household_income;

SELECT *
FROM us_project.us_household_income_statistics;

SELECT State_Name, ALand, AWater
FROM us_project.us_household_income
;

SELECT State_Name, County, City, ALand, AWater
FROM us_project.us_household_income
;

SELECT State_Name, ALand, AWater
FROM us_project.us_household_income
;


SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
;

SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10
;

SELECT *
FROM us_project.us_household_income u
JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
    ;

SELECT *
FROM us_project.us_household_income_statistics;

SELECT *
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE u.id IS NULL
;

SELECT *
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
;

SELECT *
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0;

SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2
LIMIT 5
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10
;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 10
;

SELECT Type, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 DESC
LIMIT 10
;

SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY 1
ORDER BY 1 DESC
LIMIT 120
;


SELECT Type, COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
WHERE Mean <> 0 AND TYPE IS NOT NULL
GROUP BY 1
ORDER BY 3 DESC
LIMIT 20
;

SELECT *
FROM us_project.us_household_income
WHERE Type = 'Community'
;

SELECT u.State_Name, City, ROUND(AVG(Mean),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
GROUP BY u.State_Name, City;

SELECT u.State_Name, City, ROUND(AVG(Mean),1)
FROM us_project.us_household_income u
RIGHT JOIN us_project.us_household_income_statistics us 
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC 
;













