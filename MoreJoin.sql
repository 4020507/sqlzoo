//1
SELECT id, title
 FROM movie
 WHERE yr=1962
 
//2
select yr
from movie
where title = 'Citizen Kane'

//3
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr

//4
select id
from actor
where name = 'Glenn Close'

//5
select id
from movie
where title = 'Casablanca'

//6
select name
from actor
where id  =
any(select actorid from casting where movieid = 
any(select id from movie where title = 'Casablanca')
)

//7
select name
from actor
where id = 
any(select actorid from casting where movieid =
(select id from movie where title = 'Alien')
)

//8
select title
from movie join casting on (movie.id = casting.movieid)
join actor on (casting.actorid = actor.id)
where actor.name = 'Harrison Ford'
