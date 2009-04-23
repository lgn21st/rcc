require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attendees/edit.html.erb" do
  include AttendeesHelper
  
  before(:each) do
    assigns[:attendee] = @attendee = stub_model(Attendee,
      :new_record? => false,
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

  it "should render edit form" do
    render "/attendees/edit.html.erb"
    
    response.should have_tag("form[action=#{attendee_path(@attendee)}][method=post]") do
      with_tag('input#attendee_name[name=?]', "attendee[name]")
      with_tag('input#attendee_email[name=?]', "attendee[email]")
      with_tag('input#attendee_website[name=?]', "attendee[website]")
      with_tag('input#attendee_company[name=?]', "attendee[company]")
      with_tag('input#attendee_phone_number[name=?]', "attendee[phone_number]")
      with_tag('input#attendee_address1[name=?]', "attendee[address1]")
      with_tag('input#attendee_address2[name=?]', "attendee[address2]")
      with_tag('input#attendee_city[name=?]', "attendee[city]")
      with_tag('input#attendee_state[name=?]', "attendee[state]")
      with_tag('input#attendee_country[name=?]', "attendee[country]")
      with_tag('input#attendee_zipcode[name=?]', "attendee[zipcode]")
    end
  end
end


