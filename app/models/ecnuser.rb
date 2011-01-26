class Ecnuser < ActiveRecord::Base
  require 'digest/md5'
  has_many :approvals
  has_many :ecnreview_forms, :primary_key => :id, :foreign_key => :user_id
  belongs_to :ecnposition, :primary_key => :id, :foreign_key => :pos_id
  
  before_save :hash_password
  
  has_attached_file :signature
  
  attr_accessor :password_confirmation
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true, :confirmation => true
  
  def full_name
    self.first_name + " " + self.last_name
  end
  
  def self.authenticate(username="", password="")
    user = self.where("username = :username", {:username => username} ).first
    if user
      if user.password != Digest::MD5.hexdigest(password)
        ["password is incorrect", user.username]
      else
        ["successful", user]
      end
    else
      ["username not found.", username]
    end
  end
  
  def self.authenticate_admin(username="", password="")
    user = self.where("username = :username", {:username => username} ).first
    if user
      if user.username != "admin" && user.ecnposition.position_name == "admin"
        ["user is unautorized", user.username]
      elsif user.password != Digest::MD5.hexdigest(password)
        ["password is incorrect", user.username]
      else
        ["successful", user]
      end
    else
      ["username not found.", username]
    end
  end

  
  private
  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
end
