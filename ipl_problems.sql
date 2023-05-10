--IPL project
select * from Deliveries;
select * from Matches;

--Number of matches played per year in ipl
select season,count(*) from matches group by season order by season;

--Number of matches won by all team by all year
select winner,count(*) from matches where winner!='' group by winner;

-- for the year 2016 extra runs conceded per team 
select batting_team,sum(extra_runs) as "totalExtraRuns" from deliveries where match_id in(select id from matches where season=2016) group by batting_team;

-- for year 2015 get top economical bowler
select bowler,sum(wide_runs+noball_runs+batsman_runs) as runs,count(CASE WHEN wide_runs=0 AND noball_runs = 0 THEN 1 END) as balls, TRUNC(cast(sum(wide_runs+noball_runs+batsman_runs)as DECIMAL)/ (count(CASE WHEN wide_runs=0 AND noball_runs = 0 THEN 1 END)/6),2) as economy
from deliveries 
where match_id in (select id from matches where season=2015) 
group by bowler
order by economy ;

