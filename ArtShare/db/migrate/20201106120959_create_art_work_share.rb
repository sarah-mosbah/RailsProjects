class CreateArtWorkShare < ActiveRecord::Migration[6.0]
  def change
    create_table :art_work_shares do |t|
      t.integer  :artwork_id, presence: true
      t.integer  :viewer_id, presence: true
    end
    add_index :art_work_shares, :artwork_id
    add_index :art_work_shares, :viewer_id
    add_index :art_work_shares, [:artwork_id, :viewer_id], unique: true
  end
end
