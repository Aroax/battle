require_relative '../../lib/app'
require_relative '../../lib/hitpoints'
require 'capybara/rspec'

feature "it's possible to enter player names" do
  scenario 'entering names' do
    sign_in_and_play_two_player

    expect(page).to have_content "Red" && "Blue"
  end
end
