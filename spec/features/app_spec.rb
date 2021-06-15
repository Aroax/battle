require_relative '../../lib/app'
require_relative '../../lib/hitpoints'
require 'capybara/rspec'

feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Enter player names'
  end
end
