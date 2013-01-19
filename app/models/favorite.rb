class Favorite < ActiveRecord::Base
	belongs_to :users
	belongs_to :teams

	def self.top(team, limit = TOP_LIMIT)
    # TODO: Given a team, return the top n users
    	#
    
  	end

end
