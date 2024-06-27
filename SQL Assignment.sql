#1: Get a query to return "Hello World", 123
  select 'hello world' as message,123 as id;

# 2: Get everything from the city table
  select * from world.city;

# 3: Get everything on the cities whose district is "aceh"
  select * from world.city where district = 'aceh';
 
 # 4: Get only the name of the cities where the countrycode is "bfa"
  select Name from world.city where CountryCode = 'bfa';

# 5: Get both the name and district of the cities where the countrycode is "tto"
  select Name, District from world.city where CountryCode = 'tto';

# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
   select Name as nm, District as dist from world.city where CountryCode = 'arm';

# 7: Get the cities with a name that starts with "bor"
  select Name from world.city where Name like 'bor%';

# 8: Get the cities with a name that contains the string "orto"
  select Name from world.city where Name like '%orto%';

# 9: Get the cities that has a population below 1000
 select Name from world.city where Population < 1000;
 
# 10: Get the unique countrycodes from the cities that has a population below 1000
select distinct CountryCode from world.city where Population < 1000;

# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
  select Name from world.city where CountryCode = 'UKR' and Population > 1000000;
  
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
select Name from world.city where Population < 200 or Population > 95000000;

# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
  select Name from world.city where CountryCode in ('TJK', 'MRT', 'AND', 'PNG', 'SJM');

# 14: Get the cities with a population between 200 and 700 inclusive
select Name from world.city where Population between 200 and 700;

# 15: Get the countries with a population between 8000 and 20000 inclusive
  select Name from world.country where Population between 8000 and 20000;

# 16: Get the name of the countries with a independence year (indepyear) before year 0
  select Name from world.country where IndepYear < 0;

# 17: Get the countries that has no recorded independence year and a population above 1000000
  select Name from world.country where IndepYear = Null and Population > 1000000;

# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
  select Name from world.country where SurfaceArea < 10 and LifeExpectancy = Null;