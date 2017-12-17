class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :caption, presence: true , length: { maximum: 500 }
  validates :user_id, presence:true
end
