class LeaderboardController < ApplicationController
  def index
    # TODO: Fetch team based on dropdown selection 
    # @team = ?
    @teams = Team.all
    @users = User.all
    @favorites = Favorite.all
    # >> Outputs all the teams in the db
    # TODO: Fetch top 5 leaders for this team
    # @leaders = ?
    
    # TEAMS GET CALL
    # team_response = HTTParty.get('http://br-interview-api.heroku.com/teams')
    # @team = JSON.parse(team_response)
    # @team.each {|line| puts line['team']['name']}

    # USERS GET CALL
      # user_response = HTTParty.get('http://br-interview-api.heroku.com/users')
      # @user = JSON.parse(user_response)
      # @user.each {|line| puts line['user']['id']}

    # FAVORITES GET CALL
      # favorite_response = HTTParty.get('http://br-interview-api.heroku.com/favorites')
      # @favorite = JSON.parse(favorite_response)
      # @favorite.each {|line| puts line['favorite']['user_id']}
  end

  def show	
    #Team GET Call and store
    team_response = HTTParty.get('http://br-interview-api.heroku.com/teams')
    team_data = JSON.parse(team_response)
    
    team_data.each do |line|
      t = Team.new
      t.name = line['team']['name']
      t.nick = line['team']['nick']
      t.api_team_id = line['team']['id']
      
      t.save
    end

    #User GET Call and store
    user_response = HTTParty.get('http://br-interview-api.heroku.com/users')
    user_data = JSON.parse(user_response)
    
    user_data.each do |line|
      u = User.new
      u.first_name = line['user']['first_name']
      u.last_name = line['user']['last_name']
      u.api_user_id = line['user']['id']  
      u.points = line['user']['points']
      u.points_last_week = line['user']['points_last_week']
      
      u.save
    end 

    #Favorite GET Call and store
    fav_response = HTTParty.get('http://br-interview-api.heroku.com/favorites')
    fav_data = JSON.parse(fav_response)
    
    fav_data.each do |line|
      f = Favorite.new
      f.current_points = line['favorite']['current_points']
      f.last_week_points = line['favorite']['last_week_points']
      f.user_id = line['favorite']['user_id']
      f.team_id = line['favorite']['team_id']
      
      f.save
    end

    def create
      #Do Something
    end
  end
end
