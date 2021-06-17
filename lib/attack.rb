class Attack

  def initialize(player)
    @player = player
  end

  def self.run(player)
    new(player).run
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

  def run
    @player.take_damage
  end

end
