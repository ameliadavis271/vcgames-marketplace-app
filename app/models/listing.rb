# frozen_string_literal: true

class Listing < ApplicationRecord
  include Searchable

  # Relationships
  has_many :payments
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 280 }
  validates :price, presence: true
  has_one_attached :picture
  validates :picture, presence: true

  # Scope to search by input that is LIKE a listing name
  scope :search_by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
end
