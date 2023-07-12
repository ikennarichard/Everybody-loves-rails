class Post < ApplicationRecord
  attr_accessor :title, :text
  validates :title, :text, :presence: true
  belongs_to :user
  has_many :comments, foreign_key: 'post_id' 
  has_many :likes, foreign_key: 'post_id'
end
