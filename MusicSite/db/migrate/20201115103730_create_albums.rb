class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.integer :band_id, null:false
      t.string   :title, null:false
      t.date   :year, null:false
      t.boolean :live, null: false, default: false
      t.timestamps
    end
    add_index :albums, :band_id, unique: true
  end
end
