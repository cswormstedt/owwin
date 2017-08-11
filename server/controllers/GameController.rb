class GameController < ApplicationController
	# get to games
	get '/' do
		token = params[:token]
		user = User.where(token: token)
		user_id = user[0].id

		games = Game.where(user_id: user_id)
		games.to_json

	end

	get '/:id' do

		id = params[:id]
		token = params[:token]
		user = User.where(token: token)
		user_id = user[0].id

		game = Game.find(id)
		game.to_json

	end

	post '/' do
		token = params[:token]
		user = User.where(token: token)
		user_id = user[0].id
		request_body = JSON.parse(request.body.read)
		game = Game.new(request.body.read)
		game["user_id"] = user_id
		game.save
		games = Games.where(user_id: user_id)
		games.to_json

	end

	patch '/:id' do
		token = params[:token]
		user = User.where(token: token)
		user_id = user[0].id
		id = params[:id]
		game = Game.find(id)
		request_body = JSON.parse(request.body.read)
		game.update_attributes(request_body)
		game.save
		games = Game.where(user_id: user_id)
		games.to_json

	end

	delete '/:id' do
		token = params[:token]
		user = User.where(token: token)
		user_id = user[0].id
		id = params[:id]

		game = Game.find(id)
		game.destroy

		game = Game.where(user_id: user_id)
		game.to_json
	end

end