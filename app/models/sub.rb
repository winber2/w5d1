class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :postsubs,
    class_name: :Postsub,
    primary_key: :id,
    foreign_key: :sub_id,
    dependent: :destroy,
    inverse_of: :sub

  has_many :posts,
    through: :postsubs,
    source: :post

end
