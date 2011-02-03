class Ecndocument < ActiveRecord::Base
  has_many :ecnreview_forms, :primary_key => :id, :foreign_key => :ecn_id, :dependent => :destroy
  has_many :approvals, :primary_key => :id, :foreign_key => :ecn_id, :dependent => :destroy
  has_many :assets, :primary_key => :id, :foreign_key => :ecn_id, :dependent => :destroy
  belongs_to :encposition, :primary_key => :id, :foreign_key => :user_designation
  belongs_to :ecnuser, :primary_key => :id, :foreign_key => :user_id
  belongs_to :doc_category, :primary_key => :id, :foreign_key => :doc_category_id
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :approvals, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :ecnreview_forms, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    
  before_save :set_user_designation
  
  def set_user_designation
    if self.next_approval
      x = approvals.where("status is not null and approval_timestamp is not null and user_id is not null").order("pos_id asc").last
      if x && x.status.to_i == 0
        self.user_designation = nil
      else
        self.user_designation = next_approval.pos_id
      end
    else
      approved_or_not = approvals.where("status is not null and approval_timestamp is not null").order("pos_id asc").last
      if approved_or_not && approved_or_not.status.to_i == 1
        self.user_designation = 0
      elsif approved_or_not && approved_or_not.status.to_i == 0
        self.user_designation = nil
      end
      self.closed_timestamp = Time.now
    end
  end

  def next_approval(user_id = "")
    if user_id.blank?
      approvals.where("status is null and approval_timestamp is null and user_id is not null").order("pos_id asc").first
    else
      approvals.where(["status is null and approval_timestamp is null and user_id is not null and user_id <> ?", user_id]).order("pos_id asc").first
    end
  end
  
  def self.queued(user)
    where( ["user_designation = ? and id in (select ecn_id from approvals where user_id = ?)", user.ecnposition.id, user.id] )
  end
  
  def self.approved(user)
    where( ["user_designation = 0 and id in (select ecn_id from approvals where user_id = ?)", user.id] )
  end
  
  def self.disapproved(user)
    where( ["user_designation is null and id in (select ecn_id from approvals where user_id = ?)", user.id] )
  end
  
  def self.pending(user)
    where( ["user_designation is not null and user_designation <> 0 and user_designation <> ? and id in (select ecn_id from approvals where user_id = ?)", user.ecnposition.id, user.id] )
  end
  
  def self.pending_summary(user)
    select("ecnpositions.position_name, count(*)").joins("left outer join ecnpositions on ecnpositions.id = ecndocuments.user_designation").where( ["user_designation is not null and user_designation <> 0 and user_designation <> ? and ecndocuments.id in (select ecn_id from approvals where user_id = ?)", user.ecnposition.id, user.id] ).group("ecnpositions.position_name").count
  end
  
end
