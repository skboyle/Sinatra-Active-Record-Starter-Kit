class Checkout < ActiveRecord::Base
  belongs_to :book
  belongs_to :reader

  validates :name, presence: true
  validates :checked_out_at, presence: true
end
