# require_relative( 'models/league' )
require_relative( 'models/match' )
require_relative( 'models/team')
require_relative( 'models/league')

require( 'pry-byebug' )
require 'date'

Match.delete_all()
Team.delete_all()

team1 = Team.new({ 'name' => 'Tonys Tigers'  ,'team_id' => 1  })
team2 = Team.new({ 'name' => 'Jays Jackals'  ,'team_id' => 2 })
team3 = Team.new({ 'name' => 'Ricks Rangers' ,'team_id' => 3 })
team4 = Team.new({ 'name' => 'Zsolt Zingers' ,'team_id' => 4 })
#'home_team_id' => homeID,'away_team_id' => awayID,
team1.save()
team2.save()
team3.save()
team4.save() 

cnt=0
for i in 1..4
  
  for k in 1..4

   cnt =cnt +=1
    
homeID=i.to_s
awayID=k.to_s

hts =rand(4)
ats=rand(4)
matchNum=cnt.to_s
if homeID != awayID
 matchNum = Match.new({'home_team_id' => homeID,'away_team_id' => awayID,'home_team_score' => hts,'away_team_score' => ats }) 
# matchNum = Match.new({'home_team_id' => '1','away_team_id' => '2','home_team_score' => '2','away_team_score' =>'3' })
matchNum.save()
end 

cnt += 1
# ('match'+i.to_s).save()
end
end



 
system 'clear'
league1 = League.new('')
 puts league1.getTable()
 # puts league


binding.pry
nil