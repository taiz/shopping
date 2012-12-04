# coding: utf-8

class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = %w{ 現金 クレジットカード 注文書}

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart = nil
      line_items << item
    end
  end

  def after_update
    if ship_date
      OrderNotifier.shipped(self).deliver
    end
    logger.debug "after_update processed"
  end

end
