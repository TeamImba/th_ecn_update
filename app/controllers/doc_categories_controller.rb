class DocCategoriesController < ApplicationController
  
  before_filter :authenticate_admin
  
  # GET /doc_categories
  # GET /doc_categories.xml
  def index
    @doc_categories = DocCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doc_categories }
    end
  end

  # GET /doc_categories/1
  # GET /doc_categories/1.xml
  def show
    @doc_category = DocCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doc_category }
    end
  end

  # GET /doc_categories/new
  # GET /doc_categories/new.xml
  def new
    @doc_category = DocCategory.new
    @ecnpositions = Ecnposition.order("id asc")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doc_category }
    end
  end

  # GET /doc_categories/1/edit
  def edit
    @doc_category = DocCategory.find(params[:id])
    @ecnpositions = Ecnposition.order("id asc")
  end

  # POST /doc_categories
  # POST /doc_categories.xml
  def create
    @doc_category = DocCategory.new(params[:doc_category])

    respond_to do |format|
      if @doc_category.save
        format.html { redirect_to(@doc_category, :notice => 'Doc category was successfully created.') }
        format.xml  { render :xml => @doc_category, :status => :created, :location => @doc_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doc_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doc_categories/1
  # PUT /doc_categories/1.xml
  def update
    @doc_category = DocCategory.find(params[:id])

    respond_to do |format|
      if @doc_category.update_attributes(params[:doc_category])
        format.html { redirect_to(@doc_category, :notice => 'Doc category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doc_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doc_categories/1
  # DELETE /doc_categories/1.xml
  def destroy
    @doc_category = DocCategory.find(params[:id])
    @doc_category.destroy

    respond_to do |format|
      format.html { redirect_to(doc_categories_url) }
      format.xml  { head :ok }
    end
  end
end
