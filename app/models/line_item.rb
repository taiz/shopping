class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    product.price * quantity
  end

  def decrement
    if quantity > 1
      q = quantity - 1
      update_attributes(:quantity => q)
    else
      destroy
    end
  end

end
