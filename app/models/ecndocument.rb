class Ecndocument < ActiveRecord::Base
  has_many :ecnreview_forms
  has_many :approvals
  belongs_to :ecnuser, :primary_key => :id, :foreign_key => :user_id
end
