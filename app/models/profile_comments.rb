class ProfileComments < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :posted_by
end
