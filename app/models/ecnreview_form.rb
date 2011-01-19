class EcnreviewForm < ActiveRecord::Base
  belongs_to :ecnposition, :primary_key => :id, :foreign_key => :pos_id
  belongs_to :ecnuser, :primary_key => :id, :foreign_key => :user_id
  belongs_to :ecndocument, :primary_key => :id, :foreign_key => :ecn_id
end
