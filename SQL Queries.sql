create database e_commerce;
use e_commerce;
select * from orders;
select * from order_items;
select * from translation;
select * from olist_orders_dataset;
alter table orders modify order_id varchar(50);
## create index to make foreign keys!!
create index indx_order_id on order_items(order_id);
#_______________________________________________________________________
# No. of Orders
select concat(round(count(order_id)/1000,2),' K') 'No_of_Orders' from orders;

# Sales Amount
select concat(round(sum(payment_value)/1000000,2),' M') Sales_Amount from payments;

# Profit
select concat(round(((select sum(payment_value) from payments)-(select sum(price)+sum(freight_value) from order_items))/1000,2),' K') Profit;

# No of Customers
select concat(round((count(distinct customer_unique_id))/1000,2),' K') No_of_Customers from customers;

# Orders on weekdays (0-4) weekends (5-6)
select concat(round((sum(if(weekday(order_purchase_timestamp)<5,1,0))/1000),2),' K') orders_Weekdays,
concat(round((sum(if(weekday(order_purchase_timestamp)>4,1,0))/1000),2),' K') orders_Weekends from orders;

# No. orders 'credit card' and review rating '5'.
select count(a.order_id) from orders a join payments b on a.order_id=b.order_id join reviews c 
on a.order_id=c.order_id where payment_type like 'credit_card' and review_score=5;
									#DOUBT#
select count(a.order_id) from orders a join (select distinct order_id, payment_type from payments) b on a.order_id=b.order_id join reviews c 
on a.order_id=c.order_id where payment_type like 'credit_card' and review_score=5;

# Avg No delivery days by Pet_store
select avg(if(a.order_purchase_timestamp is not null and a.order_delivered_customer_date is not null, 
datediff(a.order_delivered_customer_date,a.order_purchase_timestamp), null)) delivery_days from orders a join
order_items b on a.order_id=b.order_id join products c on c.product_id=b.product_id join translation d on d.ï»¿product_category_name=c.product_category_name
where ï»¿product_category_name='pet_shop';

# Avg Amount Values of Sao
select avg(a.freight_value), avg(a.price), avg(a.freight_value+a.price), avg(b.payment_value), avg(b.payment_value-a.freight_value-a.price) from orders m
join order_items a on m.order_id=a.order_id join payments b on m.order_id=b.order_id join customers d on m.customer_id=d.customer_id
where customer_city like 'sao paulo';
										#DOUBT#
select avg(a.freight_value), avg(a.price), avg(a.freight_value+a.price), avg(b.payment_value), avg(b.payment_value-a.freight_value-a.price) from orders m
join (select distinct order_id, freight_value, price from order_items) a on m.order_id=a.order_id 
join (select distinct order_id, payment_value from payments) b on m.order_id=b.order_id 
join customers d on m.customer_id=d.customer_id
where customer_city like 'sao paulo';


# Top 5 Cateogries with Density (g/cm3)
select b.product_category_name_english, avg(product_weight_g/(product_length_cm*product_height_cm*product_width_cm)) from 
products a join translation b on a.product_category_name=b.product_category_name_english group by 1 order by 2;

# top 5 states with sales
select c.customer_state, sum(b.payment_value) from orders a join payments b 
on a.order_id=b.order_id join customers c on a.customer_id=c.customer_id group by 1
order by 2 desc limit 5;

# top 3 Categories with sales
select e.product_category_name_english, sum(c.payment_value) sales from orders a join order_items b on a.order_id=b.order_id
join payments c on a.order_id=c.order_id join products d on d.product_id=b.product_id
join translation e on e.ï»¿product_category_name=d.product_category_name group by 1 order by 2 desc limit 3;

# Proft by Year
select distinct year(str_to_date(a.order_purchase_timestamp,'%Y-%m-%d %H:%i:%s')) year,
sum(b.payment_value-(c.freight_value+c.price)) profit from orders a join payments b 
on a.order_id=b.order_id join order_items c on a.order_id=c.order_id group by 1 order by 2;

# avg Delivery days by Review Score
select review_score, avg(if(a.order_delivered_customer_date is not null, 
datediff(a.order_delivered_customer_date,a.order_purchase_timestamp), null)) delivery_days 
from orders a join reviews b on a.order_id=b.order_id group by 1 order by 1;

# sales trends over time
select distinct year(str_to_date(order_delivered_customer_date,'%Y-%m-%d %H:%i:%s')) from orders order by 1; 
select distinct date(str_to_date(a.order_delivered_customer_date,'%Y-%m-%d %H:%i:%s')),
sum(b.payment_value) from orders a join payments b on a.order_id=b.order_id group by 1 order by 1; 
					#DOUBT# delivered_date DateTime invalid (NULL)
#__________________________________________________________
