class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :company
      t.string :phone_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
