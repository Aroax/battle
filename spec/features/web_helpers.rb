def sign_in_and_play_two_player
  visit('/')
  select("2", from: "Mode")
  click_button("Start")
  fill_in :player_1, with: "Red"
  fill_in :player_2, with: "Blue"
  click_button("Start")
end
