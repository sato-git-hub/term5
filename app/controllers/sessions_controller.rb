class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # user.idをいれる
      session[:user_id] = user.id
      redirect_to documents_path
    else
      flash.now[:alert] = "入力に誤りがあります"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
