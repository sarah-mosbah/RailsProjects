class UniqueTitleAndUserId < ActiveRecord::Migration[6.0]
  def change
    add_index :art_works, [:title,:artist_id], unique: true
    add_index :art_works, :image_url, unique: true
  end
end
