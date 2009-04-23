require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AttendeesController do

  def mock_attendee(stubs={})
    @mock_attendee ||= mock_model(Attendee, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all attendees as @attendees" do
      Attendee.should_receive(:find).with(:all).and_return([mock_attendee])
      get :index
      assigns[:attendees].should == [mock_attendee]
    end

    describe "with mime type of xml" do
  
      it "should render all attendees as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Attendee.should_receive(:find).with(:all).and_return(attendees = mock("Array of Attendees"))
        attendees.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested attendee as @attendee" do
      Attendee.should_receive(:find).with("37").and_return(mock_attendee)
      get :show, :id => "37"
      assigns[:attendee].should equal(mock_attendee)
    end
    
    describe "with mime type of xml" do

      it "should render the requested attendee as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Attendee.should_receive(:find).with("37").and_return(mock_attendee)
        mock_attendee.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new attendee as @attendee" do
      Attendee.should_receive(:new).and_return(mock_attendee)
      get :new
      assigns[:attendee].should equal(mock_attendee)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested attendee as @attendee" do
      Attendee.should_receive(:find).with("37").and_return(mock_attendee)
      get :edit, :id => "37"
      assigns[:attendee].should equal(mock_attendee)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created attendee as @attendee" do
        Attendee.should_receive(:new).with({'these' => 'params'}).and_return(mock_attendee(:save => true))
        post :create, :attendee => {:these => 'params'}
        assigns(:attendee).should equal(mock_attendee)
      end

      it "should redirect to the created attendee" do
        Attendee.stub!(:new).and_return(mock_attendee(:save => true))
        post :create, :attendee => {}
        response.should redirect_to(attendee_url(mock_attendee))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved attendee as @attendee" do
        Attendee.stub!(:new).with({'these' => 'params'}).and_return(mock_attendee(:save => false))
        post :create, :attendee => {:these => 'params'}
        assigns(:attendee).should equal(mock_attendee)
      end

      it "should re-render the 'new' template" do
        Attendee.stub!(:new).and_return(mock_attendee(:save => false))
        post :create, :attendee => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested attendee" do
        Attendee.should_receive(:find).with("37").and_return(mock_attendee)
        mock_attendee.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :attendee => {:these => 'params'}
      end

      it "should expose the requested attendee as @attendee" do
        Attendee.stub!(:find).and_return(mock_attendee(:update_attributes => true))
        put :update, :id => "1"
        assigns(:attendee).should equal(mock_attendee)
      end

      it "should redirect to the attendee" do
        Attendee.stub!(:find).and_return(mock_attendee(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(attendee_url(mock_attendee))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested attendee" do
        Attendee.should_receive(:find).with("37").and_return(mock_attendee)
        mock_attendee.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :attendee => {:these => 'params'}
      end

      it "should expose the attendee as @attendee" do
        Attendee.stub!(:find).and_return(mock_attendee(:update_attributes => false))
        put :update, :id => "1"
        assigns(:attendee).should equal(mock_attendee)
      end

      it "should re-render the 'edit' template" do
        Attendee.stub!(:find).and_return(mock_attendee(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested attendee" do
      Attendee.should_receive(:find).with("37").and_return(mock_attendee)
      mock_attendee.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the attendees list" do
      Attendee.stub!(:find).and_return(mock_attendee(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(attendees_url)
    end

  end

end
