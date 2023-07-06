-- 1. List all customers who live in Texas.
select first_name, last_name, district
from customer
full join address 
on customer.address_id = address.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with Customer's full name.
select first_name, last_name, amount
from customer
full join payment
on customer.customer_id  = payment.customer_id 
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries).
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
    from payment 
    group by customer_id 
    having sum(amount) > 175 
    order by sum(amount) desc
);

-- 4. List all customers that live in Nepal (use the city table).
select customer.first_name, customer.last_name, country
from customer
full join address 
on customer.address_id = address.address_id 
full join city
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';

-- 5. Which staff member had the most transactions?
select staff.first_name, staff.last_name, count(amount)
from payment
full join staff
on staff.staff_id = payment.staff_id 
group by first_name, last_name
order by count(amount) desc 


-- 6. How many movies of each rating are there?
select rating, count(rating) 
from film 
group by rating; 

-- 7. Show all customers who have made a single paymment above $6.99 (use subqueries.
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by payment.amount, payment.customer_id 
	having amount = 6.99
);


-- 8. How many free rentals did our stores give away?
select rental.rental_id, payment.payment_date, payment.amount
from rental
full join payment 
on rental.rental_id = payment.rental_id 
where payment.payment_date is null and payment.amount is null
order by rental_id desc;