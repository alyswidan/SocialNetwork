module UsersHelper

  def avatar(user)
    user.picture.url || "http://lorempixel.com/250/140/sports"
  end


end
