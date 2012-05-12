class User < ActiveRecord::Base

  # This user has roles.
  rolify

  # Got some weird error when I combined them, come back to it...
  has_many :albums
  has_many :microposts
  has_many :photos
  has_many :events
  has_many :videos
  has_many :songs, :through => :albums

  # Lets make sure the user has a role.
  before_create :define_role

  # Search the users.
  include PgSearch
  pg_search_scope :search, against: [:artist_name, :about],
                  using: {tsearch: {dictionary: "english"}},
                  ignoring: :accents

  # Search Helper
  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Hacker beware.
  # ------
  attr_accessible :email, # User Info
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :user_type,
                  :paid,
                  :last_payment_date,
                  :artist_name,
                  :first_name,
                  :last_name,
                  :username,
                  :city,
                  :state,
                  :zip,
                  :about,
                  :main_box_h1, # Main Box
                  :main_box_h3,
                  :main_box_p,
                  :player_link_color, # Music Player
                  :player_link_color_hover,
                  :player_link_color_current,
                  :nav_link_color, # Nav
                  :nav_link_color_hover,
                  :nav_link_color_current,
                  :news_h3, # News
                  :news_link_color,
                  :news_link_color_hover,
                  :news_p,
                  :about_h3, # About
                  :about_link_color,
                  :about_link_color_hover,
                  :microposts_h3_color, # Microposts
                  :microposts_color,
                  :microposts_date_color,
                  :comments_h3_color, # Comments
                  :comments_color,
                  :comments_link_color,
                  :comments_link_color_hover,
                  :comments_user_link_color,
                  :comments_user_link_color_hover,
                  :albums_h3_color, # Albums
                  :albums_link_color,
                  :albums_link_color_hover,
                  :albums_date_color,
                  :events_h3_color, # Events
                  :events_header_color,
                  :events_text_color,
                  :events_link_color,
                  :events_link_color_hover,
                  :main_box_bg_color,
                  :player_bg_color,
                  :player_header_bg_color,
                  :about_bg_color,
                  :comments_bg_color,
                  :profile_image_bg_color,
                  :albums_bg_color,
                  :events_header_bg_color,
                  :events_body_bg_color,
                  :events_bg_color_hover,
                  :news_background_color,
                  :body_background_color,
                  :profile_image,
                  :news_background_image,
                  :comments_background_image,
                  :about_background_image,
                  :main_box_background_image,
                  :body_background_image,
                  :thumbnail_background_color, 
                  :thumbnail_border_color, 
                  :thumbnail_border_color_hover,
                  :event_table_background_color,
                  :nav_active_background_color,
                  :nav_hover_background_color,
                  :albums_header_color

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :username, use: :slugged

  # Valid email regex.
  # -----
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validate the current users email with a regex.
  # -----
  validates :email,
            presence: true,
            format: {with: VALID_EMAIL_REGEX, :message => "is not a valid email"},
            uniqueness: {case_sensitive: false, :message => "is already registered"}

  # Validate the current users password.
  # -----
  validates :password,
            length: {
                minimum: 6, maximum: 35,
                :message => "must be inbetween 6-35 characters"
            },
            :on => :create

  validates :password_confirmation,
            length: {
                minimum: 6, maximum: 35,
                :message => "must be inbetween 6-35 characters"
            },
            :on => :create

  # Edit profile validations
  validates :first_name,
            presence: true,
            length: {
                minimum: 1, maximum: 40,
                :message => "is too short"
            },
            :on => :update

  validates :last_name,
            presence: true,
            length: {
                minimum: 1, maximum: 40,
                :message => "is too short"
            },
            :on => :update

  validates :username,
            presence: true,
            length: {
                minimum: 3, maximum: 25,
                :message => "must be inbetween 3-25 characters"
            },
            uniqueness: {case_sensitive: false, :message => 'is taken :('}

  validates :city,
            :allow_nil => true, :allow_blank => true,
            length: {
                minimum: 3, maximum: 35,
                :message => "is not valid"
            }

  validates :state,
            :allow_nil => true, :allow_blank => true,
            length: {
                minimum: 2, maximum: 35,
                :message => "is not valid"
            }

  validates :zip,
            :allow_nil => true, :allow_blank => true,
            length: {
                minimum: 3, maximum: 35,
                :message => "is not valid"
            }

  validates :about,
            :allow_nil => true, :allow_blank => true,
            length: {
                minimum: 5, maximum: 1500,
                :message => "must be inbetween 5-250 characters"
            }

  # Validate images.
  # -----
  has_attached_file :profile_image, :styles => {:small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#"},
                    :url => "/system/users/profile_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/profile_image/:id/:style/:basename.:extension"

  has_attached_file :news_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/news_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/news_background_image/:id/:style/:basename.:extension"

  has_attached_file :comments_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/comments_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/comments_background_image/:id/:style/:basename.:extension"

  has_attached_file :about_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/about_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/about_background_image/:id/:style/:basename.:extension"

  has_attached_file :main_box_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/main_box_background_image/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/main_box_background_image/:id/:style/:basename.:extension"

  has_attached_file :body_background_image, :styles => {:small => "150x150>"},
                    :url => "/system/users/body_background/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/users/body_background/:id/:style/:basename.:extension"

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end

  private
  def define_role
    self.add_role :fan
  end
end
