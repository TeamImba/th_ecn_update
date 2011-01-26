class Ecndocument < ActiveRecord::Base
  has_many :ecnreview_forms, :primary_key => :id, :foreign_key => :ecn_id, :dependent => :destroy
  has_many :approvals, :primary_key => :id, :foreign_key => :ecn_id, :dependent => :destroy
  has_many :assets, :primary_key => :id, :foreign_key => :ecn_id, :dependent => :destroy
  
  belongs_to :ecnuser, :primary_key => :id, :foreign_key => :user_id
  belongs_to :doc_category, :primary_key => :id, :foreign_key => :doc_category_id
  
  accepts_nested_attributes_for :assets, :allow_destroy => true
  accepts_nested_attributes_for :approvals, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :ecnreview_forms, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    
  before_save :set_user_designation
  
  def set_user_designation
    if next_approval
      self.user_designation = next_approval.id
    else
      approved_or_not = approvals.where("status is not null and user_id is not null").order("pos_id asc").last
      if approved_or_not && approved_or_not.status.to_i == 1
        self.user_designation = 0
      else
        self.user_designation = nil
      end
    end
  end

  def self.next_approval
    approvals.where("status is null and user_id is null").order("pos_id asc").first
  end
  
  def self.queued(user)
    where( ["user_designation = ? and id in (select ecn_id from approvals where user_id = ?)", user.ecnposition.id, user.id] )
  end
  
  def self.approved(user)
    where( ["user_designation = 1 and id in (select ecn_id from approvals where user_id = ?)", user.id] )
  end
  
  def self.disapproved(user)
    where( ["user_designation is null and id in (select ecn_id from approvals where user_id = ?)", user.id] )
  end
  
  
end
