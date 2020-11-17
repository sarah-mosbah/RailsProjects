class RemoveIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :albums, :band_id
  end
end
