require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }
  subject!(:post) { described_class.new(title: 'Working with rails', author: user) }

  describe 'validations' do
    it 'should be valid with a title' do
      post = Post.new(title: 'Fred', author: user)
      expect(post).to be_valid
    end

    it 'should be invalid without a title' do
      post = Post.new(title: nil, author: user)
      expect(post).not_to be_valid
    end

    it 'should be invalid if title exceeds 250 characters' do
      post = Post.new(title: 'Rails' * 251, author: user)
      expect(post).not_to be_valid
    end

    it 'should be valid with a non negative number' do
      post.likes_counter = 0
      expect(post).to be_valid
    end

    it 'should be invalid with a negative post counter' do
      post.likes_counter = -1
      expect(post).not_to be_valid
    end

    it 'should be invalid with a non-integer post counter' do
      post.likes_counter = 3.5
      expect(post).not_to be_valid
    end

    it 'should be valid with a non negative number' do
      post.comments_counter = 0
      expect(post).to be_valid
    end

    it 'should be invalid with a negative post counter' do
      post.comments_counter = -1
      expect(post).not_to be_valid
    end

    it 'should be invalid with a non-integer post counter' do
      post.comments_counter = 3.5
      expect(post).not_to be_valid
    end
  end

  describe 'recent_comments' do
    let!(:post) { create(:post, author: user) }

    it 'should return the five most recent comments' do
      comment1 = create(:comment, post:, author: user, created_at: 2.days.ago)
      comment2 = create(:comment, post:, author: user, created_at: 1.day.ago)
      comment3 = create(:comment, post:, author: user, created_at: 3.days.ago)
      comment4 = create(:comment, post:, author: user, created_at: 4.days.ago)
      comment5 = create(:comment, post:, author: user, created_at: 5.days.ago)

      expect(post.recent_comments).to eq([comment2, comment1, comment3, comment4, comment5])
    end
  end

  describe 'update_post_counter after save' do
    it 'should increment the post counter after save' do
      post = build(:post, author: user)
      expect { post.save }.to change { user.reload.post_counter }.by(1)
    end
  end
end
