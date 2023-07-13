class Post < ApplicationRecord
  validates :title, :text, presence: true
  after_save :update_post_counter

  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy  
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  def get_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
  
  private
  def update_post_counter
    author.increment!(:post_counter)
  end
end
