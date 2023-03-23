USE Sakila;

#1
Select count(film_id) as number_of_copies from inventory
where film_id in (select film_id from film where title like "%Hunchback impossible%");

#2
Select film_id,title,  length from film  
where length > (select avg(length) from film);

#3
Select actor_id, first_name, last_name from actor 
where actor_id in (Select actor_id from film_actor
 where film_id in (Select film_id from film where title = "Alone Trip"));

#4 Identify all movies categorized as family films.
Select * from film_category;
select * from film;
Select * from category;

Select film_id, title from film 
where film_id in (select film_id from film_category
where category_id in 
(select category_id from category 
where name = "Family"));

#5
 select first_name, last_name,  email 
 from customer
where address_id in ( select address_id  from address
where city_id in ( select city_id  from city
where country_id in ( select country_id from country
where country = "Canada")));

Select first_name, last_name, email 
from customer
join address on address.address_id = customer.address_id
join city  on city.city_id = address.city_id
join country on country.country_id = city.country_id
where country = "Canada";


#6
select film_id, title from film
where film_id in ( select film_id from film_actor
where actor_id = (select actor_id from (select actor_id, count(film_id), row_number() over(order by count(film_id) desc) ranking 
from film_actor group by actor_id) sub1
where ranking = 1));


#8
select customer_id, sum(amount) total_amount_spent from payment
group by customer_id
having total_amount_spent > ( select avg(total) from ( 
select sum(amount) total  from payment
group by customer_id)sub1)
order by sum(amount) asc ;




