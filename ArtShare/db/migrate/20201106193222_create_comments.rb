class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.text :body, null: false
    end

    add_index :comments, :user_id
    add_index :comments, :artwork_id
  end
end
