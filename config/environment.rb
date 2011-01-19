# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Laguna::Application.initialize!

#a = Ecnposition.where(:position_name => "!= admin").order(:id).first


a = Ecnposition.find(:first, :order => "id desc")
b = Ecnposition.find(:first, :conditions => "id > 0", :order => "id asc")

DCC_ACCESS = a.id.to_i  if a
ORIGINATOR_ACCESS = b.id.to_i if b