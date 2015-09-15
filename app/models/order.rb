class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy 
  
  validates :name, :address, :user_id, presence: true
  
  PAYMENT_TYPES = ["Check", "Credit Card", "Paypal"]
  validates :payment_type, inclusion: PAYMENT_TYPES
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item| 
      item.cart_id = nil
      item.order_id = id
      line_items << item
    end 
  end
  
  def subtotal 
    line_items.to_a.sum {|item| item.total_price}
  end 
end

