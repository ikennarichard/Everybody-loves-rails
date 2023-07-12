class User < ApplicationRecord

  attr_accessor :name, :photo, :bio, :post_counter
  validates :name, presence: true

  has_many :comments, foreign_key: 'author_id' 
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
end
