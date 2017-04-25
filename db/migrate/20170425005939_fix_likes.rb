class FixLikes < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :likeable_type, :string
  end
end
