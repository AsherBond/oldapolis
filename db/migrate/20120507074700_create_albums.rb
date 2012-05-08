class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.string :label
      t.references :user

      t.timestamps
    end
    add_index :albums, :user_id
  end
end
