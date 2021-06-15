def sign_in_and_play
  visit('/')
  fill_in :player_1, with: "Red"
  fill_in :player_2, with: "Blue"
  click_button("Start")
end