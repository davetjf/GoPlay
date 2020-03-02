class CreateDoubles < ActiveRecord::Migration[5.1]
  def change
    create_table :doubles do |t|
      t.string :game_name
      t.date :date
      t.string :player_one
      t.string :player_two
      t.string :player_three
      t.string :player_four
      t.string :result

      t.timestamps
    end
  end
end
