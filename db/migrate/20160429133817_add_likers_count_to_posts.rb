class AddLikersCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likers_count, :integer, default: 0, null: false
  end
end
