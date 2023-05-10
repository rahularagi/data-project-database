-- Creating matches table.
CREATE TABLE matches ( id int, season int, city varchar(50), date varchar(50), team1 varchar(50), team2 varchar(50), toss_winner varchar(50), toss_decision varchar(50), result varchar(50),   dl_applied int, winner varchar(50), win_by_runs int, win_by_wickets int, player_of_match varchar(50), venue varchar(50), umpire1 varchar(50), umpire2 varchar(50), umpire3 varchar(50));
--importing matches.CSV file by import option.

-- Creating deliveries table.
CREATE TABLE deliveries(match_id int,inning int,batting_team varchar(50), bowling_team varchar(50), overs int,ball int,batsman varchar(50),non_striker varchar(50),bowler varchar(50),is_super_over int,wide_runs int,bye_runs int,legbye_runs int,noball_runs int,penalty_runs int,batsman_runs int,extra_runs int,total_runs int,player_dismissed varchar(40),dismissal_kind varchar(40),fielder varchar(40));
--importing deliveries.CSV file by import option.

