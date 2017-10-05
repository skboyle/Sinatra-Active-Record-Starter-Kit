class CreateCheckout < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :name, null: false
      t.datetime :checked_out_at, null: false
      t.datetime :checked_in_at
      t.belongs_to :book, null: false
    end
  end
end
