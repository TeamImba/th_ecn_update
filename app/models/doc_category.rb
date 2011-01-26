class DocCategory < ActiveRecord::Base
  has_and_belongs_to_many :ecnpositions, :uniq => :true, :order => "ecnposition_id asc"
  has_many :ecndocuments
end
