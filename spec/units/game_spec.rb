require_relative '../../lib/app'
require_relative '../../lib/game'
require 'capybara/rspec'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  describe '#player_1' do
     it 'retrieves the first player' do
       expect(game.player_1).to eq player_1
     end
   end

   describe '#player_2' do
     it 'retrieves the second player' do
       expect(game.player_2).to eq player_2
     end
   end

  #  describe '#attack' do
  #   it 'damages the player' do
  #     expect(game.player_2).to receive(:take_damage)
  #     game.attack(game.player_2)
  #   end
  # end

  context 'when considering turns'
    describe '#current_turn' do
      it 'starts with player 1' do
        expect(game.current_turn).to eq player_1
      end
    end

    describe '#switch_turns' do
      it 'switches the turn' do
        game.switch_turns
        expect(game.current_turn).to eq player_2
      end
    end


end
