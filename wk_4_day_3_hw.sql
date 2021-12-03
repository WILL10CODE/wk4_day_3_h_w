--1. List all customers who live in Texas (use JOINs)
select customer_id,customer.address_id, district
from address
inner join customer
on customer.address_id = address.address_id
where district like 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name,customer.last_name,amount
from payment 
inner join customer 
on customer.customer_id = payment.customer_id
where amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name, email, customer_id
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id 
	having sum(amount) > 175
);

--4.List all customers that live in Nepal (use the city table)
select first_name,last_name
from customer
inner join address
on customer.address_id = address.address_id
inner join city
on city.city_id = address.city_id
inner join country
on country.country_id = city.country_id
where country like 'Nepal';

--5.Which staff member had the most transactions?
select first_name,last_name, COUNT(rental.staff_id)
from staff 
inner join rental
on staff.staff_id = rental.staff_id
group by staff.staff_id
order by count(rental.staff_id);

--6. 6. How many movies of each rating are there?
select rating,COUNT(rating)
from film
group by rating
order by COUNT(rating) desc;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having count(amount) > 6.99
	order by count(amount) desc
);

--8.How many free rentals did our stores give away?
select staff.staff_id, payment.amount,count(payment.amount)
from staff 
left join payment 
on payment.staff_id = staff.staff_id
group by payment.staff_id, staff.staff_id, payment.amount
having payment.amount = 0
order by count(payment.amount);



