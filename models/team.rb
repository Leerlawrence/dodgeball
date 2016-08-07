require( 'pg' )
require_relative('../db/sql_runner')

class Team

  attr_reader( :id, :name , :team_id )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @teamId = options['team_id']
  end

  def save()
    sql = "INSERT INTO teams (name,team_id) VALUES ('#{ @name }', '#{ @teamId }') RETURNING *"
    team = SqlRunner.run( sql ).first
    @id = team['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM teams"
    teams = SqlRunner.run( sql )
    result = teams.map { |team| team.new( team ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end


end