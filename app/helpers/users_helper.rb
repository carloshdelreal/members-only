module UsersHelper
  def username
    return current_user.username if current_user
  end
end
