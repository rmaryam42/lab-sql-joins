# retrieve the film name and the number of actors who star in the film with film_id = 1

SELECT f.title, COUNT(actor_id) 
FROM film as f
INNER JOIN film_actor as fa
ON f.film_id = fa.film_id
WHERE f.film_id = 1
GROUP BY f.title;

# retrieve the first and the last_names of the actors present in the movie "ACADEMY DINOSAUR"
SELECT first_name,last_name
FROM actor as a
INNER JOIN film_actor as fa
USING(actor_id)
INNER JOIN film as f
USING(film_id)
WHERE f.title = "ACADEMY DINOSAUR";

# syntax from 3 diffferent table using indention in SQL
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = (SELECT film_id
									FROM film
									WHERE title='ACADEMY DINOSAUR'));

SELECT actor_id
FROM film_actor
WHERE film_id = 53;

SELECT film_id
FROM film
WHERE title='ACADEMY DINOSAUR';

# retrieve the titles of movies that belong to the action category with subsquery
SELECT title
FROM film;

SELECT category_id
FROM category
WHERE name = "ACTION";

SELECT title
FROM film
WHERE film_id IN (SELECT film_id
					FROM category
					WHERE category_id = (SELECT category_id
											FROM category
											WHERE name = "ACTION"));
                                            
# retrieve the titles of movies that belong to the action category with join

SELECT title
FROM film
INNER JOIN film_category
USING(film_id)
INNER JOIN category
USING(category_id)
WHERE category.name = "ACTION";

# retrieve the average amount of the payment with subsquery
SELECT payment_id, amount
FROM payment
WHERE amount > (SELECT AVG(amount) as avg_amount
				FROM payment);

# include this children into the parent task above about the payment and average amount
SELECT AVG(amount) as avg_amount
FROM payment;
