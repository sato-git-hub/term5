class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # ログインしていない状態で会員ページにアクセスできない　ログイン画面へ
  def login?
    if current_user.nil?
      redirect_to login_path
    end
  end

  # ログインしている状態でログイン画面にいけない
  def already_login?
    if !current_user.nil?
      redirect_to documents_path
    end
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end
end
