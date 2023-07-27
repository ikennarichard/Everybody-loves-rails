class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true,
                                               greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0 }
  after_save :update_post_counter
  after_destroy :reduce_post_counter

  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:post_counter)
  end

  def reduce_post_counter
    author.decrement!(:post_counter)
  end
end
