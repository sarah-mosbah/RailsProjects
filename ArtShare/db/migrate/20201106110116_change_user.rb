class ChangeUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :email, :name
      #t.string :username, null: false, unique: true
    end
  end
end
