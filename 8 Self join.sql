1. 
select count(*) 
  from stops

2.
select id 
  from stops 
  where name =  'Craiglockhart'

3.
select id,name 
  from stops 
  join route 
    on stops.id = route.stop 
  where num = 4 and company = 'LRT' 

4. 
SELECT company, num, COUNT(*)
  FROM route 
  WHERE stop=149 OR stop=53
  GROUP BY company, num
    having COUNT(*) = 2

5.
SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  WHERE a.stop=53 and b.stop = 149

6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

7.
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop = 137

8.
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'Tollcross'

9.SELECT distinct stopb.name, b.company, b.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'  and b.company = 'LRT'

10.
select t1.num,t1.company,t1.name,t2.num,t2.company
from (SELECT distinct stopb.name, b.company, b.num
      FROM route a JOIN route b ON
      (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
      WHERE stopa.name='Craiglockhart') t1
join (SELECT distinct stopb.name, b.company, b.num
      FROM route a JOIN route b ON
      (a.company=b.company AND a.num=b.num)
      JOIN stops stopa ON (a.stop=stopa.id)
      JOIN stops stopb ON (b.stop=stopb.id)
      WHERE stopa.name='Sighthill'
      order by b.num desc) t2
on t1.name = t2.name