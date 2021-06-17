require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'hitpoints'
require_relative 'player'
require_relative 'game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/player-select' do
    session[:number_of_players] = params[:Mode].to_i
    if session[:number_of_players] == 2
      redirect('/pvp')
    elsif session[:number_of_players] == 1
      redirect('/pvp')
    end
  end

  get '/pvp' do
    erb :enter_names
  end

  post '/game' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    session[:game] = Game.new(player_1, player_2)
    redirect('/play')
  end

  get '/play' do
      # @player_1_name, @player_1_HP, @player_2_name, @player_2_HP, @hit_message = extract_session_state
      @game = session[:game]
      @hit_message = session[:hit_message]
      erb :game
  end

  post '/attack' do
    @game = session[:game]
    if params[:player_1_attack]
      session[:hit_message] = @game.attack(@game.player_2)
    elsif params[:player_2_attack]
      session[:hit_message] = @game.attack(@game.player_1)
    end
    @game.switch_turns
    redirect('/play')
  end

  run! if app_file == $0
end

# Ideas:
# TurnOrder class (can implement += to skip player turns etc)
