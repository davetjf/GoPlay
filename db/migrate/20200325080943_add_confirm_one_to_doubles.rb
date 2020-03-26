class AddConfirmOneToDoubles < ActiveRecord::Migration[5.1]
  def change
    add_column :doubles, :confirm_one, :integer
  end
end
