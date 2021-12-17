-- lab-sql-2

-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT 
    actor_id, first_name, last_name
FROM
    sakila.actor
WHERE
    first_name = 'Scarlett';

-- 2. Select all the actors with the last name ‘Johansson’.

SELECT 
    actor_id, first_name, last_name
FROM
    sakila.actor
WHERE
    last_name = 'Johansson';
    
-- 3. How many films (movies) are available for rent?
    
SELECT 
    COUNT(inventory_id)
FROM
    sakila.inventory;

-- 4. How many films have been rented?

SELECT 
    COUNT(rental_id)
FROM
    sakila.rental;

-- 5. What is the shortest and longest rental period?

SELECT 
    MIN(rental_duration) AS shortest, MAX(rental_duration) AS longest
FROM
    sakila.film;

-- ver2

SELECT 
    MIN(TIMEDIFF(return_date, rental_date)) AS shortest_hours,
    MAX(DATEDIFF(return_date, rental_date)) AS longest_days
FROM
    sakila.rental;
    
-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT 
    MIN(length) AS min_duration, MAX(length) AS max_duration
FROM
    sakila.film;
    
-- 7. What's the average movie duration?

SELECT 
    ROUND(AVG(length)) AS avg_duration
FROM
    sakila.film;

-- 8. What's the average movie duration expressed in format (hours, minutes)?

SELECT 
    SEC_TO_TIME(ROUND(AVG(length)) * 60) AS avg_duration_format
FROM
    sakila.film;
    
-- 9. How many movies longer than 3 hours?

SELECT 
    COUNT(length)
FROM
    sakila.film
WHERE
    length > 180;

-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.

SELECT 
    CONCAT(first_name,
            ' ',
            last_name,
            ' - ',
            LOWER(email))
FROM
    sakila.customer;

-- 11. What's the length of the longest film title?

select max(length(title)) from sakila.film;
