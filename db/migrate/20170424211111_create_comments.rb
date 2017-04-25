class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :post_id, null: false
      t.integer :comment_id
      t.string :content, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :comment_id
  end
end
