class User < ActiveRecord::Base
	attr_accessor :api_user_id, :first_name, :last_name, :points, :points_last_week
	has_many :favorites
	has_many :teams, :through => :favorites 
end
