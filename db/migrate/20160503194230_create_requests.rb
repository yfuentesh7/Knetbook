class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :request_id

      t.timestamps null: false
    end
  end
end
