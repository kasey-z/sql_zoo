1. 
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2. 
select name 
from world
where continent = 'Europe' and gdp/population >
                                 (select gdp/population 
                                  from world 
                                  where name = 'United Kingdom')

3.
select name, continent 
from world 
where continent in 
  (select distinct continent 
   from world 
   where name in ('Argentina', 'Australia')) 
order by name

4.
select name, population 
from world 
where population > 
  (select population 
   from world 
   where name = 'Canada') and population < 
                               (select population 
                                from world 
                                where name = 'Poland')

5.
select name, CONCAT(
                     ROUND(population *100/(select population 
                                            from world 
                                            where name ='Germany'),0)
              ,'%') 
AS population 
from world 
where continent = 'Europe'

6.
select name 
from world 
where gdp > (select max(gdp) 
             from world
             where continent = 'Europe')

7.
select continent, name, area 
from world 
as new 
where area= (select max(area) 
             from world 
             where continent = new.continent)

8.
select continent, name 
from world 
as new 
where name = (select name 
              from world 
              where continent = new.continent 
              order by name 
              limit 1)

9.
select name, continent, population 
from world 
as new 
where (select max(population) 
       from world 
       where continent = new.continent) <= 25000000

10.
select name, continent 
from world 
as new 
where population >= 3* (select population 
                        from world 
                        where continent = new.continent and name != new.name 
                        order by population desc 
                        limit 1 )

                                                                                                                                      