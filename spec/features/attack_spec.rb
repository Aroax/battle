require_relative '../../lib/app'
require 'capybara/rspec'
require_relative '../../lib/hitpoints'

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature "it has attack feature" do
  scenario "player 1 can attack player 2" do
    sign_in_and_play
    click_button('Attack Player 2')
    expect(page).to have_content "Hit points: 80"
  end
end
