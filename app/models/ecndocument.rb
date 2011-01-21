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
end
