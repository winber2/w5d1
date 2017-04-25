class Comment < ApplicationRecord
  validates :post, :user, :content, presence: true

  belongs_to :user
  belongs_to :post
  has_many :comments,
    dependent: :destroy,
    class_name: :Comment,
    foreign_key: :comment_id

  belongs_to :comment,
    optional: true,
    class_name: :Comment,
    foreign_key: :comment_id

  has_many :likes,
    as: :likeable

end
