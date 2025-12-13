class UsersController < ApplicationController
  before_action :already_login?
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      #user.idをいれる
      session[:user_id] = user.id
      redirect_to documents_path 
    else 
      render :new, status: :unprocessable_entity
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end