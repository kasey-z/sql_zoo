1.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

2. 
SELECT id,stadium,team1,team2
  FROM game 
  where id = 1012

3.
SELECT goal.player,goal.teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid)
  where goal.teamid = 'GER'

4.
select team1, team2, goal.player 
 FROM game JOIN goal ON (id=matchid)
where goal.player LIKE 'Mario%'

5.
SELECT player, teamid, eteam.coach,gtime
  FROM goal 
JOIN eteam on teamid=id
 WHERE gtime<=10

6.
select mdate,eteam.teamname
from game 
JOIN eteam ON (team1=eteam.id)
where eteam.coach = 'Fernando Santos'

7.
select player from goal 
join game on id=matchid 
where game.stadium = 'National Stadium, Warsaw'

8.
SELECT distinct player 
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') and goal.teamid != 'GER'

9.
SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 group BY teamname

10.
select stadium, count(player) FROM game JOIN goal ON (id=matchid) group by stadium

11.
SELECT matchid, mdate, COUNT(player)
  FROM game JOIN goal ON matchid = id 
 where team1 = 'POL' OR team2 = 'POL'
group by matchid, mdate

12.
select matchid, mdate, count(player)
FROM game JOIN goal ON matchid = id 
 where teamid = 'GER'
group by matchid, mdate

13.
SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game left JOIN goal ON matchid = id
group by mdate,team1,team2
order by mdate,matchid, team1,team2


