class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :book
      t.belongs_to :category

      t.timestamps
    end

    add_index :categorizations, [:book_id, :category_id], unique: true
  end
end
