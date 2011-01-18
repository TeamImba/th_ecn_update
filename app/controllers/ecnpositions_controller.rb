class EcnpositionsController < ApplicationController
  # GET /ecnpositions
  # GET /ecnpositions.xml
  def index
    @ecnpositions = Ecnposition.paginate :page => params[:page], :order => "position_name asc", :per_page => 10
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ecnpositions }
    end
  end

  # GET /ecnpositions/new
  # GET /ecnpositions/new.xml
  def new
    @ecnposition = Ecnposition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ecnposition }
    end
  end

  # GET /ecnpositions/1/edit
  def edit
    @ecnposition = Ecnposition.find(params[:id])
  end

  # POST /ecnpositions
  # POST /ecnpositions.xml
  def create
    @ecnposition = Ecnposition.new(params[:ecnposition])

    respond_to do |format|
      if @ecnposition.save
        format.html { redirect_to(ecnpositions_url, :notice => 'Ecnposition was successfully created.') }
        format.xml  { render :xml => @ecnposition, :status => :created, :location => @ecnposition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ecnposition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ecnpositions/1
  # PUT /ecnpositions/1.xml
  def update
    @ecnposition = Ecnposition.find(params[:id])

    respond_to do |format|
      if @ecnposition.update_attributes(params[:ecnposition])
        format.html { redirect_to(ecnpositions_url, :notice => 'Ecnposition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ecnposition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ecnpositions/1
  # DELETE /ecnpositions/1.xml
  def destroy
    @ecnposition = Ecnposition.find(params[:id])
    @ecnposition.destroy

    respond_to do |format|
      format.html { redirect_to(ecnpositions_url) }
      format.xml  { head :ok }
    end
  end
end
