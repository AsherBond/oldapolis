class CreateProfileComments < ActiveRecord::Migration
  def change
    create_table :profile_comments do |t|
      t.string :body
      t.references :user
      t.string :posted_by

      t.timestamps
    end
    add_index :profile_comments, :user_id
  end
end
