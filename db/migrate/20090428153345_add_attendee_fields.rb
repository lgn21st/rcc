class AddAttendeeFields < ActiveRecord::Migration
  def self.up
    add_column :attendees, :company_category, :string
    add_column :attendees, :industry, :string
    add_column :attendees, :company_size, :string
    add_column :attendees, :title, :string
    add_column :attendees, :work_experience, :string
    add_column :attendees, :ruby_experience, :string
    add_column :attendees, :interesting, :string
  end

  def self.down
    remove_column :attendees, :company_category
    remove_column :attendees, :industry, :string
    remove_column :attendees, :company_size, :string
    remove_column :attendees, :title, :string
    remove_column :attendees, :work_experience, :string
    remove_column :attendees, :ruby_experience, :string
    remove_column :attendees, :interesting, :string
  end
end
