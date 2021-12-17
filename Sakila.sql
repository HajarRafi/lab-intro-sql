-- lab-intro-sql

-- 1. Use sakila database.

use sakila;

-- 2. Get all the data from tables actor, film and customer.

SELECT 
    *
FROM
    sakila.actor,
    sakila.film,
    sakila.customer;

-- 3. Get film titles.

SELECT DISTINCT
    title
FROM
    sakila.film;

-- 4. Get unique list of film languages under the alias language. 

SELECT DISTINCT
    name AS language
FROM
    sakila.language;

-- 5.1 Find out how many stores does the company have?

SELECT 
    COUNT(store_id)
FROM
    sakila.store;

-- 5.2 Find out how many employees staff does the company have?

SELECT 
    COUNT(staff_id)
FROM
    sakila.staff;

-- 5.3 Return a list of employee first names only?

SELECT 
    first_name
FROM
    sakila.staff;

