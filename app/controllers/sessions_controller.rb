# encoding: utf-8

class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    if User.count.zero?
      user = User.create(:name => params[:name], :password => params[:password], :password_confirmation => params[:password])
    else
      user = User.find_by_name(params[:name])
    end

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "無効なユーザ／パスワードの組み合わせです"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_path, notice: 'ログアウト'
  end

end
