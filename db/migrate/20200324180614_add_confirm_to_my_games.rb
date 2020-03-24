class AddConfirmToMyGames < ActiveRecord::Migration[5.1]
  def change
    add_column :my_games, :confirm, :integer
  end
end
