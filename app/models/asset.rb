class Asset < ActiveRecord::Base
  belongs_to :ecndocument
  has_attached_file :image
end
