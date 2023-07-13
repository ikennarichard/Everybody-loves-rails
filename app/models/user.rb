class User < ApplicationRecord
  validates :name, presence: true

  has_many :comments, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy 
  has_many :posts, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy 
  has_many :likes, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy

  def get_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
