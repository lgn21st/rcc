class AddDescription < ActiveRecord::Migration
  def self.up    
    remove_column :attendees, :address1     
    remove_column :attendees, :address2
    remove_column :attendees, :zipcode
    add_column :attendees, :description, :text
  end

  def self.down
    remove_column :attendees, :description
    add_column :attendees, :address1, :string  
    add_column :attendees, :address2, :string
    add_column :attendees, :zipcode, :string
  end
end
