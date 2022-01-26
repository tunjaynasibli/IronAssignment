-- Which actor has appeared in the most films?

select first_name, count(film_id) as num from film_actor as a
inner join actor as b on a.actor_id = b.actor_id
group by first_name
order by num desc
limit 1;

-- Most active customer (the customer that has rented the most number of films)
select first_name, last_name, count(rental_id) as rent_num from rental as a
inner join customer as b on a.customer_id = b.customer_id
group by first_name, last_name
order by rent_num desc
limit 1;

-- List number of films per category.
select name, count(film_id) as film_num from film_category as f
INNER JOIN category as c on f.category_id = c.category_id
group by name;

-- Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff as s
inner join sakila.address as a on s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, SUM(amount) as sum from staff as s
inner join payment as p on s.staff_id = p.staff_id
where payment_date like "2005-08%"
GROUP BY first_name, last_name;

-- List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) as num_actor from film as f
inner join film_actor as fa on f.film_id = fa.film_id
group by title;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name. Bonus: Which is the most rented film? 
-- The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
SELECT first_name, last_name, sum(amount) as total_amount from customer as c
inner join payment as p on c.customer_id = p.customer_id
group by first_name, last_name
order by last_name asc;


select title, count(rental_id) as count from rental as r
inner join inventory as i on r.inventory_id = i.inventory_id
inner join film as f on i.film_id = f.film_id
group by f.film_id
order by count desc
limit 1;









