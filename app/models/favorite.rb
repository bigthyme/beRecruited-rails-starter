class Favorite < ActiveRecord::Base
	attr_accessor :user_id, :team_id, :current_points, :last_week_points
	belongs_to :users
	belongs_to :teams
end
