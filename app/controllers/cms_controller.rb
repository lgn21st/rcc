class CmsController < ComatoseAdminController
  include AuthenticatedSystem
  
  before_filter :login_required
  access_control :DEFAULT => 'superuser'
  
  def permission_denied
    flash[:notice] = "You have insuffient permissions to access #{controller_name}/#{action_name}."
    redirect_to new_session_path
  end
end