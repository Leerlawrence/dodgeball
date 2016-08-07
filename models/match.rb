require( 'pg' )
require_relative('../db/sql_runner')

class Match

  # attr_reader( :id, :name )
  attr_reader(:id, :home_team_id, :away_team_id, :home_team_score, :away_team_score)

  def initialize( options )
    #id = options['id'].to_i
    @home_team_id= options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    
    # @match_date = options['matchDate'].to_s
  end

  def save()

  puts "saving match "+home_team_id.to_s  + "|"+away_team_id.to_s+ "|"+away_team_score.to_s+ "|"+home_team_score.to_s
sql = "INSERT INTO Matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES ('#{ home_team_id }', '#{ @away_team_id }', '#{ @home_team_score }', '#{ @away_team_score }') RETURNING *"


     result = SqlRunner.run( sql )
     # result = match.map { |match| Match.new( Match ) }
     return result


    # home_team_id = Match['home_team_id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM Matches"
    match = SqlRunner.run( sql )
    result = match.map { |match| Match.new( Match ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM Matches"
    SqlRunner.run(sql)
  end


end