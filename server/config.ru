require 'bundler'
Bundler.require

require './models/UserModel'
require './models/GameModel'

require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/GameController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	database : 'overwatch'
	)

map('/games'){run GameController}
map('/user'){run UserController}