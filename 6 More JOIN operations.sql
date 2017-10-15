1.
SELECT id, title
 FROM movie
 WHERE yr=1962

2.
select yr 
from movie 
where title = 'Citizen Kane'

3.
select id,title,yr 
from movie 
where title like '%Star Trek%'

4.
select id 
from actor 
where name =  'Glenn Close'

5.
select id 
from actor 
where name =  'Glenn Close'

6.
select name 
from actor 
join casting 
on actor.id = casting.actorid 
where movieid=11768

7.
select name 
from actor 
join casting 
on actor.id = casting.actorid 
join movie 
on casting.movieid = movie.id 
where movie.title = 'Alien'

8.
select movie.title 
from movie 
join casting 
on casting.movieid = movie.id 
join actor 
on actor.id = casting.actorid 
where actor.name = 'Harrison Ford'

9.
select movie.title 
from movie 
join casting 
on casting.movieid = movie.id 
join actor 
on actor.id = casting.actorid 
where actor.name = 'Harrison Ford' and casting.ord != 1

10.
select movie.title,actor.name 
from movie 
join casting 
on casting.movieid = movie.id 
join actor 
on actor.id = casting.actorid 
where movie.yr = 1962 and ord = 1

11.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

12.
SELECT movie.title,actor.name 
FROM  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE movieid IN (
  SELECT casting.movieid  FROM  movie JOIN casting ON movie.id=casting.movieid
         JOIN actor  ON actorid=actor.id
  WHERE actor.name='Julie Andrews') and ord = 1

13.
select name 
from casting 
JOIN actor   
ON actorid=actor.id
where ord = 1 
group by name having count(movieid)>= 30  
order by name asc

14.
select title,count(actorid) 
from movie 
join casting 
on movie.id = casting.movieid 
where yr = 1978
group by title
order by count(actorid) desc, title

15.
select distinct actor.name 
from actor 
join casting 
on actor.id = casting.actorid
where movieid in (select movieid 
                  from actor 
                  join casting 
                  on actor.id = casting.actorid 
                  where name = 'Art Garfunkel' )  and actor.name != 'Art Garfunkel'

                  







