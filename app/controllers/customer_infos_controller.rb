class CustomerInfosController < ApplicationController

  before_filter :authenticate_admin, :except => :get_th_pn
  
  def get_th_pn
    @thpn = CustomerInfo.where( ["cust_id = ?", params[:id].to_s] )
    render :partial => "get_th_pn"
  end
  
  # GET /customer_infos
  # GET /customer_infos.xml
  def index
    @customer_infos = CustomerInfo.paginate :page => params[:page], :order => "cust_id asc", :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customer_infos }
    end
  end

  # GET /customer_infos/1
  # GET /customer_infos/1.xml
  def show
    @customer_info = CustomerInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @customer_info }
    end
  end

  # GET /customer_infos/new
  # GET /customer_infos/new.xml
  def new
    @customer_info = CustomerInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer_info }
    end
  end

  # GET /customer_infos/1/edit
  def edit
    @customer_info = CustomerInfo.find(params[:id])
  end

  # POST /customer_infos
  # POST /customer_infos.xml
  def create
    @customer_info = CustomerInfo.new(params[:customer_info])

    respond_to do |format|
      if @customer_info.save
        format.html { redirect_to(@customer_info, :notice => 'Customer info was successfully created.') }
        format.xml  { render :xml => @customer_info, :status => :created, :location => @customer_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customer_infos/1
  # PUT /customer_infos/1.xml
  def update
    @customer_info = CustomerInfo.find(params[:id])

    respond_to do |format|
      if @customer_info.update_attributes(params[:customer_info])
        format.html { redirect_to(@customer_info, :notice => 'Customer info was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_infos/1
  # DELETE /customer_infos/1.xml
  def destroy
    @customer_info = CustomerInfo.find(params[:id])
    @customer_info.destroy

    respond_to do |format|
      format.html { redirect_to(customer_infos_url) }
      format.xml  { head :ok }
    end
  end
end
