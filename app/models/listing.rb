# frozen_string_literal: true

class Listing < ApplicationRecord
  include Searchable

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 280 }
  validates :price, presence: true
  has_one_attached :picture
  validates :picture, presence: true

  has_many :payments

  belongs_to :user

  scope :search_by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  # scope :search_by_username, ->(username) { where('name ILIKE ?', "%#{username}%") }

  # scope :search_by_username, -> (username) { joins(:username).merge(User.where('username ILIKE ?', "%#{username}%")) }
  # scope :search_by_brand, ->
end
