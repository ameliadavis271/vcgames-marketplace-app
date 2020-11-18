# frozen_string_literal: true

class Profile < ApplicationRecord
  # Relationships
  belongs_to :user

  # Validations
  validates :fullname, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true

  # allows file to be attached
  has_one_attached :avatar
end
