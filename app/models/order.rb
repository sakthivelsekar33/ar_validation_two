class Order < ActiveRecord::Base
  attr_accessible :customer_id, :product_name, :quantity, :order_acceptance, :terms_of_service
  
  belongs_to :customer
  
  validates :product_name, :length => {:minimum => 5}
  validates :terms_of_service, :acceptance => true
end
