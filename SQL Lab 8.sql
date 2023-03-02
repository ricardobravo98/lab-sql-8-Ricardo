select rank() over (order by length asc) as 'Rank', length, title
from film
where length IS NOT NULL;

-- Q2. Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
select rank() over (order by length asc) as 'Rank', length, title, rating
from film
where length IS NOT NULL;

-- Q3. How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
select COUNT(film_id) as 'Number of films', name, category_id from film_category f
join category c using(category_id) 
GROUP BY name;

-- Q4. Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
select COUNT(actor_id) 'Number of appearances', first_name, last_name, actor_id from actor a
join film_actor f using(actor_id) 
GROUP BY actor_id;

-- Q5. Which is the most active customer (the customer that has rented the most number of films)?
-- Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.
select count(rental_id) 'Count of Rentals', customer_id 'ID', first_name, last_name from rental
join inventory i using(inventory_id)
join film using(film_id)
join customer using(customer_id)
group by customer_id
order by count(rental_id) DESC
LIMIT 1;