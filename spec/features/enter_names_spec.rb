require_relative '../../lib/app'
require 'capybara/rspec'

feature "it's possible to enter player names" do
  scenario 'entering names' do
    visit('/')
    fill_in :player_1, with: "Super Mario"
    fill_in :player_2, with: "Luigi"
    click_button("Start")

    expect(page).to have_content "Super Mario vs. Luigi"
  end
end