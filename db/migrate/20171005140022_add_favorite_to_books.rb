class AddFavoriteToBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.boolean :favorite, default: false
    end
  end
end
