class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.text :info
      t.string :ticket_link
      t.text :disclaimer
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
