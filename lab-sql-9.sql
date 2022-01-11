-- lab-sql-9

use sakila;

-- Create a table rentals_may to store the data from rental table with information for the month of May.

-- check
SELECT 
    *
FROM
    sakila.rental;

DROP TABLE IF EXISTS rentals_may;

CREATE TABLE rentals_may (
    rental_id INT UNIQUE NOT NULL,
    rental_date DATETIME,
    inventory_id INT,
    customer_id INT,
    return_date DATETIME,
    staff_id INT,
    last_update TIMESTAMP
);


-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

INSERT INTO rentals_may 
	(SELECT * FROM rental WHERE MONTH(rental_date) = 5);
    
-- check
SELECT 
    *
FROM
    sakila.rentals_may;

-- Create a table rentals_june to store the data from rental table with information for the month of June.

DROP TABLE IF EXISTS rentals_june;

CREATE TABLE rentals_june (
    rental_id INT UNIQUE NOT NULL,
    rental_date DATETIME,
    inventory_id INT,
    customer_id INT,
    return_date DATETIME,
    staff_id INT,
    last_update TIMESTAMP
);

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

INSERT INTO rentals_june 
	(SELECT * FROM rental WHERE MONTH(rental_date) = 6);
    
-- check
SELECT 
    *
FROM
    sakila.rentals_june;
    
-- Check the number of rentals for each customer for May.

SELECT 
    customer_id, COUNT(*) AS n_rentals_may
FROM
    sakila.rentals_may
GROUP BY customer_id
ORDER BY n_rentals_may DESC;

-- Check the number of rentals for each customer for June.

SELECT 
    customer_id, COUNT(*) AS n_rentals_june
FROM
    sakila.rentals_june
GROUP BY customer_id
ORDER BY n_rentals_june DESC;











