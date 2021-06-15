class HitPoints
  attr_reader :player_1_HP, :player_2_HP
  MAX_HP = 100

  def initialize(hitpoints=MAX_HP)
    @player_1_HP = hitpoints
    @player_2_HP = hitpoints
  end

end
