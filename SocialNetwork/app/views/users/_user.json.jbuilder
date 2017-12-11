json.extract! user, :id, :first_name, :last_name, :nickname, :password_digest, :email, :gender, :marital_status, :birthdate, :about_me, :created_at, :updated_at
json.url user_url(user, format: :json)
