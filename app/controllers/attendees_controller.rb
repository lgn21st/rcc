class AttendeesController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required, :only => [:index]
  access_control :index => 'superuser'
  
  # GET /attendees
  # GET /attendees.xml
  def index
    @attendees = Attendee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendees }
    end
  end

  # GET /attendees/1
  # GET /attendees/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /attendees/new
  # GET /attendees/new.xml
  def new
    @attendee = Attendee.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /attendees
  # POST /attendees.xml
  def create
    @attendee = Attendee.new(params[:attendee])

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to(@attendee) }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
