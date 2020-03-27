class AddDefaultValueToCanCommentAttribute < ActiveRecord::Migration[5.1]
  def change
  	change_column :posts, :canComment, :boolean, default: true
  end
end
