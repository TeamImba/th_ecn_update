class ApprovalsController < ApplicationController
  # GET /approvals
  # GET /approvals.xml
  def index
    @approvals = Approval.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @approvals }
    end
  end

  # GET /approvals/1
  # GET /approvals/1.xml
  def show
    @approval = Approval.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @approval }
    end
  end

  # GET /approvals/new
  # GET /approvals/new.xml
  def new
    @approval = Approval.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approval }
    end
  end

  # GET /approvals/1/edit
  def edit
    @approval = Approval.find(params[:id])
  end

  # POST /approvals
  # POST /approvals.xml
  def create
    @approval = Approval.new(params[:approval])

    respond_to do |format|
      if @approval.save
        format.html { redirect_to(@approval, :notice => 'Approval was successfully created.') }
        format.xml  { render :xml => @approval, :status => :created, :location => @approval }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /approvals/1
  # PUT /approvals/1.xml
  def update
    @approval = Approval.find(params[:id])

    respond_to do |format|
      if @approval.update_attributes(params[:approval])
        format.html { redirect_to(@approval, :notice => 'Approval was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @approval.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /approvals/1
  # DELETE /approvals/1.xml
  def destroy
    @approval = Approval.find(params[:id])
    @approval.destroy

    respond_to do |format|
      format.html { redirect_to(approvals_url) }
      format.xml  { head :ok }
    end
  end
end
