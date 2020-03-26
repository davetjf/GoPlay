class AddConfirmTwoToDoubles < ActiveRecord::Migration[5.1]
  def change
    add_column :doubles, :confirm_two, :integer
  end
end
