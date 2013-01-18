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
  	# team_response = HTTParty.get('http://br-interview-api.heroku.com/teams')
  	# #Perform 3 separate get calls w/HTTParty
  	# @team = JSON.parse(team_response)
  	# @team.each {|line| puts line['team']['name']}
    response = HTTParty.get('http://br-interview-api.heroku.com/teams')
    team_data = JSON.parse(response)
        @team = team_data.map do |line|
          t = Team.new
          a = line['team']['name']
          t.name = a
          puts t.name
          #
          # set name value however you want to do that
          #t.save!
          t.save!
        end
    
  end
end
