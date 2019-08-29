ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper
  # Add more helper methods to be used by all tests here...
  
  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

# class ActionDispatch::IntegrationTest

#   # Log in as a particular user.
#   def log_in_as(user, password: 'password')
#     post login_path, params: { session: { email: user.email,
#                                           password: password } }
#   end
# end