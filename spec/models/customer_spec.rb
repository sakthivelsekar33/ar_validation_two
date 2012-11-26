require 'spec_helper'
FactoryGirl.find_definitions

describe Customer do
  it "should create a new instance" do
    FactoryGirl.create(:customer)
  end

  describe "name" do
    it "should_be_required" do
      customer = FactoryGirl.build(:customer, :name => '')
      customer.should_not be_valid
      customer.errors[:name].should include("can't be blank")
      customer.name = 'mohan'
      customer.should be_valid
    end
  end

  describe "name" do
    it { should_not accept_values_for(:name, nil) }
    it { should_not accept_values_for(:name, "a") }
  end

  describe "phone" do
    it { should accept_values_for(:phone, 734856823784) }
    it { should_not accept_values_for(:phone, 39847598238479572937498523) }
  end
  
end

