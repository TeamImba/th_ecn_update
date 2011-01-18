class EcnreviewFormsController < ApplicationController
  # GET /ecnreview_forms
  # GET /ecnreview_forms.xml
  def index
    @ecnreview_forms = EcnreviewForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ecnreview_forms }
    end
  end

  # GET /ecnreview_forms/1
  # GET /ecnreview_forms/1.xml
  def show
    @ecnreview_form = EcnreviewForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ecnreview_form }
    end
  end

  # GET /ecnreview_forms/new
  # GET /ecnreview_forms/new.xml
  def new
    @ecnreview_form = EcnreviewForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ecnreview_form }
    end
  end

  # GET /ecnreview_forms/1/edit
  def edit
    @ecnreview_form = EcnreviewForm.find(params[:id])
  end

  # POST /ecnreview_forms
  # POST /ecnreview_forms.xml
  def create
    @ecnreview_form = EcnreviewForm.new(params[:ecnreview_form])

    respond_to do |format|
      if @ecnreview_form.save
        format.html { redirect_to(@ecnreview_form, :notice => 'Ecnreview form was successfully created.') }
        format.xml  { render :xml => @ecnreview_form, :status => :created, :location => @ecnreview_form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ecnreview_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ecnreview_forms/1
  # PUT /ecnreview_forms/1.xml
  def update
    @ecnreview_form = EcnreviewForm.find(params[:id])

    respond_to do |format|
      if @ecnreview_form.update_attributes(params[:ecnreview_form])
        format.html { redirect_to(@ecnreview_form, :notice => 'Ecnreview form was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ecnreview_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ecnreview_forms/1
  # DELETE /ecnreview_forms/1.xml
  def destroy
    @ecnreview_form = EcnreviewForm.find(params[:id])
    @ecnreview_form.destroy

    respond_to do |format|
      format.html { redirect_to(ecnreview_forms_url) }
      format.xml  { head :ok }
    end
  end
end
