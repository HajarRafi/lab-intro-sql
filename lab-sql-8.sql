-- lab-sql-8

use sakila;

-- 1. Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.

SELECT 
    title, length, 
    DENSE_RANK() OVER(ORDER BY length DESC) AS length_rank
FROM
    sakila.film
WHERE
    length <> '' OR length <> ' '
        OR length <> 0;
        
-- 2. Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, rating and the rank.
        
SELECT 
    title, length, rating, 
    DENSE_RANK() OVER(PARTITION BY rating ORDER BY length DESC) AS length_rank
FROM
    sakila.film
WHERE
    length <> '' OR length <> ' '
        OR length <> 0;        
        
-- 3. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

-- check
SELECT 
    *
FROM
    sakila.film_category;
    
SELECT 
    *
FROM
    sakila.category;

-- apply
SELECT 
    f.category_id, COUNT(*) AS n_films, c.name
FROM
    sakila.film_category AS f
        LEFT JOIN
    sakila.category AS c ON f.category_id = c.category_id
GROUP BY f.category_id
ORDER BY n_films DESC;

-- 4. Which actor has appeared in the most films?

-- check
SELECT 
    *
FROM
    sakila.film_actor;
    
SELECT 
    *
FROM
    sakila.actor;

-- apply
SELECT 
    f.actor_id, a.first_name, a.last_name, COUNT(*) AS n_films
FROM
    sakila.film_actor AS f
        LEFT JOIN
    sakila.actor AS a ON f.actor_id = a.actor_id
GROUP BY f.actor_id
ORDER BY n_films DESC
LIMIT 1;

-- 5. Most active customer (the customer that has rented the most number of films).

-- check
SELECT 
    *
FROM
    sakila.customer;
    
SELECT 
    *
FROM
    sakila.rental;

-- apply
SELECT 
    c.customer_id, c.first_name, c.last_name, COUNT(*) AS n_rentals
FROM
    sakila.customer AS c
        RIGHT JOIN
    sakila.rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY n_rentals DESC
LIMIT 1;

-- Bonus: Which is the most rented film?

-- check
SELECT 
    *
FROM
    sakila.inventory;
    
SELECT 
    *
FROM
    sakila.rental;
    
SELECT 
    *
FROM
    sakila.film;
    
-- apply
SELECT 
    f.title, COUNT(*) AS n_rentals
FROM
    sakila.film AS f
        JOIN
    sakila.inventory AS i ON f.film_id = i.film_id
        JOIN
    sakila.rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY n_rentals DESC
LIMIT 1;

        