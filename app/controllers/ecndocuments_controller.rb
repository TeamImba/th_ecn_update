class EcndocumentsController < ApplicationController 

  # GET /ecndocuments
  # GET /ecndocuments.xml
  def index
    # @ecndocuments = Ecndocument.all
    @queued = Ecndocument.queued @user
    @approved = Ecndocument.approved @user
    @disapproved = Ecndocument.disapproved @user
    
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
    @ecndocument.assets.build
    @last_signatory = false
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
    @last_signatory = (@ecndocument.next_approval(@user.id).blank?)? true : false
  end

  # POST /ecndocuments
  # POST /ecndocuments.xml
  def create
    @ecndocument = Ecndocument.new(params[:ecndocument])

    respond_to do |format|
      if @ecndocument.save
        StatusMailer.next_signatory_notice(@ecndocument.next_approval.ecnuser, @user, @ecndocument).deliver
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
    button_used = params[:commit]
    approval = @ecndocument.approvals.where(["user_id = ?", @user.id]).first
    if button_used == "Approve"
      approval.update_attribute(:status, 1)
    else
      approval.update_attribute(:status, 0)
    end
    respond_to do |format|
      if @ecndocument.update_attributes(params[:ecndocument])
        if button_used == "Approve"
          StatusMailer.next_signatory_notice(@ecndocument.next_approval.ecnuser, @user, @ecndocument).deliver
        else
          @originator = @ecndocument.approvals.order("pos_id asc").first
          @remark = @ecndocument.approvals.where(["user_id = ?", @user.id]).first.remark
          StatusMailer.disapproval_notice(@user, @originator, @ecndocument, @remark ).deliver
        end
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

  def print
    @ecndocument = Ecndocument.find(params[:id])
    render :action => :show, :layout => false
  end
  
end
