class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :postsubs, [:post_id, :sub_id], unique: true
    add_index :postsubs, :post_id
    add_index :postsubs, :sub_id
    add_index :posts, :user_id
    add_index :subs, :user_id
  end
end
