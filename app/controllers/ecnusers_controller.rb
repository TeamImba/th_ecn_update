class EcnusersController < ApplicationController

  before_filter :authenticate_admin, :except => [:edit_profile, :update_profile]
  
  def edit_profile
    @ecnuser = Ecnuser.find(@user.id)
    @ecnuser.password = ""
  end
  
  # PUT /ecnusers/1
  # PUT /ecnusers/1.xml
  def update_profile
    @ecnuser = Ecnuser.find(@user.id)
    params[:ecnuser][:username] = @ecnuser.username
    params[:ecnuser][:email] = @ecnuser.email
    
    respond_to do |format|
      if @ecnuser.update_attributes(params[:ecnuser])
        format.html { redirect_to( root_path, :notice => 'Ecnuser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_profile" }
        format.xml  { render :xml => @ecnuser.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # GET /ecnusers
  # GET /ecnusers.xml
  def index
    @ecnusers = Ecnuser.paginate :page => params[:page], :order => "pos_id asc, last_name asc, first_name asc", :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ecnusers }
    end
  end

  # GET /ecnusers/1
  # GET /ecnusers/1.xml
  def show
    @ecnuser = Ecnuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ecnuser }
    end
  end

  # GET /ecnusers/new
  # GET /ecnusers/new.xml
  def new
    @ecnuser = Ecnuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ecnuser }
    end
  end

  # GET /ecnusers/1/edit
  def edit
    @ecnuser = Ecnuser.find(params[:id])
    @ecnuser.password = nil
  end

  # POST /ecnusers
  # POST /ecnusers.xml
  def create
    @ecnuser = Ecnuser.new(params[:ecnuser])

    respond_to do |format|
      if @ecnuser.save
        format.html { redirect_to(@ecnuser, :notice => 'Ecnuser was successfully created.') }
        format.xml  { render :xml => @ecnuser, :status => :created, :location => @ecnuser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ecnuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ecnusers/1
  # PUT /ecnusers/1.xml
  def update
    @ecnuser = Ecnuser.find(params[:id])

    respond_to do |format|
      if @ecnuser.update_attributes(params[:ecnuser])
        format.html { redirect_to(@ecnuser, :notice => 'Ecnuser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ecnuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ecnusers/1
  # DELETE /ecnusers/1.xml
  def destroy
    @ecnuser = Ecnuser.find(params[:id])
    @ecnuser.destroy

    respond_to do |format|
      format.html { redirect_to(ecnusers_url) }
      format.xml  { head :ok }
    end
  end

end
