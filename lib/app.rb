require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'hitpoints'

class Battle < Sinatra::Base

  enable :sessions



  get '/' do
    erb(:index)
  end

  post '/game' do
    session[:player_1] = params[:player_1]
    session[:player_2] = params[:player_2]
    @HP_Manager = HitPoints.new
    session[:player_1_HP] = @HP_Manager.player_1_HP
    session[:player_2_HP] = @HP_Manager.player_2_HP
    redirect('/play')
  end

  get '/play' do
      @player_1 = session[:player_1]
      @player_2 = session[:player_2]
      @player_1_HP = session[:player_1_HP]
      @player_2_HP = session[:player_2_HP]

      erb :game
  end

  run! if app_file == $0
end
