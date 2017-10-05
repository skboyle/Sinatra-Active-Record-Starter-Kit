class CreateReaderId < ActiveRecord::Migration
  class Checkout < ActiveRecord::Base
    belongs_to :book
    belongs_to :reader

    validates :name, presence: true
    validates :checked_out_at, presence: true
  end

  class Reader < ActiveRecord::Base
    validates :full_name, presence: true
  end

  def up
    add_column :checkouts, :reader_id, :integer
    Checkout.all.each do |checkout|
      reader = Reader.find_by(full_name: checkout.name)
      if reader.present?
        checkout.update(reader: reader)
      else
        new_reader = Reader.create(full_name: checkout.name)
        checkout.update(reader: new_reader)
      end
    end
    change_column :checkouts, :reader_id, :integer, null: false
    remove_column :checkouts, :name
  end

  def down
    add_column :checkouts, :name, :string
    Checkout.all.each do |checkout|
      reader = checkout.reader
      checkout.update(name: reader.full_name) if reader.present?
    end
    change_column :checkouts, :name, :string, null: false
    remove_column :checkouts, :reader_id
  end

end
