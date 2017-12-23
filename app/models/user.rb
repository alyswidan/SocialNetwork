class User < ApplicationRecord
  enum marital_status: %i[single married divorced engaged]
  enum gender: %i[male female not_specified]
  has_many :posts, dependent: :destroy
  has_many :phones
  belongs_to :city, optional: true
  has_many :friend_requests
  has_many :friends
  has_many :likes,dependent: :destroy

  has_many :sent_requests, through: :friend_requests, source: :other_user
  has_many :received_requests, through: :friend_requests, source: :user

  has_many(:buddies, through: :friends, source: :other_user)
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  before_save {self.email = email.downcase }
  before_save {self.first_name = first_name.downcase}
  before_save {self.last_name = last_name.downcase}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :password, length: { minimum: 5},allow_blank: true
  mount_uploader :picture, PictureUploader
  validate :picture_size

  def like(post_id)
    likes.create(post_id: post_id)
  end
  #unlike a post
  def unlike(post_id)

    likes.find_by(post_id: post_id).destroy
  end
  def likes?(post_id)

      likes.find_by(post_id: post_id).present?

  end

  def buddies
    option1 = User.
              select('u2.*').
              joins('as u1 inner join friends on u1.id=friends.other_user_id
               inner join users as u2 on u2.id=friends.user_id').
              where('friends.other_user_id' => id)


    option2 = User.
              joins('inner join friends on users.id = friends.other_user_id').
              where('friends.user_id' => id)

    User.from("(#{option1.to_sql} UNION #{option2.to_sql}) AS users")
  end

  def feed
    query1 = Post.where(is_public: true)
    friend_ids = buddies.ids.join(',')
    if friend_ids.present?
      query2=Post.where("user_id IN (#{friend_ids})
                        OR user_id = :user_id and is_public=false", user_id: id)
      Post.from("(#{query1.to_sql} Union #{query2.to_sql}) AS Posts")
          .order(created_at: :DESC)
    else
      Post.where(:is_public => true).order(created_at: :desc)
    end
  end

  def avatar

    return picture.url unless picture.url.blank?
    if gender == 'male'
      ActionController::Base.helpers.asset_path('male_placeholder.png', digest: false)
    elsif gender == 'female'
      ActionController::Base.helpers.asset_path('female_placeholder.png', digest: false)
    else
      ActionController::Base.helpers.asset_path('unknown_placeholder.png', digest: false)
    end
  end

  def birthdate=(date)
    if date.class == String && !date.empty?
      super Date.strptime date, '%m/%d/%Y'
    else
      super
    end
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def add_friend(other_user)
    friends.create(other_user_id: other_user.id)
  end

  def remove_friend(other_user)
    me_on_left = friends.find_by(other_user_id: other_user.id)
    me_on_right = Friend.where(user_id: other_user.id, other_user_id: self.id)[0]
    if !me_on_left.nil?
      me_on_left.destroy
    else
      me_on_right.destroy
    end
  end

  def is_friends_with?(other_user)
    !Friend.where(other_user_id: other_user.id, user_id: id).empty? \
 || !Friend.where(other_user_id: id, user_id: other_user.id).empty?
  end


  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end

end
