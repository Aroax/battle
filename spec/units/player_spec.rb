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

end
