require 'rails_helper'

RSpec.feature 'User Post Index', type: :feature, js: true do
  before(:all) do
    @user = User.first
  end

  scenario 'should display post page' do
    visit postindex_path(@user)
  
    @user.posts.each do |post|
      find('a', text: post.title).click
      expect(page).to have_current_path(posts_path(user_id: @user.id, id: post.id))
      expect(page).to have_content("Title: #{post.title}")
      expect(page).to have_content("Post ##{post.id} by #{@user.name}")
      expect(page).to have_content("Comments: #{post.comments.count}")
      expect(page).to have_content("Likes: #{post.likes.count}")
      expect(page).to have_content("Post: #{post.text}")
  
      post.comments.each do |comment|
        expect(page).to have_content("user: #{comment.author.name}")
        expect(page).to have_content("reply: #{comment.text}")
      end
    end
  end

end