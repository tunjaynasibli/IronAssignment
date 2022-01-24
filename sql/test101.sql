-- Select one column from a table and alias it. Get unique list of film languages under the alias language.

select distinct name as language from language
select * from language


-- 5.1 Find out how many stores does the company have?

select count(distinct store_id) from store;

-- 5.2 Find out how many employees staff does the company have?
select count(staff_id) from staff;

-- 5.3 Return a list of employee first names only?
select first_name from staff;