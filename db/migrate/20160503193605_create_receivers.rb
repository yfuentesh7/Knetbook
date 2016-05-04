class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.integer :user_id
      t.integer :receive_id

      t.timestamps null: false
    end
  end
end
