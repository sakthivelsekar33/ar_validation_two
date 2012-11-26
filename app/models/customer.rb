class Customer < ActiveRecord::Base
  attr_accessible :name, :gender, :phone, :email, :email_confirmation, :orders_attributes
  
  has_many :orders
  
  accepts_nested_attributes_for :orders
  validates :email, :uniqueness => true, :confirmation => true
  
  # -----------conditional validation -------------------
  
  validates :phone, :numericality => true, :if => :customer_is_bob?
  validates :name, :length => {:minimum => 2, :maximum => 20}, :if => "gender.eql?('f')"
  validates :email, :length => {:minimum => 20}, :if => Proc.new{|c| c.name == 'ravi'}

  def customer_is_bob?
  	true if name == 'bob'
	end

	
	# ----------- grouping conditional validation ----------

	with_options :presence => true do |t|
		t.validates :name, :format => {:with => /^[a-zA-Z]*$/}
		t.validates :gender, :inclusion => {:in => ['male','female','m','f']}
	end

  with_options :if => :check_length do |t|
    t.validates :name, :format => {:with => /^[a-zA-Z]*$/, :message => 'Failed in grouping validation'}
  end

  def check_length
    true if name.size > 5
  end
#	# ----------- custom_validator -------------------------
#
  validates_with PhoneNumberFormat
  validates :email, :email_format => true

#  # ----------- custom methods ---------------------------

  validate :validating_gender_by_method, :on => :create

  def validating_gender_by_method
    unless ['male','female','m','f'].include?(gender)
      errors.add(:gender, 'Not a Proper entry')
    end
  end

#  # ----------- helper methods --------------------------
  validates_revenuemed_email_format :email, {:message => 'not a client of revenuemed mail server'}

#  # ----------- Reduce validator -------------------------

  validates :name, :length => {:minimum => 5}, :format => {:with => /^[A-Z][a-zA-Z0-9]*$/}, :reduce_error => true


  # ------------ Validation for factories -----------------
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 20}
  validates :phone, :presence => true, :length => {:minimum => 5, :maximum => 15}

end


