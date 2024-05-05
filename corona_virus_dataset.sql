-- IMPORT DATASET
SELECT * FROM corona_virus.`corona virus dataset`;
/* Question1 : Write a code to check NULL values*/

select * from `corona virus dataset` WHERE (Province,
Latitude, Longitude, Country/Region, Deaths) IS NULL;

/*Qn2: If NULL values are present, update them with zeros for all columns.*/

/*Qn3: check total number of rows*/

select count(*) AS total_rows from `corona virus dataset`;

/*Qn4: Check what is start_date and end_date.*/

/*Qn5: Number of month present in dataset.*/
SELECT 
    COUNT(DISTINCT DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m')) AS num_months
FROM 
    `corona virus dataset`;
    
/*Qn6: Find monthly average for confirmed, deaths, recovered.*/
SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m');

/*Qn7: Find most frequent value for confirmed, deaths, recovered each month.*/
SELECT 
    month,
    MAX(Confirmed) AS max_confirmed,
    MAX(Deaths) AS max_deaths,
    MAX(Recovered) AS max_recovered
FROM (
    SELECT 
        DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS month,
        Confirmed,
        Deaths,
        Recovered,
        COUNT(*) AS confirmed_count,
        COUNT(*) AS deaths_count,
        COUNT(*) AS recovered_count
    FROM 
        `corona virus dataset`
    GROUP BY 
        DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m'),
        confirmed, deaths, recovered
) AS subquery
GROUP BY 
    month;

/*Qn8: Find minimum values for confirmed, deaths, recovered per year.*/
SELECT 
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
    MIN(confirmed) AS min_confirmed,
    MIN(deaths) AS min_deaths,
    MIN(recovered) AS min_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')
    );

/*Qn9: Find maximum values of confirmed, deaths, recovered per year.*/
SELECT 
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')) AS year,
    MAX(Confirmed) AS max_confirmed,
    MAX(Deaths) AS max_deaths,
    MAX(Recovered) AS max_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')
    );

/*Qn10: The total number of case of confirmed, deaths, recovered each month.*/
SELECT 
    date_format(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS months,
    SUM(confirmed) AS total_confirmed,
    SUM(deaths) AS total_deaths,
    SUM(recovered) AS total_recovered
FROM 
    `corona virus dataset`
GROUP BY 
    date_format(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m'
    );
-- Qn11: Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT 
    COUNT(*) AS total_cases,
    AVG(Confirmed) AS average_cases,
    VARIANCE(Confirmed) AS variance_cases,
    STDDEV(Confirmed) AS stdev_cases
FROM 
    `corona virus dataset`;
    
-- Qn12: Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS month,
    SUM(Deaths) AS total_deaths,
    AVG(Deaths) AS average_deaths,
    VARIANCE(Deaths) AS variance_deaths,
    STDDEV(Deaths) AS stdev_deaths
FROM 
    `corona virus dataset`
GROUP BY 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m');
    
-- Qn13: Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    COUNT(*) AS total_cases,
    AVG(Recovered) AS average_recovered,
    VARIANCE(Recovered) AS variance_recovered,
    STDDEV(Recovered) AS stdev_recovered
FROM 
    `corona virus dataset`;
-- Qn14. Find Country having highest number of the Confirmed case
SELECT MAX(Confirmed) AS max_confirmed_cases
FROM `corona virus dataset`;
 
-- Qn15:Find Country having lowest number of the death case


-- Q16. Find top 5 countries having highest recovered case
SELECT 
    Country / Region, Recovered
FROM
    `corona virus dataset`
ORDER BY Recovered DESC
LIMIT 5;

							-- END OF PROJECT