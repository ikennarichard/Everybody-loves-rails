class Like < ApplicationRecord
  belongs_to :post, :user
end
