class Game < ActiveRecord::Base
	self.table_name = "games"
	belongs_to :user
end