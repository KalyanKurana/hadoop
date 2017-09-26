1.Number of countries participated in olympics
select count(distinct country) from olym;

2.Total number of persons participated in each year each country.
select year,country,count(name) from olym group by year,country;

3.Total number of gold medals won by each country.
select country,sum(gold) from olym group by country;
 
4.Total number of silver medals won by each country.
select country,sum(silver) from olym group by country;
 
5.Total number of bronze medals won by each country.
select country,sum(bronze) from olym group by country; 

6.Which category does more number of medals won.
 
select category,sum(total)as a from olym group by category order by a desc limit 1; 

7.Which game is played more in each country.

select * from (select *,row_number() over (partition by a.country order by a.cnt desc) as rn from (select country,category,count(category)as cnt from olym group by category,country order by country desc) a) b where b.rn=1;

8.Which person won most gold medals for their country

select name,country,sum(gold) from olym group by name,country,gold; 
