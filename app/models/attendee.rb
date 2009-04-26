class Attendee < ActiveRecord::Base
  validates_presence_of :name, :email, :city, :state, :country, :company
  validates_presence_of     :name
  validates_length_of       :name,    :within => 3..40
  validates_uniqueness_of   :email

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email     
  
  protected
    
    def make_activation_code
        self.activation_code = self.class.make_token
    end
    
end
