-- lab-sql-7

use sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated?

SELECT 
    last_name, COUNT(*) AS n_last_names
FROM
    sakila.actor
GROUP BY last_name
HAVING n_last_names = 1;

-- 2. Which last names appear more than once? 

SELECT 
    last_name, COUNT(*) AS n_last_names
FROM
    sakila.actor
GROUP BY last_name
HAVING n_last_names <> 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.

SELECT 
    staff_id, COUNT(*) AS n_rentals
FROM
    sakila.rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.

SELECT 
    release_year, COUNT(*) AS n_films
FROM
    sakila.film
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there.

SELECT 
    rating, COUNT(*) AS n_films
FROM
    sakila.film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. 
-- Round off the average lengths to two decimal places.

SELECT 
    rating, ROUND(AVG(length), 2) AS avg_length
FROM
    sakila.film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

SELECT 
    rating, ROUND(AVG(length), 2) AS avg_length
FROM
    sakila.film
GROUP BY rating
HAVING avg_length > 120;