class User < ActiveRecord::Base
	self.table_name = "users"

	has_sercure_password
	
end