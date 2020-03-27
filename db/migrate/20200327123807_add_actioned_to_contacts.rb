class AddActionedToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :actioned, :integer
  end
end
