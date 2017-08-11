require 'SecureRandom'

class UserController < ApplicationController

	# post to user/register
	post '/register' do
		user_details = JSON.parse(request.body.read)
		user = User.new

		user.username = user_details["username"]
		user.password = user_details["password"]
		user.token = SecureRandom.hex

		user.save
		user.to_json
	end

	# post to user/register
	post '/login' do
		user_details = JSON.parse(request.body.read)
		user = User.find_by({username: user_details["username"]})
		if user && user.authenticate(user_details["password"])
			user.to_json
		else
			"access denied"
		end

	end

	# pathc to user/:id
	patch '/:id' do
		id = params[:id]
		user = User.find_by(id)
		request_body = JSON.parse(request.body.read)
		user.update_attributes(request_body)
		user.save
		user.to_json

	end

	# delete at user/:id
	delete '/:id' do
		id = params[:id]
		user = User.find_by(id)
		user.destroy

		user.to_json		

	end


end