class SessionsController < ApplicationController
  layout 'auth'

  def new
  end

  def create
    user = User.find_by(email: params['session']['email'].downcase)
    if user && user.authenticate(params['session']['password'])
      if true || user.activated? # set up email activation later
        log_in user
        redirect_to '/pages/home'
      else
        flash[:danger] = 'Account not activated. Check your email for the activation link.'
        redirect_to login_url
      end
    else
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
