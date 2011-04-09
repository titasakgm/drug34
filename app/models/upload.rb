class Upload < ActiveRecord::Base
  attr_accessible :hospital_id, :doc

  belongs_to :hospital
  
  has_attached_file :doc,
  					:url => "/docs/:id/:style/:basename.:extension",
  					:path => ":rails_root/public/docs/:id/:style/:basename.:extension"
  					
  validates :doc_file_name, :presence => true
end
