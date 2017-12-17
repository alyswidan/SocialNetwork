class Post < ApplicationRecord
  belongs_to :user
  validates :caption, presence: true , length: { maximum: 500 }
  validates :user_id, presence:true
end
