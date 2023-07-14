require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'update_comments_counter' do
    let!(:user) { User.create(name: 'Chinyere') }
    let!(:post) { Post.create(title: 'Model testing', author: user) }
    let!(:comment) { Comment.create(author: user, post: post) }

    it 'should increment the comments_counter of the post' do
      expect { comment.update_comments_counter }.to change { post.reload.comments_counter }.by(1)
    end

    it 'should run after saving a comment' do
      comment = Comment.new(author: user, post: post)
      expect(comment).to receive(:update_comments_counter)
      comment.save
    end
  end
end
