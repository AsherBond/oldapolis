class Album < ActiveRecord::Base
  belongs_to :user
  has_many :songs
  attr_accessible :label, :title, :year, :artwork
  
  	# Friendly URLS
	# -----
	extend FriendlyId
  	friendly_id :title, use: :slugged

	has_attached_file :artwork, :styles => { :small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#" },
	                  :url  => "/system/songs/artwork/:id/:style/:basename.:extension",
	                  :path => ":rails_root/public/system/songs/artwork/:id/:style/:basename.:extension"
end
