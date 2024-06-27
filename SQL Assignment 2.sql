# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select Name, Population from city where Name like 'ping%' order by Population asc;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select Name, Population from city where Name like 'ping%' order by Population desc;

# 3: Count all cities
select count(*) as Total_cities from city;

# 4: Get the average population of all cities
select avg(Population) as avg_population from city;

# 5: Get the biggest population found in any of the cities
select max(Population) as biggest_population from city;

# 6: Get the smallest population found in any of the cities
select min(Population) as smallest_population from city;

# 7: Sum the population of all cities with a population below 10000
select sum(Population) as total_population_below_10000 from city where population < 10000;

# 8: Count the cities with the countrycodes MOZ and VNM
select count(*) as city_count from city where countrycode in ('moz','vnm');

# 9: Get individual count of cities for the countrycodes MOZ and VNM
select count(*) as city_count from city where countrycode in ('moz','vnm')group by countrycode;

# 10: Get average population of cities in MOZ and VNM
select avg(population) as avg_population from city where countrycode in ('moz','vnm')group by countrycode;

# 11: Get the countrycodes with more than 200 cities
select countrycode, count(*) as city_count from city group by countrycode  having count(*) > 200;

# 12: Get the countrycodes with more than 200 cities ordered by city count
select countrycode, count(*) as city_count from city group by countrycode  having count(*) > 200 order by city_count asc;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select cl.language from countrylanguage cl 
join city c on cl.CountryCode = c.CountryCode
where c.population between 400 and 500;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select c.Name, cl.Language from countrylanguage cl,city c 
where c.population between 500 and 600 and c.countrycode = cl.countrycode;

select c.Name, cl.Language from city c 
join countrylanguage cl on c.countrycode = cl.countrycode
where c.population between 500 and 600;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select c.name from city c where
 c.countrycode in (select a.countrycode from city a where population = 122199); 

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select c.name from city c where 
c.countrycode in (select a.countrycode from city a where population = 122199) and
c.name not in  (select a.name from city a where population = 122199); 

# 17: What are the city names in the country where Luanda is capital?
select a.name from city a where a.countrycode in 
(select b.name from country b where b.capital = 'Luanda');

select a.name from city a 
join country b on a.countrycode = b.code
where b.capital = 'Luanda';

# 18: What are the names of the capital cities in countries in the same region as the 
#     city named Yaren
select a.capital from country a where a.region in 
(select b.region from country b, city c where b.code = c.countrycode and c.name = 'Yaren');  
 

# 19: What unique languages are spoken in the countries in the same region 
#      as the city named Riga
select distinct a.LANGUAGE from CountryLanguage a
join country b on a.countrycode = b.code
join city c on b.code = c.Countrycode 
where b.region in (select region from country d, city e where e.name = 'Riga');        


# 20: Get the name of the most populous city
select name from city 
order by population desc 
limit 1;