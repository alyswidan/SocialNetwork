class User < ApplicationRecord
  enum marital_status: [:single, :married, :divorced, :engaged]
  enum  gender: [:male, :female, :not_specified]
  has_many :posts
  has_many :phones
  has_one :city
  has_many :friend_requests
  has_many :friends

  has_many :sent_requests, through: :friend_requests, source: :other_user
  has_many :received_requests, through: :friend_requests,source: :user

  has_many(:buddies, through: :friends, source: :other_user)
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  before_save { self.email = email.downcase }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :password, length: { minimum: 5}


  def buddies
    option1 = User.
        select('u2.*').
        joins('as u1 inner join friends on u1.id=friends.other_user_id
               inner join users as u2 on u2.id=friends.user_id').
        where('friends.other_user_id'=>self.id)

    option2 = User.
        joins('inner join friends on users.id = friends.other_user_id').
        where('friends.user_id'=>self.id)

    User.from("(#{option1.to_sql} UNION #{option2.to_sql}) AS users")
  end


  def birthdate=(date)

    if !date.empty?
      super Date.strptime date, "%m/%d/%Y"
    end
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  def add_friend(other_user)
    friends.create(other_user_id: other_user.id)
  end
  def remove_friend(other_user)
    friends.find_by(other_user_id: other_user.id).destroy
  end

  def is_friends_with?(other_user)
    !Friend.where(other_user_id: other_user.id, user_id: self.id).empty? \
 || !Friend.where(other_user_id: self.id, user_id: other_user.id).empty?

  end


end
