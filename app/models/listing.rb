class Listing < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 280 }
end
