describe Player do
  let(:name) { double :name }
  let(:player1) { Player.new(name) }
  let(:player2) { Player.new(name) }

  it 'has a name' do
    expect(player1).to respond_to(:name)
  end

  it 'has hit points' do
    expect(player1).to respond_to(:hit_points)
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player2).to respond_to(:take_damage)
      player1.attack(player2)
    end
  end

  describe '#take_damage' do
    it 'reduces the player hit points' do
      expect { player2.take_damage }.to change { player2.hit_points }
    end
  end
end
