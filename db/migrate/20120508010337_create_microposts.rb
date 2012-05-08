class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :body
      t.references :user

      t.timestamps
    end
    add_index :microposts, :user_id
  end
end
