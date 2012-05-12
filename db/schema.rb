# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120512000340) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "albums", :force => true do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "label"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "artwork_file_name"
    t.string   "artwork_content_type"
    t.integer  "artwork_file_size"
    t.datetime "artwork_updated_at"
    t.string   "slug"
  end

  add_index "albums", ["slug"], :name => "index_albums_on_slug", :unique => true
  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "artists", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "artists", ["email"], :name => "index_artists_on_email", :unique => true
  add_index "artists", ["reset_password_token"], :name => "index_artists_on_reset_password_token", :unique => true

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.text     "info"
    t.string   "ticket_link"
    t.text     "disclaimer"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
    t.string   "location"
    t.string   "slug"
  end

  add_index "events", ["slug"], :name => "index_events_on_slug", :unique => true
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "microposts", :force => true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "profile_comments", :force => true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.string   "posted_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profile_comments", ["user_id"], :name => "index_profile_comments_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "songs", :force => true do |t|
    t.integer  "album_id"
    t.string   "title"
    t.text     "lyrics"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "artwork_file_name"
    t.string   "artwork_content_type"
    t.integer  "artwork_file_size"
    t.datetime "artwork_updated_at"
    t.string   "song_file_name"
    t.string   "song_content_type"
    t.integer  "song_file_size"
    t.datetime "song_updated_at"
    t.string   "slug"
  end

  add_index "songs", ["album_id"], :name => "index_songs_on_album_id"
  add_index "songs", ["slug"], :name => "index_songs_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                                  :default => "", :null => false
    t.string   "encrypted_password",                     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "about"
    t.string   "slug"
    t.string   "main_box_h1"
    t.string   "main_box_h3"
    t.string   "main_box_p"
    t.string   "player_link_color"
    t.string   "player_link_color_hover"
    t.string   "player_link_color_current"
    t.string   "nav_link_color"
    t.string   "nav_link_color_hover"
    t.string   "nav_link_color_current"
    t.string   "news_h3"
    t.string   "news_link_color"
    t.string   "news_link_color_hover"
    t.string   "news_p"
    t.string   "about_h3"
    t.string   "about_link_color"
    t.string   "about_link_color_hover"
    t.string   "microposts_h3_color"
    t.string   "microposts_color"
    t.string   "microposts_date_color"
    t.string   "comments_h3_color"
    t.string   "comments_color"
    t.string   "comments_link_color"
    t.string   "comments_link_color_hover"
    t.string   "comments_user_link_color"
    t.string   "comments_user_link_color_hover"
    t.string   "albums_h3_color"
    t.string   "albums_link_color"
    t.string   "albums_link_color_hover"
    t.string   "albums_date_color"
    t.string   "events_h3_color"
    t.string   "events_header_color"
    t.string   "events_text_color"
    t.string   "events_link_color"
    t.string   "events_link_color_hover"
    t.string   "main_box_bg_color"
    t.string   "player_bg_color"
    t.string   "player_header_bg_color"
    t.string   "about_bg_color"
    t.string   "comments_bg_color"
    t.string   "profile_image_bg_color"
    t.string   "albums_bg_color"
    t.string   "events_header_bg_color"
    t.string   "events_body_bg_color"
    t.string   "events_bg_color_hover"
    t.string   "news_background_color"
    t.string   "body_background_color"
    t.string   "artist_name"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "profile_background_image_file_name"
    t.string   "profile_background_image_content_type"
    t.integer  "profile_background_image_file_size"
    t.datetime "profile_background_image_updated_at"
    t.string   "main_box_background_image_file_name"
    t.string   "main_box_background_image_content_type"
    t.integer  "main_box_background_image_file_size"
    t.datetime "main_box_background_image_updated_at"
    t.string   "about_background_image_file_name"
    t.string   "about_background_image_content_type"
    t.integer  "about_background_image_file_size"
    t.datetime "about_background_image_updated_at"
    t.string   "comments_background_image_file_name"
    t.string   "comments_background_image_content_type"
    t.integer  "comments_background_image_file_size"
    t.datetime "comments_background_image_updated_at"
    t.string   "news_background_image_file_name"
    t.string   "news_background_image_content_type"
    t.integer  "news_background_image_file_size"
    t.datetime "news_background_image_updated_at"
    t.string   "body_background_image_file_name"
    t.string   "body_background_image_content_type"
    t.integer  "body_background_image_file_size"
    t.datetime "body_background_image_updated_at"
    t.string   "thumbnail_background_color"
    t.string   "thumbnail_border_color"
    t.string   "thumbnail_border_color_hover"
    t.string   "event_table_background_color"
    t.string   "nav_active_background_color"
    t.string   "nav_hover_background_color"
    t.string   "albums_header_color"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "videos", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "youtube_url"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  add_index "videos", ["user_id"], :name => "index_videos_on_user_id"

end
