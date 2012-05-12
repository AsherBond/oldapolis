class Video < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :youtube_url, :video
  has_attached_file :video, :styles => { 
				        :medium => { :geometry => "640x480", :format => 'flv' },
				        :thumb => { :geometry => "200x200#", :format => 'jpg', :time => 10 }
			  	    }
end
