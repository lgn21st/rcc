Comatose.configure do |config|
  # Sets the text in the Admin UI's title area

  config.includes << :authenticated_system
  # Includes AuthenticationSystem in the ComatoseAdminController
  config.admin_includes << :authenticated_system
#  config.helpers <<  :application_helper

  # Calls :login_required as a before_filter
  config.admin_authorization do
    unless logged_in? && current_user.roles.map{ |role| role.title.downcase}.include?('superuser')
      flash[:error] = "You don't have privileges to access this action" 
      redirect_to login_path 
    end
  end  

  # use textile
  config.default_filter = 'Textile'
  
end


