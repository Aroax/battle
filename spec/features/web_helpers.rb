def sign_in_and_play_two_player
  visit('/')
  select("2", from: "Mode")
  click_button("Start")
  fill_in :player_1_name, with: "Red"
  fill_in :player_2_name, with: "Blue"
  click_button("Start")
end
