class AddTextCommentToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :text_comment, :text
  end
end
