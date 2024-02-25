# US Household Income Data Cleaning


SELECT * 
FROM us_project.us_household_income;

SELECT * 
FROM us_project.us_household_income_statistics;

ALTER TABLE us_project.us_household_income_statistics RENAME COLUMN `ï»¿id` TO `ID`;

SELECT COUNT(ID)
FROM us_project.us_household_income;

SELECT COUNT(ID)
FROM us_project.us_household_income_statistics;

SELECT ID, COUNT(ID)
FROM us_project.us_household_income
GROUP BY ID
HAVING COUNT(ID) > 1
;

SELECT row_id,
ID,
ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID)
FROM us_project.us_household_income
;


SELECT *
FROM (
SELECT row_id,
ID,
ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) row_num
FROM us_project.us_household_income
) duplicates 
WHERE row_num > 1
;

DELETE FROM us_project.us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id,
		ID,
		ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) row_num
		FROM us_project.us_household_income
		) duplicates 
	WHERE row_num > 1)
;


SELECT ID, COUNT(ID)
FROM us_project.us_household_income_statistics
GROUP BY ID
HAVING COUNT(ID) > 1
;

SELECT State_Name, COUNT(State_Name)
FROM us_project.us_household_income
GROUP BY State_Name
;

SELECT DISTINCT State_Name
FROM us_project.us_household_income
GROUP BY State_Name
;

SELECT DISTINCT State_Name
FROM us_project.us_household_income
ORDER BY 1
;

UPDATE us_project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia'
;

UPDATE us_project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama'
;

SELECT DISTINCT State_ab
FROM us_project.us_household_income
ORDER BY State_ab
;

SELECT *
FROM us_project.us_household_income
WHERE Place = ''
ORDER BY 1
;

SELECT *
FROM us_project.us_household_income
WHERE County = 'Autauga County'
ORDER BY 1
;

UPDATE us_project.us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

SELECT Type, COUNT(Type)
FROM us_project.us_household_income
GROUP BY Type
;

UPDATE us_project.us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT ALand, Awater
FROM us_project.us_household_income
WHERE AWater = 0 OR AWater = '' OR Awater IS NULL
;

SELECT DISTINCT Awater
FROM us_project.us_household_income
WHERE AWater = 0 OR AWater = '' OR Awater IS NULL
;

SELECT ALand, AWater
FROM us_project.us_household_income
WHERE (AWater = 0 OR AWater = '' OR AWater IS NULL)
AND (ALand = 0 OR ALand = '' OR ALand IS NULL)
;

SELECT ALand, AWater
FROM us_project.us_household_income
WHERE (ALand = 0 OR ALand = '' OR ALand IS NULL)
;
































