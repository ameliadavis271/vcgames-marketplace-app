class Listing < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 280 }
  belongs_to :user
end
