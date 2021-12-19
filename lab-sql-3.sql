use sakila;

-- 1. How many distinct (different) actors' last names are there?

SELECT 
    COUNT(DISTINCT last_name)
FROM
    sakila.actor;

-- 2. In how many different languages where the films originally produced?

SELECT 
    COUNT(DISTINCT language_id)
FROM
    sakila.film;

-- 3. How many movies were released with "PG-13" rating?

SELECT 
    COUNT(*)
FROM
    sakila.film
WHERE
    rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.

SELECT 
    title, length, release_year
FROM
    sakila.film
WHERE
    release_year = '2006'
ORDER BY length DESC
LIMIT 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?

SELECT 
    DATEDIFF(MAX(return_date), MIN(rental_date)) AS days_operating
FROM
    sakila.rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.

SELECT 
    rental_id,
    CONVERT(rental_date , DATE) AS rental_date,
    DATE_FORMAT(rental_date, '%M') AS month,
    DATE_FORMAT(rental_date, '%W') AS weekday
FROM
    sakila.rental
LIMIT 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT 
    rental_id,
    CONVERT(rental_date , DATE) AS rental_date,
    CASE
        WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday' , 'Sunday') THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM
    sakila.rental
LIMIT 20;

-- 8. How many rentals were in the last month of activity?

SELECT 
    MAX(DATE_FORMAT(rental_date, '%y%m'))
FROM
    sakila.rental;
    
SELECT 
    COUNT(*)
FROM
    sakila.rental
WHERE
    DATE_FORMAT(rental_date, '%y%m') = '0602';
