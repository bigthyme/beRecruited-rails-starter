class LeaderboardController < ApplicationController
  
  def index
    @teams = Team.all
  end

  def show	
    @team = Team.find(params[:id])
    @user = User.find(params[:id])

    @user_ids = Favorite.where(:team_id => @team.api_team_id).order('current_points DESC').select(:user_id).limit(5).all
    @leaders = Favorite.where(:team_id => @team.api_team_id).order('current_points DESC').limit(5).all
    
    external_ids = @user_ids.map(&:user_id)
    @full_name = User.where(:api_user_id => external_ids).select(:first_name).select(:last_name)
  end
    
    def new

    # Team GET Call and store
        team_response = HTTParty.get('http://br-interview-api.heroku.com/teams')
        team_data = JSON.parse(team_response)
        
        team_data.each do |line|
          t = Team.new
          t.name = line['team']['name']
          t.nick = line['team']['nick']
          t.api_team_id = line['team']['id']
          
          t.save
        end

    # User GET Call and store
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
    end
end
