feature 'the player has properties' do
  scenario 'the player has hit points' do
    sign_in_and_play_two_player
    expect(page).to have_content "Hit points: 100"
  end
end
