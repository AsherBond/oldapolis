class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :thumbnail_background_color, :string
    add_column :users, :thumbnail_border_color, :string
    add_column :users, :thumbnail_border_color_hover, :string
    add_column :users, :event_table_background_color, :string
    add_column :users, :nav_active_background_color, :string
    add_column :users, :nav_hover_background_color, :string
    add_column :users, :albums_header_color, :string
  end
end
