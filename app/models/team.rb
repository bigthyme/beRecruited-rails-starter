class Team < ActiveRecord::Base
	#validates :name, :uniqueness => true
	
	has_many :favorites
	has_many :users, :through => :favorites 

	# class << self
	#     def save_data_from_api
	#     response = HTTParty.get('http://br-interview-api.heroku.com/teams')
	#     team_data = JSON.parse(response)
	# 	    teams = team_data.map do |line|
	# 	      t = Team.new
	# 	      t.name = line['team']['name']
	# 	      t
	# 	      # set name value however you want to do that
	# 	      t.save
	# 	    end
	# 	    teams.select(&:persisted?)
	#     end

 #    end     

end
