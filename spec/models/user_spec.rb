require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { described_class.new(name: 'Richard') }

  describe 'validations' do

    it 'should be valid with a name' do
      expect(user).to be_valid
    end

    it 'should be invalid without a name' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'should be valid with a non negative number' do
      user.post_counter = 0
      expect(user).to be_valid
    end

    it 'should be invalid with a negative post counter' do
      user.post_counter = -1
      expect(user).not_to be_valid
      expect(user.errors[:post_counter]).to include("must be greater than or equal to 0")
    end

    it 'is invalid with a non-integer post counter' do
      user.post_counter = 1.5
      expect(user).not_to be_valid
      expect(user.errors[:post_counter]).to include("must be an integer")
    end
  end

  describe '#recent_posts' do
    let!(:user) { create(:user) }

    it 'returns the three most recent posts' do
      post1 = create(:post, author: user, created_at: 2.days.ago)
      post2 = create(:post, author: user, created_at: 1.day.ago)
      post3 = create(:post, author: user, created_at: 3.days.ago)
      post4 = create(:post, author: user, created_at: 4.days.ago)

      expect(user.recent_posts).to eq([post2, post1, post3])
    end
  end
end
