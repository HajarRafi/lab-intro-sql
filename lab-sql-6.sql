-- lab-sql-6

use sakila;

DROP TABLE if exists films_2020;
CREATE TABLE `films_2020` (
    `film_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `release_year` YEAR(4) DEFAULT NULL,
    `language_id` TINYINT(3) UNSIGNED NOT NULL,
    `original_language_id` TINYINT(3) UNSIGNED DEFAULT NULL,
    `rental_duration` INT(6),
    `rental_rate` DECIMAL(4 , 2 ),
    `length` SMALLINT(5) UNSIGNED DEFAULT NULL,
    `replacement_cost` DECIMAL(5 , 2 ) DEFAULT NULL,
    `rating` ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') DEFAULT NULL,
    PRIMARY KEY (`film_id`),
    CONSTRAINT FOREIGN KEY (`original_language_id`)
        REFERENCES `language` (`language_id`)
        ON DELETE RESTRICT ON UPDATE CASCADE
)  ENGINE=INNODB AUTO_INCREMENT=1003 DEFAULT CHARSET=UTF8;

-- Add the new films to the database

-- the data was imported via wizard (other options didn't work)
-- check
SELECT 
    *
FROM
    sakila.films_2020;
    
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

-- Update information on rental_duration, rental_rate, and replacement_cost

-- to ignore safe mode
SHOW VARIABLES LIKE 'secure_file_priv'; 
SET sql_safe_updates = 0;

UPDATE sakila.films_2020 
SET 
    rental_duration = 3;

UPDATE sakila.films_2020 
SET 
    rental_rate = 2.99;

UPDATE sakila.films_2020 
SET 
    replacement_cost = 8.99;

-- check
SELECT 
    *
FROM
    sakila.films_2020;
