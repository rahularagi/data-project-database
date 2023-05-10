# 1) Create DB, permission
### Creating new database  in name of demo.
* **CREATE DATABASE demo;**
### Creating new user

* **CREATE LOGIN rahul WITH PASSWORD = 'rahul';**

### Assign the user to the new database as the owner

* **USE demo;**

# 2) Clean up script
### To drop existing 

* **DROP DATABASE demo;**

### To drop the user
* **USE master;**
* **DROP LOGIN rahul;**

# 3) Load CSV
## To load matches.csv and deliveries.csv files in PostgreSQL
### Creating matches table
* **CREATE TABLE matches ( id int, season int, city varchar(50), date varchar(50), team1 varchar(50), team2 varchar(50), toss_winner varchar(50), toss_decision varchar(50), result varchar(50),   dl_applied int, winner varchar(50), win_by_runs int, win_by_wickets int, player_of_match varchar(50), venue varchar(50), umpire1 varchar(50), umpire2 varchar(50), umpire3 varchar(50));**

* **importing matches.CSV file by import option in postgreSQL.**

### Creating deliveries table
* **CREATE TABLE deliveries(match_id int,inning int,batting_team varchar(50), bowling_team varchar(50), overs int,ball int,batsman varchar(50),non_striker varchar(50),bowler varchar(50),is_super_over int,wide_runs int,bye_runs int,legbye_runs int,noball_runs int,penalty_runs int,batsman_runs int,extra_runs int,total_runs int,player_dismissed varchar(40),dismissal_kind varchar(40),fielder varchar(40));**
* **Importing deliveries.CSV file by import option.**



# 4) IPL project 
 ## To check deliveries table and matches table 
 * **select * from Deliveries;**
* **select * from Matches;**

## a) Number of matches played per year in ipl
* **select season,count(*) from matches group by season order by season;**

## b) Number of matches won by all team by all year
* **select winner,count(*) from matches where winner!='' group by winner;**

## c) For the year 2016 extra runs conceded per team 
* **select batting_team,sum(extra_runs) as "totalExtraRuns" from deliveries where match_id in(select id from matches where season=2016) group by batting_team;**

## d) For year 2015 get top economical bowler
* **select bowler,sum(wide_runs+noball_runs+batsman_runs) as runs,count(CASE WHEN wide_runs=0 AND noball_runs = 0 THEN 1 END) as balls, TRUNC(cast(sum(wide_runs+noball_runs+batsman_runs)as DECIMAL)/ (count(CASE WHEN wide_runs=0 AND noball_runs = 0 THEN 1 END)/6),2) as economy
from deliveries 
where match_id in (select id from matches where season=2015) 
group by bowler
order by economy;**






