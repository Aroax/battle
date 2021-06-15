require 'sinatra'
require 'sinatra/reloader' if development?

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/game' do
    @player_1 = params[:player_1]
    @player_2 = params[:player_2]
    erb :game
  end

  run! if app_file == $0
end
