class Post < ApplicationRecord
  validates :title, :author, presence: true
  validates :subs, presence: { message: 'Needs at least one sub' }

  has_many :likes,
    as: :likeable

  has_many :subs,
    through: :postsubs,
    autosave: false,
    source: :sub

  has_many :postsubs,
    dependent: :destroy,
    autosave: false,
    inverse_of: :post

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id

  has_many :comments,
    dependent: :destroy

  def at_least_one_sub
    errors[:base] << "Post should have at least one sub" if self.subs.blank?
  end

  def comments_by_parent_id
    hash = Hash.new { |h,k| h[k] = [] }
    comments.includes(:user).each { |comment| hash[comment['comment_id']] << comment }
    hash
  end

end
