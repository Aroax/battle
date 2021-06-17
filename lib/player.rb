class Player
  attr_reader :name, :hit_points, :alert
  attr_writer :hit_points
  MAX_HP = 100
  MIN_HP = 0

  def initialize(name, hitpoints=MAX_HP)
    @name = name
    @hit_points = hitpoints
    @alert = ""
  end

  def attack(player)
    chance = rand(1..10)
    case chance
    when 4..10
      player.take_damage
    when 1..3
      player.miss
    end
  end

  def take_damage
    damage = rand(10..20)
    @hit_points -= damage
    update_alert("The attack hits for #{damage} HP!")
  end

  def miss
    update_alert("Oh no! The attack misses!")
  end

  def update_alert(string)
    @alert = string
  end

  # damage = rand(10..20)
  # target = session[player]
  # target.hit_points -= damage
  # session[:hit_message] = "The attack hits for #{damage} HP!"

end
