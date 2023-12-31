require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before(:all) do
    @user = User.create(name: 'Spencer', bio: 'Spencer 1')
    @post1 = Post.create(author_id: @user.id, title: 'Greetings', text: 'Hello world', likes_counter: 5,
                         comments_counter: 4)
    @post2 = Post.create(author_id: @user.id, title: 'Music', text: 'Rap is the goat of genre', likes_counter: 5,
                         comments_counter: 4)
    @post3 = Post.create(author_id: @user.id, title: 'Fan fact', text: 'Your thigh bone is stonger than concreate',
                         likes_counter: 5, comments_counter: 4)
    @post4 = Post.create(author_id: @user.id, title: 'Extra post', text: 'Your thigh bone is stonger than concreate',
                         likes_counter: 5, comments_counter: 4)
  end

  scenario 'visible profile picture' do
    visit user_show_path(@user.id)
    expect(page).to have_css('.user_image')
  end

  scenario 'visible username' do
    visit user_show_path(@user.id)
    expect(page).to have_content(@user.name)
  end

  scenario 'can see number of posts' do
    visit user_show_path(@user.id)
    expect(page).to have_content(@user.posts.count)
  end

  scenario 'can see user\'s bio' do
    visit user_show_path(@user.id)
    expect(page).to have_content(@user.bio)
  end

  scenario "displays the user's first 3 posts" do
    visit user_show_path(@user.id)

    expect(page).to have_content(@post4.title)
    expect(page).to have_content(@post4.text)

    expect(page).to have_content('Music')
    expect(page).to have_content('Rap is the goat of genre')

    expect(page).to have_content('Fan fact')
    expect(page).to have_content('Your thigh bone is stonger than concreate')
  end

  scenario 'see all posts button' do
    visit user_show_path(@user.id)
    expect(page).to have_content('See all posts')
  end

  scenario 'redirects to post show page' do
    visit user_show_path(@user.id)
    click_on 'Extra post'
    expect(page).to have_current_path(posts_path(user_id: @user.id, id: @post4.id))
  end

  # scenario "redirects to user's post index page when clicking 'See all posts'" do
  #   visit user_show_path(@user.id)
  #   click_button 'See all posts'
  #   expect(page).to have_current_path(postindex_path(@user.id))
  # end
end
