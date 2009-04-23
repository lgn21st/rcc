require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attendees/index.html.erb" do
  include AttendeesHelper
  
  before(:each) do
    assigns[:attendees] = [
      stub_model(Attendee,
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
      ),
      stub_model(Attendee,
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
    ]
  end

  it "should render list of attendees" do
    render "/attendees/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for website".to_s, 2)
    response.should have_tag("tr>td", "value for company".to_s, 2)
    response.should have_tag("tr>td", "value for phone_number".to_s, 2)
    response.should have_tag("tr>td", "value for address1".to_s, 2)
    response.should have_tag("tr>td", "value for address2".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", "value for country".to_s, 2)
    response.should have_tag("tr>td", "value for zipcode".to_s, 2)
  end
end

