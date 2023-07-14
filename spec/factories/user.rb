FactoryBot.define do
  factory :user do
    name { 'Teddy' }
    photo { 'teddy-image.jpg' }
    bio { 'software engineer' }
    post_counter { 0 }
  end
end
