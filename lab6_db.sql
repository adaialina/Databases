--1
--a
select * from dealer cross join client;

select *
from dealer d full outer join client c on d.id = c.dealer_id;

--b
select *
from dealer d full outer join client c on d.id = c.dealer_id
    full outer join sell s on d.id = s.dealer_id;

--c
select d.name, d.location, c.name, c.city
from dealer d full outer join client c on d.id = c.dealer_id
where d.location = c.city;

--d
select s.id, s.amount, c.name, c.city
from sell s full outer join client c on s.client_id = c.id
where s.amount between 100 and 500;

--e
select distinct on (dealer.id) dealer.id, dealer.name, client.id, client.name from dealer
    left join client on dealer.id = client.dealer_id;

--f
select client.name, client.city,dealer.name, dealer.charge
    from dealer full outer join client on dealer.id = client.dealer_id;

--g
select dealer.name, client.name, client.city, dealer.charge
    from dealer full outer join client on dealer.id = client.dealer_id
    where dealer.charge > 0.12;

--h
select distinct on (client.id) client.id, client.name, client.city, sell.id, sell.date, sell.amount,
    dealer.id, dealer.name, dealer.charge
        from client left join sell on client.id = sell.client_id
            left join dealer on sell.dealer_id = dealer.id;

--i
select dealer.id, dealer.name, client.id, client.name, client.priority, sell.id, sell.amount
    from dealer full outer join client on dealer.id = client.dealer_id
        full outer join sell on dealer.id = sell.client_id
where sell.amount > 2000 and client.priority is not null;






--2
--a
create view unique_c as select distinct count(client.id), avg(sell.amount), sum(sell.amount), sell.date
    from client full outer join sell on client.id = sell.client_id
    group by date;
select  * from unique_c;

--b
create view top5 as select distinct count(client.id), avg(sell.amount), sum(sell.amount)
    from client full outer join sell on client.id = sell.client_id
    group by date order by sum(sell.amount) desc limit 5;
select * from top5;

--c
create view d_cnt as select distinct dealer.id as dealer_id, count(sell.id) as n_of_sales,
    avg(sell.amount) as avg_amount, sum(sell.amount) as total_sell
    from dealer full outer join sell on dealer.id = sell.dealer_id
    group by dealer.id;
select * from d_cnt;

--d
create view total as select distinct d.location, count(d.id), sum(s.amount) * d.charge as total
    from dealer d full outer join sell s on d.id = s.dealer_id
    group by d.location, d.charge;
select * from total;

--e
create view d_loc as select d.location, count(s.id), avg(s.amount), sum(s.amount)
    from dealer d full outer join sell s on d.id = s.dealer_id
    group by d.location;
select * from d_loc;

--f
create view c_city as select c.city, count(s.id), avg(s.amount), sum(s.amount)
    from client c full outer join sell s on c.id = s.client_id
    group by c.city;
select * from c_city;

--g
create view tot_exp as select  c.city, sum(s.amount)
from client c full outer join sell s on c.id = s.client_id
group by c.city;

create view tot_sales as select  d.location, sum(s.amount)
from dealer d full outer join sell s on d.id = s.dealer_id
group by d.location;

select *
from tot_exp e inner join tot_sales s on e.city = s.location
where e.sum>s.sum;


