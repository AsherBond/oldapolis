class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :caption, :image
	has_attached_file :image, :styles => { :small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#" },
	                  :url  => "/system/profile/gallery/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/profile/gallery/:id/:style/:basename.:extension"
end
