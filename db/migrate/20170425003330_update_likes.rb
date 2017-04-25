class UpdateLikes < ActiveRecord::Migration[5.0]
  def change
    drop_table :likes
    create_table :likes do |t|
      t.integer :likeable_id
      t.integer :likeable_type

      t.timestamps
    end

    add_index :likes, [:likeable_id, :likeable_type], unique: true
    add_index :likes, :likeable_id
    add_index :likes, :likeable_type
  end
end
