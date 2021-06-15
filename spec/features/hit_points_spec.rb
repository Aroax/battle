require_relative '../../lib/app'
require 'capybara/rspec'
require_relative '../../lib/hitpoints'

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

feature "it shows hit points" do
  let (:max_HP) {HitPoints::MAX_HP}

  scenario "it displays player 2's hit points" do
    visit('/')
    fill_in :player_1, with: "Red"
    fill_in :player_2, with: "Blue"
    click_button("Start")
    expect(page).to have_content "Hit points: 100"
  end
end
