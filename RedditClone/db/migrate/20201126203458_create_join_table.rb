class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :sub_id
    create_join_table :subs, :posts do |t|
        t.index :sub_id
        t.index :post_id
    end
  end
end
