class AdminController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @totla_orders = Order.count
  end

end
