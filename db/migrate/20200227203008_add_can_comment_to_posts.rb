class AddCanCommentToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :canComment, :boolean
  end
end
