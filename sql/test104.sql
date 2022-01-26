-- Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store as s
inner join address as ad on s.address_id = ad.address_id
inner join city as ci on ad.city_id = ci.city_id
inner join country as co on ci.country_id = co.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(amount) from store as s
inner join staff as st on s.store_id = st.store_id
inner join payment as pa on st.staff_id = pa.staff_id
group by store_id;

-- What is the average running time(length) of films by category?
select name, avg(length) from category as ca
inner join film_category as fc on ca.category_id=fc.category_id
inner join film as fi on fc.film_id=fi.film_id
group by name;

-- Which film categories are longest(length)? (Hint: You can rely on question 3 output.)
select name, avg(length) as average_length from category as ca
inner join film_category as fc on ca.category_id=fc.category_id
inner join film as fi on fc.film_id=fi.film_id
group by name
order by average_length desc
limit 1;

-- Display the most frequently(number of times) rented movies in descending order.
select title, count(rental_id) as count from rental as r
inner join inventory as i on r.inventory_id = i.inventory_id
inner join film as f on i.film_id = f.film_id
group by f.film_id
order by count desc;

-- List the top five genres in gross revenue in descending order.
select name, sum(amount) as sum from category as ca
inner join film_category as fc on ca.category_id = fc.category_id
inner join inventory as inv on fc.film_id = inv.film_id
inner join rental as re on inv.inventory_id = re.inventory_id
inner join payment as pa on re.rental_id = pa.rental_id
group by name
order by sum desc
limit 5;

-- Is "Academy Dinosaur" available for rent from Store 1?
select title from film as f
inner join inventory as inv on f.film_id = inv.film_id
inner join rental as re on inv.inventory_id = re.inventory_id
where inv.store_id = 1 and f.title = "Academy Dinosaur";


