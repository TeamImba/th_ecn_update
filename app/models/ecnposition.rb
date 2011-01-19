class Ecnposition < ActiveRecord::Base
  has_many :ecnusers, :primary_key => :id, :foreign_key => :pos_id
  has_many :ecnreview_forms
  has_many :approvals
  named_scope :approval_for, lambda { |pos_id| {:conditions => [ "id <> '?' and (position_name IS NOT NULL OR position_name <> '')", pos_id ], :order => "id asc"} }
end
