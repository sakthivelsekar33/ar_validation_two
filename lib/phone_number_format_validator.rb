class PhoneNumberFormat < ActiveModel::Validator
  def validate(record)
    if record.phone == 123456789
      record.errors[:phone] << 'Not a valid phone number'
    end
  end
end