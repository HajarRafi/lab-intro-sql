-- lab-sql-5
use sakila;

-- 1. Drop column picture from staff.

ALTER TABLE sakila.staff DROP picture;

-- check
SELECT 
    *
FROM
    sakila.staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly.

-- check
SELECT 
    *
FROM
    sakila.staff;
    
SELECT 
    *
FROM
    sakila.customer
WHERE
    first_name LIKE 'TAMMY'
        AND last_name LIKE 'SANDERS';

-- apply        
INSERT INTO staff VALUES ('3', 'Tammy', 'Sanders', '5', 'Tammy.Sanders@sakilastaff.com', '2', '1', 'Tammy', Null, current_timestamp);

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.

-- check
SELECT 
    *
FROM
    sakila.rental;

SELECT 
    film_id
FROM
    sakila.film
WHERE
    title = 'Academy Dinosaur'; -- film_id = 1
    
SELECT 
    inventory_id
FROM
    sakila.inventory
WHERE
    film_id = 1 AND store_id = 1; -- inventory_id = 1

SELECT 
    customer_id
FROM
    sakila.customer
WHERE
    first_name = 'CHARLOTTE'
        AND last_name = 'HUNTER'; -- customer_id = 130

SELECT 
    staff_id
FROM
    sakila.staff
WHERE
    first_name = 'Mike'; -- staff_id = 1
    
-- apply
INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (current_timestamp, 1, 130, null, 1, current_timestamp);

SELECT 
    *
FROM
    sakila.rental
ORDER BY rental_id DESC
LIMIT 5;

-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, 
-- email, and the date for the users that would be deleted.

-- Check if there are any non-active users

SELECT 
    *
FROM
    sakila.customer
WHERE
    active = 0;

-- Create a table backup table as suggested

CREATE TABLE deleted_users (
    customer_id SMALLINT UNIQUE NOT NULL,
    email VARCHAR(50) DEFAULT NULL,
    last_update TIMESTAMP
);

-- Insert the non active users in the table backup table

INSERT INTO sakila.deleted_users 
SELECT customer_id, email, current_timestamp AS last_update 
FROM sakila.customer WHERE active = 0;

-- check
SELECT 
    *
FROM
    sakila.deleted_users;
    
-- Delete the non active users from the table customer

DELETE FROM sakila.customer 
WHERE
    active = 0; -- not possible because of safe mode
