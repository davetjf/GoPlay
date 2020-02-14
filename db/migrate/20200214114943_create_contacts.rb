class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :Name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
