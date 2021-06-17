class Game
  attr_reader :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turns
    @current_turn = opponent(current_turn)
  end

  # private

  def opponent(current_player)
    @players.select { |player| player != current_player }.first
  end

  # def take_damage
  #   damage = rand(10..20)
  #   @hit_points -= damage
  #   "The attack hits for #{damage} HP!"
  # end
  #
  # def miss
  #   "Oh no! The attack misses!"
  # end
end
