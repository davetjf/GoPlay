class AddConfirmThreeToDoubles < ActiveRecord::Migration[5.1]
  def change
    add_column :doubles, :confirm_three, :integer
  end
end
