require 'rails_helper'

RSpec.describe 'user index page', type: :feature do
  scenario 'i can see username of all other users' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path
    User.all.each do |_user|
      expect(page).to have_css('.user_image')
    end
  end

  scenario 'i can see the number of posts' do
    visit users_path
    User.all.each do |user|
      expect(page).to have_content(user.posts.count)
    end
  end

  scenario 'redirect to user\'s show page' do
    visit users_path
    user = User.find(2)
    click_on 'Rachael'
    expect(page).to have_current_path(user_show_path(user.id))
  end
end
