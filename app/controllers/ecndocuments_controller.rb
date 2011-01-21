class EcndocumentsController < ApplicationController
  # GET /ecndocuments
  # GET /ecndocuments.xml
  def index
    @ecndocuments = Ecndocument.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ecndocuments }
    end
  end

  # GET /ecndocuments/1
  # GET /ecndocuments/1.xml
  def show
    @ecndocument = Ecndocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ecndocument }
    end
  end


  # GET /ecndocuments/new
  # GET /ecndocuments/new.xml
  def new
    @ecndocument = Ecndocument.new
    @doc_category = DocCategory.find(params[:type])
    @ecndocument.doc_category = @doc_category
    @user_id = @user.id
    @position = []
    for position in @doc_category.ecnpositions
      @ecndocument.approvals.build
      @ecndocument.ecnreview_forms.build
      @position.push(position)
    end
    5.times { @ecndocument.assets.build }
    
    if @doc_category
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @ecndocument }
      end
    else
      render :text => "invalid document category type", :layout => "application"
    end
  end

  # GET /ecndocuments/1/edit
  def edit
    @ecndocument = Ecndocument.find(params[:id])
    @doc_category = @ecndocument.doc_category
    @user_id = @ecndocument.user_id
    @position = []
    for position in @doc_category.ecnpositions
      @ecndocument.approvals.build
      @position.push(position)
    end
    
  end

  # POST /ecndocuments
  # POST /ecndocuments.xml
  def create
    @ecndocument = Ecndocument.new(params[:ecndocument])

    respond_to do |format|
      if @ecndocument.save
        format.html { redirect_to(@ecndocument, :notice => 'Ecndocument was successfully created.') }
        format.xml  { render :xml => @ecndocument, :status => :created, :location => @ecndocument }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ecndocument.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ecndocuments/1
  # PUT /ecndocuments/1.xml
  def update
    @ecndocument = Ecndocument.find(params[:id])

    respond_to do |format|
      if @ecndocument.update_attributes(params[:ecndocument])
        format.html { redirect_to(@ecndocument, :notice => 'Ecndocument was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ecndocument.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ecndocuments/1
  # DELETE /ecndocuments/1.xml
  def destroy
    @ecndocument = Ecndocument.find(params[:id])
    @ecndocument.destroy

    respond_to do |format|
      format.html { redirect_to(ecndocuments_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
