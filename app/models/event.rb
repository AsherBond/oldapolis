class Event < ActiveRecord::Base


  belongs_to :user


  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged


  attr_accessible :disclaimer, :end, :info, :start, :ticket_link, :title, :flyer, :location
  has_attached_file :flyer, :styles => {:small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#"},
                    :url => "/system/profile/events/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/profile/events/:id/:style/:basename.:extension"
end
