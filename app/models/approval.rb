class Approval < ActiveRecord::Base
  belongs_to :ecnuser, :primary_key => :id, :foreign_key => :user_id
  belongs_to :ecndocument, :primary_key => :id, :foreign_key => :ecn_id
  belongs_to :ecnposition, :primary_key => :id, :foreign_key => :pos_id
  
  before_save :set_timestamp
  
  def set_timestamp
    self.approval_timestamp = Time.now if !status.blank?
  end
  
end
