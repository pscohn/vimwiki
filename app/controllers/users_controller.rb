class UsersController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:update]

  def show
    set_user
  end


  def new
    redirect_to home_path if current_user
    @user = User.new
  end

  def create
    return unless env('ALLOW_REGISTRATION', true)
    @user = User.new(user_params)
    if @user.save
#      @user.send_activation_email
#      flash[:info] = 'Please check your email to activate your account'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    set_user
    if @user.update_attributes(user_params)
      flash[:success] = 'User edited'
      redirect_to settings_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user ||= User.where('lower(username) = ?', params[:username].downcase).first
    @is_owner ||= @user == current_user
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
