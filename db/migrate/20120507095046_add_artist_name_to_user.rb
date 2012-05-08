class AddArtistNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :artist_name, :string
  end
end
