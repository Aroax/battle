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

  post '/attack' do
    if params[:player_1_attack]
      attack(:player_1_HP)
    elsif params[:player_2_attack]
      attack(:player_2_HP)
    end
    redirect('/play')
  end

  def attack(player)
    session[player] -= rand(10..20)
  end

  run! if app_file == $0
end

  private

  def hit
  end
# Ideas:
# TurnOrder class (can implement += to skip player turns etc)
