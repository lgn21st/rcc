require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Attendee do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email",
      :website => "value for website",
      :company => "value for company",
      :phone_number => "value for phone_number",
      :address1 => "value for address1",
      :address2 => "value for address2",
      :city => "value for city",
      :state => "value for state",
      :country => "value for country",
      :zipcode => "value for zipcode"
    }
  end

  it "should create a new instance given valid attributes" do
    Attendee.create!(@valid_attributes)
  end
end
