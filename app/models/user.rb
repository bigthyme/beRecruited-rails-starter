class User < ActiveRecord::Base
	has_many :favorites
	has_many :teams, :through => :favorites 

end
