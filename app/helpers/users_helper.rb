module UsersHelper
  # Get the username in the view
  def username
    return current_user.username if current_user
  end
end
