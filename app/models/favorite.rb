class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :team

	def self.top(team, limit = TOP_LIMIT)
    # TODO: Given a team, return the top n users
    	#

  	end

end
