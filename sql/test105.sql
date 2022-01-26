-- How many copies of the film Hunchback Impossible exist in the inventory system?
select * from (
	select title, count(inventory_id) as available from film as f
	inner join inventory as inv on f.film_id = inv.film_id
	group by title) as a
where title like "Hunchback Impossible";

-- List all films whose length is longer than the average of all the films.

select film_id, title, length from film
where length > ( 
	select avg(length) from film
)

-- Use subqueries to display all actors who appear in the film Alone Trip.

select ac.actor_id, first_name, last_name from actor as ac
inner join film_actor as fa on ac.actor_id = fa.actor_id
inner join film as fi on fa.film_id = fi.film_id
where title like "Alone Trip";


select ac.actor_id, first_name, last_name from actor as ac
inner join film_actor as fa on ac.actor_id = fa.actor_id
where film_id = 
(
select film_id from film
where title = "Alone Trip" ) ;

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.

select title from film as fi
inner join film_category as fc on fi.film_id = fc.film_id
where category_id = 
(
select category_id from category
where name = "Family")


-- Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information.

select first_name, last_name, country, email from customer as cu
inner join address as ad on cu.address_id = ad.address_id
inner join city as ci on ad.city_id = ci.city_id
inner join country as co on ci.country_id = co.country_id
where country = "Canada"








