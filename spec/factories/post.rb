FactoryBot.define do
  factory :post do
    title { 'Greetings' }
    text { 'Hello world' }
    comments_counter { 0 }
    likes_counter { 0 }
  end
end
