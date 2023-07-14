require 'rails_helper'
RSpec.describe Like, type: :model do
  describe 'update_likes_counter' do
    let!(:user) { User.create(name: 'Richard') }
    let!(:post) { Post.create(title: 'Rspec testing', author: user) }
    let!(:like) { Like.create(author: user, post: post) }

    it 'should increment the likes_counter post' do
      expect { like.update_likes_counter }.to change { post.reload.likes_counter }.by(1)
    end

    it 'should run after saving a like' do
      like = Like.new(author: user, post: post)
      expect(like).to receive(:update_likes_counter)
      like.save
    end
  end
end
