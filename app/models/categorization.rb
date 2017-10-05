class Categorization < ActiveRecord::Base
  belongs_to :book
  belongs_to :category
  validates :book, uniqueness: {scope: :category}
end
