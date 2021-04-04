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

//9
select title
from movie join casting on (movie.id = casting.movieid)
join actor on (casting.actorid = actor.id)
where actor.name = 'Harrison Ford' and casting.ord != 1

//10
select movie.title, actor.name
from movie join casting on (movie.id = casting.movieid)
join actor on (casting.actorid=actor.id)
where movie.yr = 1962 and casting.ord = 1

//11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

//12 *
SELECT title,actor.name FROM movie
join casting on (movie.id=casting.movieid)
join actor on (actor.id = casting.actorid and ord=1)
where movie.id  
in (select casting.movieid from casting
where actorid in (select id from actor where name='Julie Andrews'))

