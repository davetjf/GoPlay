class CreateMyGames < ActiveRecord::Migration[5.1]
  def change
    create_table :my_games do |t|
      t.string :game_name
      t.string :game_type
      t.date :date
      t.string :player_one
      t.string :player_two
      t.string :player_three
      t.string :player_four
      t.boolean :isPrivate, :default => false, :null => false

      t.timestamps
    end
  end
end
