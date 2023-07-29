FactoryBot.define do
  factory :user do
    # id { 114 }
    sequence(:id) { |n| n }
    name { 'Teddy' }
    photo { 'teddy-image.jpg' }
    bio { 'software engineer' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'pass-1' }
    post_counter { 0 }
  end
end
