class Attendee < ActiveRecord::Base
  validates_presence_of :name, :email, :city, :state, :country, :company
  validates_uniqueness_of :email
end
