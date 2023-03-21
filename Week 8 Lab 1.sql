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
 where film_id in (Select film_id from film where title = "Alone Trip"))

#4




