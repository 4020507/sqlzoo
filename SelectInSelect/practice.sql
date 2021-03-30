//https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

//5

select name, concat(format(round(100 * population /(select population from world where name = 'Germany'),0),'#0'),'%')
from world
where continent = 'Europe'

//6
select name
from world
where gdp > ALL(select gdp from world where continent = 'Europe' and gdp>=0) and continent != 'Europe'

//7
select continent, name, area
from world x
where area >= ALL 
(select area from world y
where x.continent = y.continent and area>0)

//8
select continent, name
from world x
where name <= ALL(select name from world y where x.continent = y.continent)

//9
select name,continent,population
from world x
where 25000000 >= ALL (select population from world y where x.continent = y.continent)

//10
select name,continent
from world x
where population > ALL(select population * 3 from world y where x.continent = y.continent and population > 0 and x.name != y.name)
