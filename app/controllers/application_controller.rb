class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  private

    def authorize
      unless request.format == Mime::HTML
        authenticate_or_request_with_http_basic do |u, p|
          user = User.find_by_name(u)
          raise "Invalid user" unless user
          raise "Invalid password" unless user.authenticate(p)
          return
        end
      end

      unless User.find_by_id(session[:user_id])
        redirect_to login_path, notice: 'ログインしてください'
      end
    end

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def destroy_cart
      begin
        cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        return
      end
      cart.destroy
      session[:cart_id] = nil
    end

    def countup
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end

    def init_counter
      session[:counter] = 0
    end

end
