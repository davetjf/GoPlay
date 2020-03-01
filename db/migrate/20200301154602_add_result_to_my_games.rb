class AddResultToMyGames < ActiveRecord::Migration[5.1]
  def change
    add_column :my_games, :result, :string
  end
end
