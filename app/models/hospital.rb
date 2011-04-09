class Hospital < ActiveRecord::Base

  attr_accessible :hcode, :hname
  has_many :user
  has_many :uploads
  
end
