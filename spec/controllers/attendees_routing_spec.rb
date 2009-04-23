require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AttendeesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "attendees", :action => "index").should == "/attendees"
    end
  
    it "should map #new" do
      route_for(:controller => "attendees", :action => "new").should == "/attendees/new"
    end
  
    it "should map #show" do
      route_for(:controller => "attendees", :action => "show", :id => 1).should == "/attendees/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "attendees", :action => "edit", :id => 1).should == "/attendees/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "attendees", :action => "update", :id => 1).should == "/attendees/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "attendees", :action => "destroy", :id => 1).should == "/attendees/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/attendees").should == {:controller => "attendees", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/attendees/new").should == {:controller => "attendees", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/attendees").should == {:controller => "attendees", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/attendees/1").should == {:controller => "attendees", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/attendees/1/edit").should == {:controller => "attendees", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/attendees/1").should == {:controller => "attendees", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/attendees/1").should == {:controller => "attendees", :action => "destroy", :id => "1"}
    end
  end
end
