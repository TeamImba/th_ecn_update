class DocCategory < ActiveRecord::Base
  has_and_belongs_to_many :ecnpositions, :uniq => :true
  has_many :ecndocuments
end
