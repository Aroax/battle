require_relative '../../lib/app'
require_relative '../../lib/hitpoints'
require 'capybara/rspec'

feature "players can switch turns" do
  scenario 'Game recognises player turn' do
    sign_in_and_play_two_player

    expect(page).to have_content "Red's turn"
  end

  scenario "after player 1 attacks. it becomes P2's turn" do
    sign_in_and_play_two_player
    click_button('player_2_attack')
    expect(page).to have_content "Blue's turn"
    expect(page).not_to have_content "Red's turn"
  end

  scenario "Page only displays the opponent's attack button on your turn" do
    sign_in_and_play_two_player
    expect(page).to have_selector(:link_or_button, 'Attack Player 2')
    expect(page).not_to have_selector(:link_or_button, 'Attack Player 1')
  end

end
