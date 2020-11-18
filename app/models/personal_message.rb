# frozen_string_literal: true

class PersonalMessage < ApplicationRecord
  
  # Relationships
  belongs_to :conversation
  belongs_to :user

  # Validations
  validates :body, presence: true
end
