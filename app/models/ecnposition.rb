class Ecnposition < ActiveRecord::Base
  has_many :ecnusers, :primary_key => :id, :foreign_key => :pos_id
  has_many :ecnreview_forms, :primary_key => :id, :foreign_key => :pos_id
  has_many :approvals, :primary_key => :id, :foreign_key => :pos_id
  has_many :ecndocuments, :primary_key => :id, :foreign_key => :user_designation
  has_and_belongs_to_many :doc_categories
  
  named_scope :approval_for, lambda { |pos_id| {:conditions => [ "id <> '?' and (position_name IS NOT NULL OR position_name <> '')", pos_id ], :order => "id asc"} }
  
  def self.position_for_select
    self.order("id asc").map{ |v| [ v.position_name, v.id ] }
  end
end
