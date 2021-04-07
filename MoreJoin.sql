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

//13 *
select name
from actor join casting on actor.id = casting.actorid
where ord = 1
group by name
having count(ord)>=15
order by name asc
                
//14
select title,count(actorid)
from movie 
join casting on movieid = movie.id
join actor on casting.actorid = actor.id
where yr = 1978
group by title
order by count(actorid) desc, title

//15
select name
from actor
join casting on casting.actorid = actor.id
join movie on movie.id = casting.movieid
where actor.name != 'Art Garfunkel' and movie.id =
any(select movie.id
from movie
join casting on casting.movieid = movie.id
join actor on actor.id = casting.actorid
where actor.name = 'Art Garfunkel')  
