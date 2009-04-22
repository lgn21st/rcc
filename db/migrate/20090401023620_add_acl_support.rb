class AddAclSupport < ActiveRecord::Migration
  def self.up
    create_table "roles", :force => true do |t|
      t.column "title", :string
    end
    create_table "roles_users", :id => false, :force => true do |t|
      t.column "role_id", :integer
      t.column "user_id", :integer
    end
    
    Role.reset_column_information
    user = Role.create(:title => 'user')
    superuser = Role.create(:title => 'superuser')
    
    admin = User.create(:login => 'admin', :email => 'admin@urc.com', :password => 'zzzzzz', :password_confirmation => 'zzzzzz')
    admin.roles << superuser
    admin.activate!
  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end