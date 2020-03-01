json.extract! my_game, :id, :game_name, :game_type, :date, :player_one, :player_two, :player_three, :player_four, :isPrivate, :created_at, :updated_at
json.url my_game_url(my_game, format: :json)
