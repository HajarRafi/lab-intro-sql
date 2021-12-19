use sakila;

-- 1. Get film ratings.

SELECT DISTINCT
    rating
FROM
    sakila.film;

-- 2. Get release years.

SELECT DISTINCT
    release_year
FROM
    sakila.film;
    
-- 3. Get all films with ARMAGEDDON in the title.

SELECT 
    film_id, title
FROM
    sakila.film
WHERE
    title LIKE '%ARMAGEDDON%';
    
-- 4. Get all films with APOLLO in the title.

SELECT 
    film_id, title
FROM
    sakila.film
WHERE
    title REGEXP 'APOLLO';
    
-- 5. Get all films which title ends with APOLLO.

SELECT 
    film_id, title
FROM
    sakila.film
WHERE
    title LIKE '%APOLLO'; -- REGEXP 'APOLLO$';
    
-- 6. Get all films with word DATE in the title.

SELECT 
    film_id, title
FROM
    sakila.film
WHERE
    title REGEXP '^DATE | DATE | DATE$';
    
-- 7. Get 10 films with the longest title.

SELECT 
    film_id, title
FROM
    sakila.film
ORDER BY LENGTH(title) DESC
LIMIT 10;

-- 8. Get 10 the longest films.

SELECT 
    film_id, title, length
FROM
    sakila.film
ORDER BY length DESC
LIMIT 10;

-- 9. How many films include Behind the Scenes content?

SELECT 
    COUNT(*) AS Behind_the_Scenes_n
FROM
    sakila.film
WHERE
    special_features REGEXP 'Behind the Scenes';
    
-- 10. List films ordered by release year and title in alphabetical order.

SELECT 
    film_id, title, release_year
FROM
    sakila.film
ORDER BY (release_year AND title);
