-- 1. Select all the actors with the first name ‘Scarlett’.
USE sakila;

SELECT * FROM sakila.actor;
SELECT * FROM sakila.actor
WHERE first_name = "Scarlett";

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT * FROM sakila.rental;
SELECT * FROM sakila.rental
WHERE (rental_id IS NOT NULL) AND (rental_id = ' ');
SELECT count(DISTINCT rental_id) FROM sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * FROM sakila.film;
SELECT min(length) as min_duration, max(length) as max_duration FROM sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT sec_to_time(AVG(length)) AS duration FROM sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT * FROM sakila.actor;
SELECT count(DISTINCT(last_name)) AS diferent_actors FROM sakila.actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT * FROM sakila.rental;
SELECT datediff(max(rental_date),min(rental_date)) as days_operating FROM sakila.rental
WHERE rental_date IS NOT NULL;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(CONVERT(left(rental_date,10),date), '%M') AS 'month', date_format(CONVERT(left(rental_date,10),date), '%D') AS 'weekday' FROM sakila.rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id,rental_date, 
CASE
WHEN DAYOFWEEK(rental_date) IN (1,7) then 'weekend'
WHEN DAYOFWEEK(rental_date) IN (2,3,4,5,6) then 'workday'
ELSE 'No status'
END AS 'day_type'
FROM sakila.rental;


-- 9. Get release years.
SELECT distinct(release_year) FROM sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT * FROM sakila.film;
SELECT count(*) FROM sakila.film WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT count(*) FROM sakila.film WHERE title LIKE '%APOLO';

-- 12. Get 10 the longest films.
SELECT * FROM sakila.film ORDER BY LENGTH(length) DESC LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT count(*) FROM sakila.film WHERE special_features LIKE '%Behind the Scenes%';

