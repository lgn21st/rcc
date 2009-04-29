# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_locale_from_url

#  before_filter :detect_language
  
  private
    def detect_language
      request_language = request.env['HTTP_ACCEPT_LANGUAGE']
      I18n.locale = request_language if request_language && File.exist?("#{RAILS_ROOT}/config/locales/#{request_language}.yml")
    end
end
