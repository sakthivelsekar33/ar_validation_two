ActiveRecord::Base.class_eval do
  def self.validates_revenuemed_email_format(attr_name, options={})
    validates attr_name, :format => {:with => /^[a-zA-Z0-9]*(@revenuemed.com)$/}.merge!(options)
  end
end