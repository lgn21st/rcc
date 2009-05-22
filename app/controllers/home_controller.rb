class HomeController < ApplicationController
  def index
    respond_to do |wants|
      wants.html { render :layout => 'front' }
    end
    
  end  
  
  def report
    respond_to do |wants|
      wants.html { render :layout => 'front' }
    end
  end
  
end
