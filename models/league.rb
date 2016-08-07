require( 'pg' )
require_relative('../db/sql_runner')
 require_relative( '../models/match' )
 require_relative( '../models/team')  

class League

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def getTable()
   # sql=select Teams.name, COUNT(Teams.name) From Teams INNER JOIN Matches ON Teams.team_id = Matches.home_team_id 
   # GROUP BY name;
   sql="SELECT * from teams"
    leagueTeams =SqlRunner.run(sql)
    result=leagueTeams  #leagueTeams.map {|team| League.new(team)}
 puts result
  return result
  end
end