class DropPostsSubsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :posts_subs
  end
end
