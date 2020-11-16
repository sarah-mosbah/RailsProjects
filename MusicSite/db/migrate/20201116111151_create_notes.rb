class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
       t.text :content, presence: true
       t.integer :user_id, presence:true
       t.integer :track_id, presence:true

      t.timestamps
    end
    add_index :notes, :track_id
    add_index :notes, :user_id
  end
end
