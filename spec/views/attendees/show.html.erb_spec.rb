require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attendees/show.html.erb" do
  include AttendeesHelper
  before(:each) do
    assigns[:attendee] = @attendee = stub_model(Attendee,
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
    )
  end

  it "should render attributes in <p>" do
    render "/attendees/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ website/)
    response.should have_text(/value\ for\ company/)
    response.should have_text(/value\ for\ phone_number/)
    response.should have_text(/value\ for\ address1/)
    response.should have_text(/value\ for\ address2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ country/)
    response.should have_text(/value\ for\ zipcode/)
  end
end

