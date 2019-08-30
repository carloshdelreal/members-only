class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      remember(user)
      current_user
      redirect_to posts_path
      flash[:success] = 'Thank you for signing in!'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
    flash[:success] = 'You Have logged Out!!'
  end
end
