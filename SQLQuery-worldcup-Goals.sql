 /*Top 10 Tournaments with the most goals*/
select top(10) Tournament_name,count(goal_id) as totalgoals
from  FIFA_World_Cup_Matches
 group by Tournament_name
 order by Totalgoals desc
 
  /*Top 10 All Time Matches with more goals*/
select top(10) count(goal_id) as totalgoals,match_name,tournament_name
from  FIFA_World_Cup_Matches
 group by match_id , match_name,tournament_name
 order by Totalgoals desc

 /* Top 10 All Time Top scorering teams*/

 select top (10) count(g.goal_id) as total_goals,g.player_team_name
from FIFA_World_Cup_Goals G
 join FIFA_World_Cup_Matches M
 on M.goal_id=g.goal_id
 group by g.player_team_name
 order by total_goals desc

  /*Sorting tournaments by goal per game*/
select m.tournament_name,count(m.goal_id)/count(distinct(m.match_id)) as average_goals
from FIFA_World_Cup_Goals G
 join FIFA_World_Cup_Matches M
 on M.goal_id=g.goal_id
 group by m.tournament_name
 order by average_goals desc

  /* Top 10 All Time Top scorers*/
 select top (10) g.player_team_name,count(g.goal_id) as total_goals,g.given_name,g.family_name
from FIFA_World_Cup_Goals G
 join FIFA_World_Cup_Matches M
 on M.goal_id=g.goal_id
 where g.own_goal = 0
 group by g.playescr_team_name,g.given_name,g.family_name
 order by total_goals de


/*Which team conceded the most own goals in all world cups tournaments*/
select g.player_team_name,count(g.own_goal) as totalowngoals
from FIFA_World_Cup_Goals G
 join FIFA_World_Cup_Matches M
 on M.goal_id=g.goal_id
 where g.own_goal <>0
 group by g.player_team_name
 order by totalowngoals desc
 
 /*Top 20 latest Goals in  The World cup history*/
SELECT TOP(20) g.player_team_name,g.family_name,m.match_name,g.minute_stoppage,
  case  
    when g.own_goal<>0  then 'own goal'
    else ' '
  end
 from FIFA_World_Cup_Goals G
 join FIFA_World_Cup_Matches M
 on M.goal_id=g.goal_id 
 where g.minute_stoppage <>0
 order by g.minute_stoppage desc









