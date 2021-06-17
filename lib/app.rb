require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'hitpoints'
require_relative 'player'

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
    session[:player_1_name] = params[:player_1]
    session[:player_2_name] = params[:player_2]
    # session[:number_of_players].times do
    session[:player_1] = Player.new(session[:player_1_name])
    session[:player_2] = Player.new(session[:player_2_name])
    # @HP_Manager = HitPoints.new
    # session[:player_1_HP] = @player_1.hit_points
    # session[:player_2_HP] = @player_2.hit_points
    redirect('/play')
  end

  get '/play' do
      @player_1 = session[:player_1]
      @player_2 = session[:player_2]
      @player_1_name = @player_1.name
      @player_2_name = @player_2.name
      @player_1_HP = @player_1.hit_points
      @player_2_HP = @player_2.hit_points
      @hit_message = session[:hit_message]
      erb :game
  end

  post '/attack' do
    player_1 = session[:player_1]
    player_2 = session[:player_2]
    if params[:player_1_attack]
      player_1.attack(player_2)
      session[:hit_message] = player_1.alert
    elsif params[:player_2_attack]
      player_2.attack(player_1)
      session[:hit_message] = player_2.alert
    end
    # session[:hit_message] = "The attack hits!"
    redirect('/play')
  end

  # def attack(player)
  #   damage = rand(10..20)
  #   target = session[player]
  #   target.hit_points -= damage
  #   session[:hit_message] = "The attack hits for #{damage} HP!"
  # end

  run! if app_file == $0
end

  private

  def hit
  end
# Ideas:
# TurnOrder class (can implement += to skip player turns etc)
