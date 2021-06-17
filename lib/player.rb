class Player
  attr_reader :name, :hit_points
  attr_writer :hit_points
  MAX_HP = 100
  MIN_HP = 0

  def initialize(name, hitpoints=MAX_HP)
    @name = name
    @hit_points = hitpoints
  end

  def take_damage
    damage = rand(10..20)
    @hit_points -= damage
    "The attack hits for #{damage} HP!"
  end

  def miss
    "Oh no! The attack misses!"
  end

  # damage = rand(10..20)
  # target = session[player]
  # target.hit_points -= damage
  # session[:hit_message] = "The attack hits for #{damage} HP!"

end
